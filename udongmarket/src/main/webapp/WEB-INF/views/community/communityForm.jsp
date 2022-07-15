<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>communityForm</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 등록</h1>
		</div>
		<div>
			<form id="frm" action="communityInsert.do" method="post"
				enctype="multipart/form-data">
				<div>
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
							<td colspan="3"><input type="text" size="73" id="comTitle"
								name="comTitle"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea rows="6" cols="75" id="comContent"
									name="comContent"></textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3"><input type="file" id="file" name="file">
							</td>
						</tr>
					</table>
				</div>
				<br>
				<div>
					<input type="submit" value="저장">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="취소">
				</div>
			</form>

		</div>

	</div>
</body>
</html>