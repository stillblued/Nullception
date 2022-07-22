<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>communityList</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>

	<br>
	<br>
	<div align="center">
		<div>
			<h1 id = "titleName">${udong} 커뮤니티</h1>
			<c:if test = "${not empty location}">
			<button type="button" onclick="changeLo1()">▶</button>
			<button type="button" onclick="changeLo2()">▶▶</button>
			</c:if>
		</div>
		<br>
			<form id="frm" action="communitySearch.do" method="get">
				<select id="key" name="key">
					<option value="com_title">제목</option>
					<option value="com_content">내용</option>
				</select> &nbsp;&nbsp; 
				
				<input type="text" id="val" name="val"> &nbsp;&nbsp;
				<!-- <input type="submit" value="검색"> -->
				<button class="btn btn-success" type="submit">검색</button>&nbsp;
				
				<c:if test="${not empty id}">
				<!-- <a class="btn btn-success" onclick="location.href='communityForm.do'">글쓰기</a> -->
				<button class="btn btn-success" type="button" onclick="location.href='communityForm.do'">글쓰기</button>
				</c:if>
			</form>
		<br>

			<table class="table table-bordered" style="width: 1000px; text-align: center;">
				<thead>
					<tr class="table-light">
						<th width="100">#</th>
						<th width="450">제목</th>
						<th width="70">작성자</th>
						<th width="170">작성일</th>
					</tr>
				</thead>
				<tbody id="tb">

					<c:if test="${empty list}">
						<td colspan="6" align="center">게시물이 없습니다.</td>
					</c:if>
					
					<c:if test="${not empty list}">
						<c:forEach var="list" items="${list}">
							<tr>
								<td
									onclick="location.href='communitySearch.do?key=com_category&val=${list.comCategory }'">${list.comCategory }</td>
								<td
									onclick="location.href='communityDetail.do?boardId=${list.boardId }'">${list.comTitle }</td>
								<td
									onclick="location.href='communitySearch.do?key=nickname&val=${list.nickname }'">${list.nickname }</td>
								<td>${list.comDate.substring(0,11) }</td>
							</tr>
						</c:forEach>
					</c:if>

				</tbody>
				
			</table>
	
		<br>
		
			<c:if test = "${empty key }">
			
			<div id="page">
				<%
				int startPage = (int) request.getAttribute("startPage");
				int endPage = (int) request.getAttribute("endPage");

				for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="communityList.do?pageNum=<%=i%>"><%=i%></a>
				<%
				}
				%>
			</div>
		</c:if>
		<c:if test = "${not empty val} ">
		<div id="page">
				<%
				int startPage = (int) request.getAttribute("startPage");
				int endPage = (int) request.getAttribute("endPage");
				String key = (String) request.getAttribute("key");
				String val = (String) request.getAttribute("val");

				for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="communitySearch.do?key=<%=key%>&val=<%=val%>&pageNum=<%=i%>"><%=i%></a>
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
	
	function changeLo1() {
		
		
		request.setAttribute("udong", LoArr[1]);
			
		location.replace('communityList.do?key=location&val='LoArr[1]);
		
	}
	
	function changeLo2() {
		
		request.setAttribute("udong", LoArr[2]);
		
		location.replace('communityList.do?key=location&val='LoArr[2]);
		
	}
	
	
	
	</script>


</body>
</html>