<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
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
				<li class="active"><a href="memberList.do">사용자 목록</a></li>
			    <li><a href="faq.do">FAQ</a></li>
			</ul>
		</div>
	</nav>	
	<h3>회원정보 수정</h3>
	
	<div align="center">
		<form id="frm" action="memberAuthorUpdate.do" method="post">
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
				<td>기존 등급</td>
				<td><input type="text" readonly="readonly" id="author" name="author" value="${member.author }"></td>
				<td>변경할 등급</td>
				<td>
				<select id="authorChange" id="author" name="author"><!-- <onchange="changeAuthor(this)"> -->
				<option value="USER">USER</option>
				<option value="BLIND">BLIND</option>
				</select>
				</td>
			
			</tr>
		</table>
		<input type="submit"  value="수정하기">
		</form><!-- onclick="location.href='memberAuthorUpdate.do'" -->
	
	</div>
	
<!-- 	<script type="text/javascript">
	function changeAuthor(e){
		let selected = $("#author option:selected");
		selected.value = e.value;
		//console.log("selected"+selected.value);
	}
	
	</script> -->
</body>
</html>