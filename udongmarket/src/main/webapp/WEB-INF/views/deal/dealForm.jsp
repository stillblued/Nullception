<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.6.0.min.js"></script>
<title>dealForm</title>
</head>
<body>
	<br>
	<br>


	<div align="center"  width="60%">
		<div>
			<h1>거래 등록</h1>
		</div>
		<br>
		<form id="frm" action="dealInsert.do" method="post"
			enctype="multipart/form-data"  width="60%">
			<div class="form">
				<table border="1">
					<tr>
						<th>상품이미지</th>
						<td><input type="file" id="file" name="file"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select id="dealCategory" name="dealCategory">
								<option value="전자기기">전자기기</option>
								<option value="의류/잡화">의류/잡화</option>
								<option value="화장품">화장품</option>
								<option value="유아동">유아동</option>
								<option value="생활가전">생활가전</option>
								<option value="가구/인테리어">가구/인테리어</option>
								<option value="반려동물용품">반려동물용품</option>
								<option value="도서/음반">도서/음반</option>
								<option value="기타">기타</option>
						</select></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><input type="text" id="dealTitle" name="dealTitle"
							required="required"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="number" id="price" name="price"
							required="required"></td>
					</tr>

					<tr>
						<th>설명</th>
						<td><textarea rows="6" cols="50" id="dealContent"
								name="dealContent" required="required"></textarea></td>
					</tr>

					<input type="hidden" id="dealState" name="dealState" value="거래가능">

				</table>
			</div>
			<br>
			<div>
				<button type="submit">완료</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset">리셋</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="location.href='dealList.do'">취소</button>
			</div>
		</form>
	</div>

	<br>
	<br>


</body>

</html>