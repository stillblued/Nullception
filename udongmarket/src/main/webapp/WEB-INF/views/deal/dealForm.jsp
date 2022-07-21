<%@page import="co.nullception.udongmarket.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
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
				<li class="active"><a href="dealList.do">장터</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>	

<%
	MemberVO mvo = new MemberVO();
%>
<div><h1>거래 게시글 등록</h1></div>
<div>
	<form id="frm" action="dealInsert.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
		<div class="form">
			<table border="1">
				<tr>
					<th>상품이미지</th>
					<td><input type="file" id="file" name="file"></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td><select id="key" name="key">
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
					<th>작성자</th>
					<td><input type="text" id="nickname" name="nickname" value="${nick}" readonly></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" id="dealTitle" name="dealTitle"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="6" cols="50" id="dealContent" name="dealContent"></textarea></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" id="price" name="price"></td>
				</tr>
				<tr>
					<th>거래상태</th>
					<td>
						<input type="radio" name="dealState" value="yes">거래가능
						<input type="radio" name="dealState" value="no">거래중
						<input type="radio" name="dealState" value="done">거래완료
					</td>
				</tr>
			</table>
		</div><br>
		<div>
			<input type="submit" value="등록하기" class="btn btn-primary">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="취소"  class="btn btn-danger" onclick="location.href='dealList.do'">
		</div>
	</form>
</div>
</body>
<script>
function check() {
	if (frm.dealTitle.value == '') {
		alert('제목을 입력하세요.');
		frm.dealTitle.focus();
		return false;
	}

	if (frm.dealContent.value == '') {
		alert('내용을 입력하세요.');
		frm.dealContent.focus();
		return false;
	}

	if (frm.price.value == '') {
		alert('가격을 입력하세요.');
		frm.price.focus();
		return false;
	}
}
</script>
</html>