<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ FORM</title>
</head>
<body>
	<label id="title">온라인 문의</label>     
	<br><br>
	<div>
		<form id="frm" action="FormInsert()" method="post">
			<table id="detailBoard" border="1">
				<tr>
					<th>분류</th>
				</tr>
				
				<tr>
					<th id="nickname">닉네임</th>
					<td><input type="text" id="nickname" name="nickname" value="사용자닉네임호출예정" readonly="readonly"></td>
				</tr>
				<tr>
					<th id="ph">연락처</th>
					<td><input type="number" id="ph" name="ph"></td>
				</tr>
				<tr>
					<th id="email">이메일</th>
					<td><input type="text" id="email" name="email"></td>
				</tr>
				<tr>
					<th id="content">내용</th>
					<td><textarea id="content" name="content" rows="10" ></textarea></td>
			</table><br>
			<input type="button" onclick="location.href='faq.do'" value="취소">
			<input type="submit" value="전송">
		</form>
		             
	</div>
</body>
</html>
