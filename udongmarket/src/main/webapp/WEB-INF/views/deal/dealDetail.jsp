<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="co.nullception.udongmarket.deal.vo.DealVO" %>
<%@ page import="co.nullception.udongmarket.member.vo.MemberVO" %>
<%@ page import="co.nullception.udongmarket.deal.serviceimpl.DealServiceImpl" %>
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
		String memberId = null;
		if (session.getAttribute("memberId") != null) {
			memberId = (String) session.getAttribute("memberId");
		}
		int boardId = 0;
		if (request.getParameter("boardId") != null) {
			boardId = Integer.parseInt(request.getParameter("boardId"));
		}
		if (boardId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'dealList.jsp'");
			script.println("</script>");
		}	
		DealVO vo = (DealVO)request.getAttribute("vo");
		MemberVO mvo = new MemberVO();
	%>
	<table border="1" width="90%">
		<thead>
			<tr>
				<th colspan="2" style="text-align: center;">게시글 상세보기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>카테고리</td>
				<td><%= vo.getDealCategory() %></td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td><%= vo.getAttach() %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%= mvo.getMemberId() %></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td><%= vo.getDealDate() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%= vo.getDealTitle() %></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><%= vo.getPrice() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td height="100"><%= vo.getDealContent() %><%-- <%=vo.getDealContent().replaceAll(" ", "&nbsp;")
						    								   					 .replaceAll("<", "&lt;")
					     								     					 .replaceAll(">", "&gt;")
				        								 						 .replaceAll("\n", "<br>") %> --%></td>
			</tr>
			<tr>	
				<td>조회수</td>
				<td><%= vo.getDealHit() %></td>
			</tr>
		</tbody>
	</table><br>
		<a href="dealList.do" class="btn btn-primary">목록</a>
		
			<%-- <c:if test="${memberId != null && memberId.equals(mvo.getMemberId())}"> --%>
			<%
				if (memberId != null && memberId.equals(mvo.getMemberId())) { // 작성자가 글을 클릭했을때
			%>
				<a href="dealUpdate.do?memberId=<%= memberId %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('삭제하시겠습니까?')" href="dealDelete.do?memberId=<%= memberId %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
			<%-- </c:if> --%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>