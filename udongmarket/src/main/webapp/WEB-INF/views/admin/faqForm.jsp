<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>FAQ FORM</title>
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

	<label id="title">FAQ</label>     
	<br><br>
	<div>
		<form id="frm" action="faqInsert.do" method="post" enctype="multipart/form-data">
			<table id="detailBoard" border="1">
				
				<tr>
					<th id="nickname">닉네임</th>
					<td><input type="text" id="nickname" name="nickname" value="사용자닉네임호출예정" readonly="readonly"></td>
				</tr>
				
				<tr>
					<th id="title">제목</th>
					<td><input type="text" id="faqTitle" name="faqTitle"></td>
				</tr>
				
				<tr>
					<th id="content">내용</th>
					<td><textarea id="faqContent" name="faqContent" rows="10" ></textarea></td>
				</tr>
				<tr>
					<th id="file">첨부파일</th>
					<td><input type="file" id="attach" name="attach"></td>
				</tr>
					
			</table><br>
			<input type="submit" value="전송">
			<input type="button" onclick="location.href='faq.do'" value="취소">
		</form>
		             
	</div>
</body>
</html>
