<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<div align="center">
		<form action="updateMember.do" id="frm" method="post">
			<table border="1" class="table table-striped" style="width: 80%;  text-align :center;">
			<thead>
				<tr>
					<td colspan=4> <h4>회원정보 수정</h4></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>회원아이디</td>
					<td><input type="text" id="memberId" name="memberId" class="form-control" value="${member.memberId }" readonly="readonly"></td>
					<td>닉네임</td>
					<td><input type="text" id="nickName" name="nickName" class="form-control" value="${member.nickname }" readonly="readonly"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" id="phone" name="phone" class="form-control" value="${member.phone }"></td>
					<td>이메일</td>
					<td><input type="text" id="email" name="email" class="form-control" value="${member.email }"></td>
				</tr>
				<tr>
					<td>지역</td>
					<td><input type="text" id="location" name="location" class="form-control" value="${member.location }"></td>
					<td>매너온도</td>
					<td><input type="text" id="mannerTemp" name="mannerTemp" class="form-control" value="${member.mannerTemp }" readonly="readonly"></td>
				</tr>
				<tr>
					<td>등급</td>
					<td colspan="3"><input type="text" id="author" name="author" class="form-control" value="${member.author }" readonly="readonly"></td>
				</tr>
			</tbody>
		</table>
		
		
		<input type="submit" class="btn btn-primary btn-block" style="width: 100px;" value="수정하기">
		</form>
	
	</div>
</body>
</html>