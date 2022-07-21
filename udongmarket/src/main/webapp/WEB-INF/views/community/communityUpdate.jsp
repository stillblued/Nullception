<%@page import="co.nullception.udongmarket.community.vo.CommunityVO"%>
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

	<%
	CommunityVO vo = (CommunityVO) request.getAttribute("vo");
	%>


	<div align="center">
		<div>
			<h1>게시글 수정</h1>
		</div>
		<div>
			<form id="frm" action="updateCommunity.do" method="post"
				enctype="multipart/form-data">
				<div>
					<input type="hidden" id="boardId" name="boardId"
						value="<%=vo.getBoardId()%>">
					<table border="1">
						<tr>
							<th>#</th>
							<td colspan="3"><select id="comCategory" name="comCategory">
									<option selected value="<%=vo.getComCategory()%>"><%=vo.getComCategory()%></option>
							</select>
						</tr>

						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" size="73" id="comTitle"
								name="comTitle" required="required"
								value="<%=vo.getComTitle()%>"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea rows="6" cols="75" id="comContent"
									name="comContent" required="required"><%=vo.getComContent()%></textarea></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input colspan="2" type="file" id="file" name="file">
							</td>
								<td><input type="text" id="oldFile" name="oldFile"
									onfocus="this.value=''" value="<%=vo.getAttach()%>"
									readonly="readonly" /> <input type="hidden" id="oldFileDir"
									name="oldFileDir" value="<%=vo.getAttachDir()%>" /></td>
						</tr>
					</table>
				</div>
				<br>
				<div>
					<button type="submit">수정완료</button>
					&nbsp;&nbsp;&nbsp;
					<button type="reset">다시입력</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='communityList.do'">목록</button>
				</div>
			</form>

		</div>

	</div>
</body>
</html>