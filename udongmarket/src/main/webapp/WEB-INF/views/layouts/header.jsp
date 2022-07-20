<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>header</title>
</head>
<body>


	<div>
		<%
		if (session.getAttribute("nick") == null) {
		%>

		<a href='memberLoginForm.do'>로그인</a>&nbsp; <a>/</a>&nbsp; <a
			href='memberJoinForm.do'>회원가입</a>

		<%
		} else {

		String author = (String) session.getAttribute("author");

		if (author.equals("ADMIN")) {
		%>
        ${front }&nbsp;&nbsp;
		<a href='memberLogout.do'>로그아웃</a>&nbsp; <a>/</a>&nbsp; 
		<a href='memberList.do'>관리자페이지</a>

		<%
		} else {
		%>
        ${front }&nbsp;&nbsp;
		<a href='memberLogout.do'>로그아웃</a>&nbsp; <a>/</a>&nbsp; 
		<a href='myPage.do'>마이페이지</a> &nbsp; <a>/</a>&nbsp; 
		<a href='faq.do'>고객센터</a>

		<%
		}
		%>

		<%
		}
		%>
	</div>
</body>
</html>