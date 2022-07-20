<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>communityUpdate</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.do">메인</a></li>
				<li><a href="dealList.do">장터</a></li>
				<li class="active"><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>

	<div align="center">
		<div>
			<h1>게시글 수정</h1>
		</div>
		<div>
			<form id="frm" action="updateCommu.do" method="post"
				enctype="multipart/form-data">
				<div>
					<input type="hidden" id="boardId" name="boardId"
						value="${vo.getBoardId }">
					<table border="1">
						<tr>
							<th>#</th>
							<td colspan="3"><select id="comCategory" name="comCategory">
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
								name="comTitle" required="required" value="${vo.getComTitle }"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea rows="6" cols="75" id="comContent" name="comContent" required="required">${vo.getComContent }</textarea></td>
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
					<input type="submit" value="수정">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="취소">
				</div>
			</form>

		</div>

	</div>
</body>
</html>