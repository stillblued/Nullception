<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage.jsp</title>
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<td>회원아이디</td>
				<td>
				${id }
				
				</td>
				<td>닉네임</td>
				<td>${nickname }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${phone }</td>
				<td>이메일</td>
				<td>${email }</td>
			</tr>
			<tr>
				<td>지역</td>
				<td>${location }</td>
				<td>매너온도</td>
				<td>${mannerTemp }</td>
			</tr>
			<tr>
				<td>등급</td>
				<td colspan="3">${author }</td>
			</tr>
		</table>
		<hr>
		<button type="button" onclick="location.href='deletemember.do'">회원탈퇴</button>
	</div>
</body>
</html>