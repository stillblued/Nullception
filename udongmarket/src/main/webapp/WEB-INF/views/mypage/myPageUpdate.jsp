<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<script src="js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<br>
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
		<div>
			<input type="submit" class="btn btn-info" role="button" style="width: 120px; color: white;" value="수정하기">
			<input type="button" class="btn btn-info" role="button" style="width: 120px; color: white;" value="뒤로가기" onclick="myPage()";>
		</div>
		<br>
		</form>
		<br>
	</div>
	
	<script type="text/javascript">
	function myPage(){
		location.href='myPage.do';
	}
	
	</script>
</body>
</html>