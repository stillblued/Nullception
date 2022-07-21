<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>dealForm</title>
</head>
<body>
<br>
<br>
	
	
	<div align="center"  width="60%">
	<div>
		<h1>거래 수정</h1>
	</div>
	<br>
		<form id="frm" action="dealInsert.do" method="post"
			enctype="multipart/form-data" width="60%">
			<div class="form">
				<table border="1">
					<tr>
						<th>상품이미지</th>
						<td><input type="file" id="file" name="file"> <c:if
								test="${not empty vo.attach }">
								<input type="text" id="oldFile" name="oldFile"
									onfocus="this.value=''" value="${vo.attach}"
									readonly="readonly" />
							</c:if> <input type="hidden" id="oldFileDir" name="oldFileDir"
							value="${vo.attachDir}" /></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select id="dealCategory" name="dealCategory">
								<option value="${vo.dealCategory}">${vo.dealCategory}</option>
						</select></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><input type="text" id="dealTitle" name="dealTitle"
							value="${vo.dealTitle}" required="required"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="number" id="price" name="price"
							value="${vo.price}" required="required"></td>
					</tr>
					<tr>
						<th>설명</th>
						<td><textarea rows="6" cols="50" id="dealContent"
								name="dealContent" required="required">${vo.dealContent}</textarea></td>
					</tr>
					<tr>
						<th>거래상태</th>
						<td><input type="radio" name="dealState" value="거래가능"
							checked="checked">거래가능 <input type="radio"
							name="dealState" value="거래중">거래중 <input type="radio"
							name="dealState" value="거래완료">거래완료</td>
					</tr>
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