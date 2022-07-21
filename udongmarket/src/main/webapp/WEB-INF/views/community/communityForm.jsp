<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>communityForm</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>

<br>
<br>

	<div align="center"  width="60%">
		<div>
			<h1>게시글 등록</h1>
		</div>
		<br>
			<form id="frm" action="communityInsert.do" method="post" enctype="multipart/form-data">
					
					<table border="1">
						
						<tr>
							<th>#</th>
							<td colspan="3">
							<select id="comCategory" name="comCategory">
									<option value="알리미">알리미</option>
									<option value="소모임">소모임</option>
									<option value="아르바이트">아르바이트</option>
									<option value="분실실종">분실실종</option>
									<option value="도움요청">도움요청</option>
							</select>
						</tr>

						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" size="73" id="comTitle" name="comTitle" required="required"></td>
						</tr>
						
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea rows="6" cols="75" id="comContent" name="comContent" required="required"></textarea></td>
						</tr>
						
						<tr>
							<th>첨부파일</th>
							<td colspan="3"><input type="file" id="file" name="file"></td>
						</tr>
						
					</table>

				<br>
				
				<div>
					<button type="submit">완료</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset">리셋</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="location.href='communityList.do'">취소</button>
				</div>
				
			</form>

		</div>

<br>
<br>
</body>
</html>