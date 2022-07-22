<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DealList</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style type="text/css">

* {
text-align: center;

}

table {
display: inline-block;
margin: 10px;

}

</style>

</head>
<body>
	<br>
	<br>
	<div align="center">
		<div>
			<h1 id = "titleName">${udong } 장터</h1>
			<c:if test = "${not empty location}">
			<button type="button" onclick="changeLoca1()">▶</button>
			<button type="button" onclick="changeLoca2()">▶▶</button>
			</c:if>
		</div>
		<br>
		<form id="frm" action="dealSearch.do" method="get">
			<select id="key" name="key">
				<option value="deal_title">상품명</option>
				<option value="deal_content">설명</option>
			</select> &nbsp;&nbsp; <input type="text" id="val" name="val">
			&nbsp;&nbsp; <button class="btn btn-success" type="submit">검색</button>
			
			<c:if test="${not empty id}">
				<button class="btn btn-success" type="button" onclick="location.href='dealForm.do'">거래하기</button>
				<!-- <a class="btn btn-success" onclick="location.href='dealForm.do'">거래하기</a> -->
		</c:if>
		</form>

		<br>

		<c:forEach var="list" items="${list}">

			<table border="1">
				<tr onclick="location.href='dealDetail.do?boardId=${list.boardId }'">
					<td colspan="2">
					<c:if test = "${not empty list.attach }">
					<img src="${list.attachDir }" width = "300px" height="300px">
					</c:if>
					<c:if test = "${empty list.attach }">
					<img src="fileSave/empty.png" width = "300px" height="300px">
					</c:if>
					</td>
				</tr>
				<tr>
					<th>${list.dealTitle }</th>
					<th>${list.price } 원</th>
				</tr>
				<tr
					onclick="location.href='dealSearch.do?key=deal_category&val=${list.dealCategory }'">
					<td>${list.dealCategory }</td>
					<td>${list.dealDate.substring(0,11) }</td>
				</tr>

			</table>

		</c:forEach>


		<br>

		<c:if test="${empty key }">

			<div id="page">
				<%
				int startPage = (int) request.getAttribute("startPage");
				int endPage = (int) request.getAttribute("endPage");

				for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="dealList.do?pageNum=<%=i%>"><%=i%></a>
				<%
				}
				%>
			</div>
		</c:if>
		<c:if test="${not empty val} ">
			<div id="page">
				<%
				int startPage = (int) request.getAttribute("startPage");
				int endPage = (int) request.getAttribute("endPage");
				String key = (String) request.getAttribute("key");
				String val = (String) request.getAttribute("val");

				for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="dealSearch.do?key=<%=key%>&val=<%=val%>&pageNum=<%=i%>"><%=i%></a>
				<%
				}
				%>
			</div>

		</c:if>
	</div>

	<br>
	<br>

	<script type="text/javascript">
	
	HttpSession session = request.getSession();
	String Location = (String)session.getAttribute("location");
	String[] LoArr = Location.split(" ");
	
	function changeLoca1() {
		request.setAttribute("udong", LoArr[1]);
		
		location.replace('dealList.do?key=location&val='LoArr[1]);
		
	}
	
	function changeLoca2() {
		request.setAttribute("udong", LoArr[2]);
		
		location.replace('dealList.do?key=location&val='LoArr[2]);
		
	}
	
	
	
	</script>


</body>
</html>