<%@page import="co.nullception.udongmarket.community.vo.CommunityVO"%>
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
<title>communityDetail</title>
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

	<form name="writeFrm">
		<input type="hidden" id="boardId" name="boardId"
			value="<%=vo.getBoardId()%>" /> <input type="hidden" id="boardNick"
			name="boardNick" value="<%=vo.getNickname()%>" />
		<table id="tb" border="1" width="60%">
			<tr>
				<th>#</th>
				<td colspan="3"><%=vo.getComCategory()%></td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan="3"><%=vo.getComTitle()%></td>
			</tr>

			<tr>
				<th>닉네임</th>
				<td><%=vo.getNickname()%></td>
				<th>작성일</th>
				<td><%=vo.getComDate()%></td>
			</tr>

			<tr>
				<td colspan="4">
					<%
					if (vo.getAttachDir() != null) {
					%> <img src="<%=vo.getAttachDir()%>"> <%
 }
 %> <%=vo.getComContent()%></td>
			</tr>

		</table>

		<%
		if (session.getAttribute("id") != null && session.getAttribute("nick").toString().equals(vo.getNickname())) {
		%>
		<button type="button" onclick="location.href='communityUpdate.do?boardId=<%=vo.getBoardId()%>'">수정</button>
		<button type="button" onclick="location.href='communityDelete.do?boardId=<%=vo.getBoardId()%>'">삭제</button>
		<%
		}
		%>
		<button type="button" onclick="boardReport()">신고</button>
		<button type="button" onclick="location.href='communityList.do'">목록</button>
	</form>
	<hr>

	<form name="coFrm" action="coInsert()" method="post">
		<table border=1 width="60%">
			<thead id="comm">
				<c:forEach items="${coList}" var="list">
					<tr>
						<th>${list.commentsNick }</th>
						<td>${list.commentsContent }</td>
						<td>${list.commentsDate }</td>
						<td><c:if test="${ nick eq list.commentsNick }">
								<button type="button" onclick="coDelete()">삭제</button>
							</c:if>
							<button type="button" onclick="coReport()">신고</button></td>
					</tr>
				</c:forEach>
				<c:if test="${empty coList}">
					<tr id = "coEmpty">
						<td colspan="6" align="center">등록된 댓글이 없습니다.</td>
					</tr>
				</c:if>
			</thead>
			<c:if test="${not empty nick}">
				<tbody>
					<tr>
						<th>${nick}</th>
						<td colspan="2"><textarea id="commentsContent"></textarea></td>
						<td><input type="button" onclick="coInsert()" value="댓글등록"></td>
					</tr>
				</tbody>
			</c:if>
		</table>
	</form>

	<br>

	<script type="text/javascript">
		function coInsert() {
			let Content = $("#commentsContent").val();
			let BoardId = $("#boardId").val();
			let BoardNick = $("#boardNick").val();

			$.ajax({
				url : "ajaxCommentsInsert.do",
				type : "post",
				data : {
					Content : Content,
					BoardId : BoardId,
					BoardNick : BoardNick

				},
				dataType : "Json",
				success : function(result) {
					if (result != null) {
						jsonListConvert(result);

					} else {
						alert("댓글 등록 실패.");
					}
				},
				error : function() {
					console.log("error");
				}
			});
		}

		function jsonListConvert(data) {
			$("#coEmpty").remove();
			let today = timestamp();

			console.log(data);

			let tr = $("<tr />").append(
					$("<th />").text(data.commentsNick),
					$("<td />").text(data.commentsContent),
					$("<td />").text(today),
					$("<td  />").append(
							$("<button onclick='coDelete()' />").text("삭제"),
							$("<button onclick='report()' />").text("신고")

					));

			$('#comm').append(tr);

		};

		function timestamp() {
			var today = new Date();
			today.setHours(today.getHours() + 9);
			return today.toISOString().replace('T', ' ').substring(0, 19);
		}

		function coDelete() {

		}

		function coReport() {

		}
		
		function boaedReport() {
			
		}
		
	</script>



</body>
</html>