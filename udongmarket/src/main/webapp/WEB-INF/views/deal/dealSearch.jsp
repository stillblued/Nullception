<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>dealSearchList</title>
<script src="js/jquery-3.6.0.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.do">메인</a></li>
				<li class="active"><a href="dealList.do">장터</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>


	<div align="center">
		<div>
			<h1>검색 결과</h1>
		</div><br>

		<div>
			<table border="1" width="50%">
			<thead>
				<tr>
					<th>NO</th>
					<th>카테고리</th>
					<th>상품이미지</th>
					<th>작성자</th>
					<th>제목</th>
					<th>가격</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list}" var="d">
						<tr>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.boardId}</td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.dealCategory}</td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'"><img src="${d.attach}"></td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.nickname}</td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.dealTitle}</td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.price}</td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.dealDate}</td>
						</tr>			
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7" align="center">
						검색 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>		
		</table><br>
		
		<div id = "page">
			<%
			int pageCount = (int) request.getAttribute("pageCount");
			int pageBlock = (int) request.getAttribute("pageBlock");
			int startPage = (int) request.getAttribute("startPage");
			int endPage = (int) request.getAttribute("endPage");
			String key = (String)request.getAttribute("key");
			String val = (String)request.getAttribute("val");

			for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="dealSearch.do?key=<%=key%>&val=<%=val%>&pageNum=<%=i%>"><%=i%></a>
			<%
			}
			%>
		</div><br>
		<a href="dealList.do" class="btn btn-primary">목록으로 돌아가기</a><br>
		</div>
	</div>




</body>
</html>