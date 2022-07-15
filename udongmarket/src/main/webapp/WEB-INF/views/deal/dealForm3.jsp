<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div><h1>거래 게시글 등록</h1></div>
<div>
	<form id="frm" action="dealInsert.do" method="post" enctype="multipart/form-data">
		<div>
			<table border="1">
					<tr>
					<th>상품이미지</th><br>
						<td>
						<input type="file" id="file" name="file"><br>
						</td>
					<th>카테고리</th>
						<td>
							<select id="key" name="key">
								<option value="elec">전자기기</option>
								<option value="clothes">의류/잡화</option>
								<option value="cosmetic">화장품</option>
								<option value="kid">유아동</option>
								<option value="home">생활가전</option>
								<option value="furniture">가구/인테리어</option>
								<option value="pet">반려동물용품</option>
								<option value="book">도서/음반</option>
								<option value="etc">기타</option>
							</select>
						</td>
					<th>제목</th>
						<td>
							<input type="text" id="dealTitle" name="dealTitle">
						</td>
					<th>내용</th>
						<td>
							<textarea rows="6" cols="75" id="dealContent" name="dealContent"></textarea>
						</td>
					<th>가격</th>
						<td>
							<input type="text" id="dealPrice" name="dealPrice">
						</td>
					<th>상품상태</th>
						<td>
							<input type="radio" name="product" value="old">중고상품
							<input type="radio" name="product" value="new">새상품
						</td>
					</tr>
			</table>
		</div><br>
		<div>
			<input type="submit" value="등록하기">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소">
		</div>
	</form>
</div>
</body>
</html>