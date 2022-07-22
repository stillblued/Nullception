<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>communityUpdate</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<br>
	<br>
	<div align="center"  width="60%">
		<div>
			<h1>게시글 수정</h1>
		</div>

<br>
		<form id="frm" action="updateCommunity.do" method="post"
			enctype="multipart/form-data">

			<input type="hidden" id="boardId" name="boardId"
				value="${vo.boardId}">

			<table border="1">

				<tr>
					<th>#</th>
					<td colspan="3"><select id="comCategory" name="comCategory">
							<option selected value="${vo.comCategory}">${vo.comCategory}</option>
					</select></td>
				</tr>

				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" size="73" id="comTitle"
						name="comTitle" required="required" value="${vo.comTitle}"></td>
				</tr>

				<tr>
					<th>내용</th>
					<td colspan="3"><textarea rows="6" cols="75" id="comContent"
							name="comContent" required="required">${vo.comContent}</textarea></td>
				</tr>

				<tr>
					<th>첨부파일</th>
					<td><input type="file" id="file" name="file"> <c:if
							test="${not empty vo.attach }">
							<input type="text" id="oldFile" name="oldFile"
								onfocus="this.value=''" value="${vo.attach}" readonly="readonly" />
						</c:if> <input type="hidden" id="oldFileDir" name="oldFileDir"
						value="${vo.attachDir}" /></td>
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