<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 사용자 목록</title>
</head>
<body>
	<div>
		<!-- 메인 > 관리자페이지 > 상세 카테고리 노출 -->
		<nav>
			
				<a href="memberList.do">사용자 목록</a>&nbsp;&nbsp;&nbsp;
				<a href="faq.do">FAQ</a>

		</nav>
		<br>
		<br> 
		<table border=1>
			<thead>
				<tr>
					<th>레벨</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>매너온도</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="m">
					<tr>
						<td>${m.author}</td>
						<td>${m.memberId}</td>
						<td>${m.nickname}</td>
						<td>${m.email}</td>
						<td>${m.mannerTemp}</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
	</div>
</body>
</html>