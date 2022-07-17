<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원정보 수정</h3>
	<div align="center">
		<form action="updateMember.do" id="frm" method="post">
			<table border="1">
			<tr>
				<td>회원아이디</td>
				<td><input type="text" id="memberId" name="memberId" value="${member.memberId }" readonly="readonly"></td>
				<td>닉네임</td>
				<td><input type="text" id="nickName" name="nickName" value="${member.nickname }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" id="phone" name="phone" value="${member.phone }"></td>
				<td>이메일</td>
				<td><input type="text" id="email" name="email" value="${member.email }"></td>
			</tr>
			<tr>
				<td>지역</td>
				<td><input type="text" id="location" name="location" value="${member.location }"></td>
				<td>매너온도</td>
				<td><input type="text" id="mannerTemp" name="mannerTemp" value="${member.mannerTemp }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>등급</td>
				<td colspan="3"><input type="text" id="author" name="author" value="${member.author }" readonly="readonly"></td>
			</tr>
		</table>
		
		
		<input type="submit" value="수정하기">
		</form>
	
	</div>
</body>
</html>