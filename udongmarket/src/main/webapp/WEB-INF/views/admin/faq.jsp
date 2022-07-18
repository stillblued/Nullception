<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
</head>
<body>
	<div id="nav">
		<ul>
			<li><a href="memberList.do">사용자 목록</a></li>
			<li><a href="faq.do">FAQ</a></li>
		</ul>
	</div>

	<div>
		<form id="suchfrm">
			<label>FAQ검색</label><br>
			<select id ="key" name="key">
			<option value="FAQ_TITLE">제목</option>
			<option value="FAQ_CONTENT">내용</option>
			</select>&nbsp;
			<!-- List<FaqVO> faqSerch(String val); val의 값으로 들어감  -->
			<input type="text" id="val" name="val">&nbsp;&nbsp;
			<input type="button" value="검색" onclick="faqSearch()">
			
		</form>
	</div>
	<form name="frm">
		<div>
			<label>전체</label> <label>문의</label> <label>신고</label> <label>기타</label>
		</div>
		<table border="1">
			<thead>
				<tr>
					<th>분류</th>
					<th>제목</th>
					<th>날짜</th>
					<th>닉네임</th>
					<th>상태</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="f">
					<tr>
						<c:if test ="${not empty REPORTED_ID }" > <td> 신고</td> </c:if>
						<c:if test = "${ empty REPORTED_ID }"  > <td> 문의</td> </c:if>
						<td>${f.faqTitle}</td>
						<td>${f.faqDate}</td>
						<td>${f.nickname}</td>
						<c:if test ="${not empty answer_content }" > <td> 완료</td> </c:if>
						<c:if test = "${ empty answer_content }"  > <td> 처리중</td> </c:if>
						<td><input type="button" onclick="location.href='/udongmarket/faqDelete.do?boardId=${f.boardId}';" id="faqdelete" name="faqdelete" value="삭제"></td>
					</tr>
				</c:forEach>
				 <!-- <input type="hidden" id="boardId" name="boardId"> -->

			</tbody>
		</table>
		<input type="button" onclick="location.href='faqForm.do'" id="write"
			name="write" value="등록">
	</form>
	
	<script type="text/javascript">
	function faqSearch(){
		let key = ${'#key'}.val();
		let val = ${'#val'}.val();
		$.ajax({
			url : "ajaxFaqSearch.do",
			type : "post",
			data : {key : key, val : val},
			dataType : "Json",
			success : function(result){
				if(result.length > 0){
					jsonHtmlConvert(result);
				} else{
					alert("검색한 결과가 없습니다.");
				}
			},
			error : function(err){
				alert("알 수 없는 에러입니다.");
			}
		})
	}
	function jsonHtmlConvert(data) {
		$('tbody').remove();
		var tbody = $("<tbody />");
		$.each(data, function(index, item) {
			var row = $("<tr />").append(
					  $("<td />").text(item.faqTitle),
					  $("<td />").text(item.faqDate),
					  $("<td />").text(item.nickname),
			);
			tbody.append(row);
		});
		$('table').append(tbody);
	}
		
	</script>
</body>
</html>