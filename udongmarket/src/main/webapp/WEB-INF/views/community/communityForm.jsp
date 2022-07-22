<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo.css">
<link rel="stylesheet" href="css/custom.css">
<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="css/fontawesome.min.css">
<script src="js/jquery-3.6.0.min.js"></script>
<title>communityForm</title>
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
					<table class="table table-bordered" style="width: 1000px;">
						<tr>
							<th class="table-light">#</th>
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
							<th class="table-light">제목</th>
							<td colspan="3"><input type="text" size="73" id="comTitle" name="comTitle" required="required"></td>
						</tr>
						
						<tr>
							<th class="table-light">내용</th>
							<td colspan="3"><textarea rows="6" cols="75" id="comContent" name="comContent" required="required"></textarea></td>
						</tr>
						
						<tr>
							<th class="table-light">첨부파일</th>
							<td colspan="3"><input type="file" id="file" name="file"></td>
						</tr>
					</table>

				<br>
				
				<div>
				<button class="btn btn-success" type="submit">등록</button>
				<!-- <button type="submit">완료</button> -->
				&nbsp;&nbsp;&nbsp;
				<button class="btn btn-success" type="reset">리셋</button>
				<!-- <button type="reset">리셋</button> -->
				&nbsp;&nbsp;&nbsp;
				<button class="btn btn-success" type="button" onclick="location.href='dealList.do'">목록가기</button>
				<!-- <button type="button" onclick="location.href='communityList.do'">취소</button> -->
				</div>
				
			</form>

		</div>

<br>
<br>

	<!-- Start Script -->
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/templatemo.js"></script>
    <script src="js/custom.js"></script>
    <!-- End Script -->

</body>
</html>