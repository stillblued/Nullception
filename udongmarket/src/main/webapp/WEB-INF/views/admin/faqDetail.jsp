
<%@page import="co.nullception.udongmarket.faq.vo.FaqVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
</head>

<body>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="main.do">메인</a></li>
			<li><a href="dealList.do">장터</a></li>
			<li><a href="communityList.do">커뮤니티</a></li>
		</ul>
	</div>

	<form name="writeFrm">
		<table border="1" width="90%">

			<%
			FaqVO vo = (FaqVO) request.getAttribute("vo");
			%>
			<tr>
				<input type="hidden" id="boardId" name="boardId" value="<%=vo.getBoardId()%>">
				<th>닉네임</th>
				<td><%=vo.getNickname()%></td>
				<th>작성일</th>
				<td><%=vo.getFaqDate()%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=vo.getFaqTitle()%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" height="100"><%=vo.getFaqContent()%></td>
				<%-- <%=dto.getContent().replace("\r\n", "<br/>")%> --%>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="3"><%=vo.getAttach()%></td>
			</tr>


			<tr>
				<td colspan="4" align="center">
					<!-- if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId()))  -->


					<!-- <button type="button" onclick="faqUpdate(this)">수정</button>
					<button type="button" onclick="location.href='ajaxFaqDelete.do'">삭제</button>  -->
					<button type="button" onclick="location.href='faq.do'">목록
						보기</button>

					<button type="button" onclick="">수정</button>
					<button type="button" onclick="faqDelete(this)">삭제</button>
					<button type="button" onclick="location.href='faq.do';">목록
						보기</button>

				</td>
			</tr>
		</table>

<script type="text/javascript">
	//js 삭제
	function faqDelete(obj) {
		let row = $(obj).parent().parent().get(0);
		let td = row.cells[0];
		let id = $(td).html();

		const xhr = new XMLHttpRequest();
		const url = "ajaxFaqDelete.do?boardId=" + id;
		xhr.onload = function() {
		if (xhr.status >= 200 && xhr.status < 300) {
			if (xhr.response == 1) {
				alert("데이터가 삭제되었습니다.");
				$(row).remove();
			} else {
				alert("삭제 할 수 없습니다.");};
		} else {
			errorCallback(new Error(xhr.stautsText));}};

		xhr.open('GET', url);
		xhr.send();
		}

	//js 업데이트 폼
	function faqUpdate(e) { //get방식 안전하지 않음
		let boardId = (document.getElementById('boardId')).innerHTML;
		console.log(boardId);
		/* location.href='faqUpdate.do?boardId='+boardId; */
		/* location.href='faqDetail.do'; */
		}
</script>
</body>
</html>