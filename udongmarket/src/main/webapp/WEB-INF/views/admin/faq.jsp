<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>FAQ</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.do">메인</a></li>
				<li><a href="dealList.do">장터</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>	

	<div id="nav">
		<ul>
			<li><a href="memberList.do">사용자 목록</a></li>
			<li><a href="faq.do">FAQ</a></li>
		</ul>
	</div>

	<div>
		<div>
			<form id="suchfrm">
				<label>FAQ검색</label><br> <select id="key" name="key">
					<option value="FAQ_TITLE">제목</option>
					<option value="FAQ_CONTENT">내용</option>
				</select>&nbsp;
				<!-- List<FaqVO> faqSerch(String val); val의 값으로 들어감  -->
				<input type="text" id="val" name="val">&nbsp;&nbsp; <input
					type="button" value="검색" onclick="faqSearch()">

			</form>
		</div>
		<div>
			<label>전체</label> <label>문의</label> <label>신고</label> <label>기타</label>
		</div>
		<form id="frm">
			<table border="1">

				<thead>
					<tr>
						<th>NO</th>
						<th>분류</th>
						<th>제목</th>
						<th>날짜</th>
						<th>닉네임</th>
						<th>상태</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach items="${list}" var="f">
								<%-- <tr class="colored" onclick="faqSelectOne(${f.boardId})"> --%>
								<tr>
									<td>${f.boardId }</td>
									<c:if test="${not empty REPORTED_ID }">
										<td>신고</td>
									</c:if>
									<c:if test="${ empty REPORTED_ID }">
										<td>문의</td>
									</c:if>
									<td class="colored" onclick="faqSelectOne()">${f.faqTitle}</td>
									<td>${f.faqDate}</td>
									<td>${f.nickname}</td>
									<c:if test="${not empty answer_content }">
										<td>완료</td>
									</c:if>
									<c:if test="${ empty answer_content }">
										<td>처리중</td>
									</c:if>
									<td><input type="button" onclick="faqDelete(this)" id="delete" name="delete" value="삭제"></td>
									<%-- <td><a href="faqDelete.do?boardId=${f.boardId}">삭제</a></td> --%>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" align="center">게시글이 존재하지 않습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<c:if test="${author == 'USER' || not empty nickname }">
			<input type="button" onclick="location.href='faqForm.do'" id="write"
				name="write" value="등록">
				</c:if>
		</form>
	</div>
	<script type="text/javascript">
		/* faq 검색 */
		function faqSearch() {
			let key = $("#key").val();
			let val = $("#val").val();
			$.ajax({
				url : "ajaxFaqSearch.do",
				type : "post",
				data : {
					key : key,
					val : val
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					if (result.length > 0) {
						jsonHtmlConvert(result);
					} else {
						alert("검색한 결과가 없습니다.");
					}
				},
				error : function() {
					console.log("error");
				}
			})
		}
		function jsonHtmlConvert(data) {
			$('tbody').remove();
			var tbody = $("<tbody />");
			var tcategory = "문의";
			var tstate = "처리중"
			$.each(data, function(index, item) {
				if (item.REPORTED_ID != null) {
				    tcategory = "신고";};
				if (item.answer_content != null) {
					tstate = "완료";};
				var row = $("<tr />").append($("<td />").text(tcategory),
										     $("<td />").text(item.faqTitle),
											 $("<td />").text(item.faqDate),
											 $("<td />").text(item.nickname),
											 $("<td />").text(tstate),
											 $("<td />").append($("<button onclick='faqDelete(${item.boardId})'>").text("삭제")));
								tbody.append(row);
							});
			$('table').append(tbody);
		}/* faq 검색 끝 */

		 function faqDelete(obj){	
		let row = $(obj).parent().parent().get(0);
		let td = row.cells[0];
		let id = $(td).html();		
		
			const xhr = new XMLHttpRequest();
		const url = "ajaxFaqDelete.do?boardId="+id;
		xhr.onload = function(){
			if(xhr.status >= 200 && xhr.status < 300){
				if(xhr.response == 1) {
					alert("데이터가 삭제되었습니다.");
					$(row).remove();
				}else {
					alert("삭제 할 수 없습니다.");
				};
			}else {
				errorCallback(new Error(xhr.stautsText));
			}
		};
	
		xhr.open('GET',url);
		xhr.send(); 
	}
		 function faqSelectOne() {  //get방식 안전하지 않음
				/* location.href='faqDetail.do?boardId='+id; */	
			 location.href='faqDetail.do';
			}
	</script>
</body>
</html>