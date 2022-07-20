<%@page import="co.nullception.udongmarket.community.vo.CommunityVO"%>
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
<title>communityDetail</title>
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
				<li><a href="dealList.do">장터</a></li>
				<li class="active"><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>

	<%
	CommunityVO vo = (CommunityVO) request.getAttribute("vo");
	%>

	<div id="box">
		<table id="tb" border="1" width="60%">
			<tr>
				<th>#</th>
				<td colspan="3"><%=vo.getComCategory()%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=vo.getComTitle()%></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><%=vo.getNickname()%></td>
				<th>작성일</th>
				<td><%=vo.getComDate()%></td>
			</tr>

			<tr>
				<td colspan="4">
					<%
					if (vo.getAttachDir() != null) {
					%> <img src="<%=vo.getAttachDir()%>"> <%
 }
 %> <%=vo.getComContent()%></td>
			</tr>
		</table>
	</div>

	<form name="frm" id="frm">
		<c:if test="${not empty nick}">
			<button type="button" onclick="location.href='communityUpdate.do?boardId=<%=vo.getBoardId()%>'">수정</button>
			<button type="button" onclick="location.href='communityDelete.do?boardId=<%=vo.getBoardId()%>'">삭제</button>
		</c:if>
		<button type="button" onclick="location.href='communityList.do'">목록</button>
	</form>





</body>
</html>