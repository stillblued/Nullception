<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">

<title>FAQ</title>
</head>
<body>
	
	<div><h1>FAQ</h1></div>
	
	<div>
		<div>
			<form id="suchfrm">
				<label>FAQ검색</label><br> <select id="key" name="key">
					<option value="FAQ_TITLE">제목</option>
					<option value="FAQ_CONTENT">내용</option>
				</select>&nbsp;
			
				<input type="text" id="val" name="val">&nbsp;&nbsp; <input
					type="button" value="검색" onclick="faqSearch()">

			</form>
		</div>
		<label><input type="hidden" id="author" value="${author }" >${author}</label>
		<form id="frm">
			<table border="1">

				<thead>
					<tr>
						<th>NO</th>
						<th>분류</th>
						<th>제목</th>
						<th style="display:none">세션닉네임</th>
						<th>날짜</th>
						<th>닉네임</th>
						<th>상태</th>
						<c:if test="${ author == 'ADMIN' }">
						<th>삭제</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach items="${list}" var="f">
								<%-- <tr class="colored" onclick="faqSelectOne(${f.boardId})"> --%>
								<tr>
									<td id="boardId">${f.boardId }</td>
									<c:if test="${not empty REPORTED_ID }">
										<td>신고</td>
									</c:if>
									<c:if test="${ empty REPORTED_ID }">
										<td>문의</td>
									</c:if>
									
									<td id="title" onclick="faqSelectOne(this)" style="cursor:pointer;">${f.faqTitle}</td>
									
									<td id="nickname" style="display:none"> ${nick } </td>
									<td>${f.faqDate}</td>
									<td id="boardNick">${f.boardNick}</td>
									
									<c:if test="${not empty attach }">
										<td>완료</td>
									</c:if>
									<c:if test="${empty attach }">
										<td>처리중</td>
									</c:if>
									
									<c:if test="${ author == 'ADMIN' }">
									<td><input type="button" onclick="faqDelete(this)" id="delete" name="delete" value="삭제"></td>
									</c:if>
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

			<!-- 유저만 글 등록가능 -->
			<c:if test="${author == 'ADMIN' || author =='USER' || author == 'BLIND' }">
			<input type="button" onclick="location.href='faqForm.do'" id="write" name="write" value="등록">
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
				let row = $("<tr />").append($("<td id='boardId' />").text(item.boardId), 
				                             $("<td />").text(tcategory),
										     $("<td onclick='faqSelectOne(this)' style='cursor:pointer;' />").text(item.faqTitle),
											 $("<td />").text(item.faqDate),
											 $("<td />").text(item.nickname),
											 $("<td />").text(tstate),
											 //$("<td onclick='faqDelete(${item.boardId})' />").text("삭제"));
											$("<td  />").append($("<button onclick='faqDelete(${item.boardId})' />").text("삭제")));
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

		 function faqSelectOne(e) {  //get방식 안전하지 않음
		 	 let author = document.getElementById('author').value;
			 let boardId = ((((e.previousSibling).previousSibling).previousSibling).previousSibling).textContent;
			 let nickname = ((e.nextSibling).nextSibling).textContent;
			 let boardNick = ((((((e.nextSibling).nextSibling).nextSibling).nextSibling).nextSibling).nextSibling).textContent;
			 
			 if(nickname.trim() == boardNick || author == 'ADMIN'){
			 	location.href='faqDetail.do?boardId='+boardId+'&boardNick='+boardNick;	
				 
			 } else{
				 alert('작성자만 열람가능합니다.');
			 }
		}
		 
		
</script>

</body>
</html>