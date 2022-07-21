<%@page
	import="com.fasterxml.jackson.databind.introspect.TypeResolutionContext.Empty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>menu</title>
</head>
<body>

	<br>

	<div align="center">
		<a href="main.do"><h1>

				우동<br>마켓

			</h1></a>
	</div>

	<%-- <%
	if (session.getAttribute("nick") == null) {
	%>

	<nav>
		<a href='dealList.do'>장터</a> &nbsp;&nbsp;&nbsp; <a
			href='communityList.do'>커뮤</a>
	</nav>

	<%
	} else {

	String author = (String) session.getAttribute("author");

	if (author.equals("admin")) {
	%>
	<nav>

		<a href='dealList.do'>장터</a> &nbsp;&nbsp;&nbsp; <a
			href='communityList.do'>커뮤</a>
	</nav>

	<%
	} else {
	%>

	<nav>

		<a href='dealList.do'>장터</a> &nbsp;&nbsp;&nbsp; <a
			href='communityList.do'>커뮤</a>
	</nav>

	<%
	}
	%>

	<%
	}
	%> --%>
</body>
</html>