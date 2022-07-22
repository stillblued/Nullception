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
	
	<div align="center">
		<form id="frm" action="memberAuthorUpdate.do" method="post">
			<table border="1" class="table table-striped" style="width: 80%; text-align :center;">
			<tr>
				<td colspan="4"><h5>회원정보 수정</h5></td>
			</tr>
			<tr>
				<td>회원아이디</td>
				<td><input type="text" id="memberId" name="memberId" class="form-control" value="${member.memberId }" readonly="readonly"></td>
				<td>닉네임</td>
				<td><input type="text" id="nickname" name="nickname" class="form-control" value="${member.nickname }" readonly="readonly"></td>
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
				<td>기존 등급</td>
				<%-- <td><input type="text" readonly="readonly" id="author" name="author" value="${member.author }"></td> --%>
				<td>${member.author }</td>
				<td>변경할 등급</td>
				<td>
				<select form="frm" id="author" name="author">
				<option value="USER">USER</option>
				<option value="BLIND">BLIND</option>
				</select>
				</td>
			
			</tr>
		</table>
		<input type="submit"  class="btn btn-info" role="button" style="width: 120px; color: white;" value="수정하기">
		</form><!-- onclick="location.href='memberAuthorUpdate.do'" -->
	
	</div>
	<br>
  <script type="text/javascript">
	/* function changeAuthor(e){
		console.log(e.value);
		let formValue = $("#author").val();
		formValue = e.value;
		console.log(formValue);
		//console.log("selected"+selected.value);
	} */
	
	</script>
</body>
</html>