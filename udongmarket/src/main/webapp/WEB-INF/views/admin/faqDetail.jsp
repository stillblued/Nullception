<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
				<li><a href="dealList.do">장터</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>	


	<form name="writeFrm">
		<table border="1" width="90%">
			<tr>
				<td>작성자</td>
				<td></td>
				<td>작성일</td>
				<td></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" height="100"><%-- <%=dto.getContent().replace("\r\n", "<br/>")%> --%></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					
					<!-- if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId()))  -->
					
					<button type="button" onclick="">수정</button>
					<button type="button" onclick="faqDelete(this)">삭제</button>
					<button type="button" onclick="location.href='faq.do';">목록 보기</button>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>