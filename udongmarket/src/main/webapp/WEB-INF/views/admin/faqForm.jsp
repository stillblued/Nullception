<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ FORM</title>
</head>
<body>
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
