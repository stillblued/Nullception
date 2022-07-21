<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="co.nullception.udongmarket.deal.vo.DealVO" %>
<%@ page import="co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
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
				<li class="active"><a href="dealList.do">장터</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>	

	<%
		DealVO vo = (DealVO)request.getAttribute("vo");
	%>
	<div><h3>게시글 수정</h3></div>
	<form action="dealUpdate.do" id="frm" method="post" onsubmit="return fnSubmit()">
	<%-- <input type="hidden" name="boardId" value="${vo.boardId}"> --%>
	<table border="1" width="50%">
		<tbody>
			<tr>
				<td>카테고리</td>
				<td>${vo.dealCategory}</td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td>
				<c:if test="${vo.attachDir != null}">
					<%-- <%
						if (vo.getAttachDir() != null) {
					%> --%>
						<img src="${vo.attachDir}">
					<%-- <%
						}
					%> --%>
				</c:if>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" id="nickname" name="nickname" value="${vo.nickname}" readonly></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td><input type="text" id="dealDate" name="dealDate" value="${vo.dealDate.substring(0,11)}" readonly></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="dealTitle" name="dealTitle" value="${vo.dealTitle}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" id="price" name="price" value="${vo.price}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="6" cols="50" id="dealContent" name="dealContent">${vo.dealContent}</textarea></td>
			</tr>
			
		</tbody>
	</table><br>
	</form>
		<div>
			<input type="submit" value="수정하기" class="btn btn-primary" onclick="location.href='dealUpdate.do'">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소"  class="btn btn-danger" onclick="location.href='dealList.do'">
		</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
<script>
	function fnSubmit() {
		if (confirm('수정하시겠습니까?')) {
			return true;
		}
		return false;
	}
</script>
</html>