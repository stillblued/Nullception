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
		<div class="form">
			<section class="insertForm">
				<div class="deal">
					상품이미지
					<input type="file" id="file" name="file"><br>
				</div>
				<div class="deal">
					카테고리
					<select id="key" name="key">
						<option value="전자기기">전자기기</option>
						<option value="의류/잡화">의류/잡화</option>
						<option value="화장품">화장품</option>
						<option value="유아동">유아동</option>
						<option value="생활가전">생활가전</option>
						<option value="가구/인테리어">가구/인테리어</option>
						<option value="반려동물용품">반려동물용품</option>
						<option value="도서/음반">도서/음반</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<div class="deal">
					제목
					<input type="text" id="dealTitle" name="dealTitle">
				</div>
				<div class="deal">
					내용
					<textarea rows="6" cols="75" id="dealContent" name="dealContent"></textarea>
				</div>
				<div class="deal">
					가격
					<input type="text" id="dealPrice" name="dealPrice">
				</div>
			</section>
		</div><br>
		<div>
			<input type="submit" value="등록하기">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소">
		</div>
	</form>
</div>
</body>
</html>