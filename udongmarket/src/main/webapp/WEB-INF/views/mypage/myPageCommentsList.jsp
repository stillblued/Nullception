<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageCommentsList.jsp</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h3>거래게시판</h3>
	<table border = "1" id="dealCommentsList">
		<thead>
			<tr> <!-- 표시할 셀은 나중에 수정 / ajax로 바꾸는게 나을듯 -->
				<th>글제목</th>
				<th>카테고리</th>
				<th>작성일자</th>
				<th>거래상태</th>
				<th>지역</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${dealCommentsList }" var="dealCommentsList">
				<tr>
					<td>${dealCommentsList.dealTitle }</td>
					<td>${dealCommentsList.dealCategory }</td>
					<td>${dealCommentsList.dealDate }</td>
					<td>${dealCommentsList.dealState }</td>
					<td>${dealCommentsList.location }</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>
	
	<h3>커뮤니티 게시판</h3>
	<table border = "1" id="commCommentsList">
		<thead>
			<tr> <!-- 표시할 셀은 나중에 수정 / ajax로 바꾸는게 나을듯 -->
				<th>글제목</th>
				<th>카테고리</th>
				<th>작성일자</th>
				<th>지역</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${commCommentsList }" var="commCommentsList">
				<tr>
					<td>${commCommentsList.comTitle }</td>
					<td>${commCommentsList.comCategory }</td>
					<td>${commCommentsList.comDate }</td>
					<td>${commCommentsList.location }</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>
	<br>
	<button type="button" onclick="commentCheck()">확인</button>
	
	<script>
	function commentCheck(){
		$.ajax({
			url : "ajaxUpdateComments.do",
			type : "post",
			dataType : "Json",
			success : function(result){
				console.log(result);
			},
			error: function(){
				console.log("error");
			}
		})   
	}
	
	</script>
	
</body>
</html>