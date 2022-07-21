<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="co.nullception.udongmarket.deal.vo.DealVO" %>
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
		DealVO vo = (DealVO)request.getAttribute("vo");
	%>

	<div><h3>게시글 상세보기</h3></div>
	<form name="frm">
	<input type="hidden" id="boardId" name="boardId" value="${vo.boardId}">
	<table border="1" class="table table-striped" style="width: 80%;  text-align :center;">
		<thead>
			<tr>
				<th colspan="2" style="text-align: center;">게시글 상세보기</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<th>카테고리</th>
				<td>왜 안나오냐고 ${vo.dealCategory}</td>
				<th>작성자</th>
				<td>${vo.nickname}</td>
				<th>작성일자</th>
				<td>${vo.dealDate.substring(0,11)}</td>
			</tr>
			<tr>
				<th>상품이미지</th>
				<td colspan="6">
					<%-- <%
						if (vo.getAttachDir() != null) {
					%>
						<img src="<%= vo.getAttachDir() %>">
					<%
						}
					%> --%>
				<c:if test="${vo.attachDir != null}">
						<img src="${vo.attachDir}">
				</c:if>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="1">${vo.dealTitle}</td>
				<th>가격</th>
				<td colspan="1">${vo.price}</td>
				<th>거래상태</th>
				<td colspan="1">${vo.dealState}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td height="100" colspan="6">${vo.dealContent}</td>
			</tr>
			<tr>
				<th>거래상태</th>
				<td colspan="5">
				<c:choose>
					<c:when test="${vo.dealState eq 'yes'}">
					<input type="radio" name="dealState" value="yes" checked="checked">거래가능
					<input type="radio" name="dealState" value="no">거래중
					<input type="radio" name="dealState" value="done">거래완료
					</c:when>
					<c:when test="${vo.dealState eq 'no'}">
					<input type="radio" name="dealState" value="yes">거래가능
					<input type="radio" name="dealState" value="no" checked="checked">거래중
					<input type="radio" name="dealState" value="done">거래완료
					</c:when>
					<c:otherwise>
					<input type="radio" name="dealState" value="yes">거래가능
					<input type="radio" name="dealState" value="no">거래중
					<input type="radio" name="dealState" value="done" checked="checked">거래완료
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</tbody>
	</table><br>
	</form>
		<a href="dealList.do" class="btn btn-primary">목록</a>
		
				<%
					if (vo.getNickname().equals(session.getAttribute("nick")) || session.getAttribute("author").equals("ADMIN")) {
				%>
			<%-- <c:if test="${vo.nickname eq getNickname()}"> --%>
				<a href="dealUpdateForm.do?boardId=<%= vo.getBoardId() %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('삭제하시겠습니까?')" href="dealDelete.do?boardId=<%= vo.getBoardId() %>" class="btn btn-danger">삭제</a>
			<%-- </c:if> --%>
				<%
					}
				%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>