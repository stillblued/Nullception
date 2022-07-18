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
<title>menu</title>
</head>
<body>

	<nav>
		
			<button type="button" onclick="location.href='memberLoginForm.do'">로그인</button>&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="location.href='main.do'">로그아웃</button>&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="location.href='memberJoinForm.do'">회원가입</button>&nbsp;&nbsp;&nbsp;
      		<button type="button" onclick="location.href='mypage.do'">마이페이지</button>&nbsp;&nbsp;&nbsp;
      		<button type="button" onclick="location.href='memberList.do'">관리자페이지</button>&nbsp;&nbsp;&nbsp;
      		<button type="button" onclick="location.href='dealList.do'">장터</button>&nbsp;&nbsp;&nbsp;
      		<button type="button" onclick="location.href='communityList.do'">커뮤</button>
		
	</nav>

</body>
</html>