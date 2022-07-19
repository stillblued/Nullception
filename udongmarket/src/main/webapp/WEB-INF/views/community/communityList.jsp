<%@page import="java.io.File"%>
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

	<div align="center">
		<div>
			<h1>우동 커뮤니티</h1>
		</div>

		<div>
			<form id="frm">
				<select id="key" name="key">
					<option value="com_title">제목</option>
					<option value="com_content">내용</option>
					<option value="nickname">작성자</option>

				</select> &nbsp; <input type="text" id="val" name="val"> &nbsp;&nbsp;
				<input type="button" value="검색" onclick="communitySearch()">

			</form>
		</div>

		<br>

		<div>
			<table border="1" id="table">
				<thead>
					<tr>
						<th width="70">#</th>
						<th width="450">제목</th>
						<th width="70">작성자</th>
						<th width="170">작성일</th>
					</tr>
				</thead>
				<tbody id="tb">
				

					<c:if test="${empty list}"><td colspan="6" align="center">등록된 게시물이 없습니다.</td></c:if>
					<c:if test="${not empty list}">
						<c:forEach var="list" items="${list}">
							<tr onclick = "location.href='communityContent.do'">
								<td>${list.comCategory }</td>
								<td>${list.comTitle }</td>
								<td>${list.nickname }</td>
								<td>${list.comDate }</td>
							</tr>
							
							<img src = "${list.attachDir}">
						</c:forEach>
					</c:if>
					
				
				
				
				
				</tbody>
			</table>
		</div>

		<br>

		<div id = "page">
			<%
			int pageCount = (int) request.getAttribute("pageCount");
			int pageBlock = (int) request.getAttribute("pageBlock");
			int startPage = (int) request.getAttribute("startPage");
			int endPage = (int) request.getAttribute("endPage");

			for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="communityList.do?pageNum=<%=i%>"><%=i%></a>
			<%
			}
			%>
		</div>

		<br>
		<div>
			<c:if test="${not empty nickname }">
				<button type="button" onclick="location.href='communityForm.do'">등록</button>
			</c:if>
		</div>
	</div>

	<script>
		function communitySearch() {
			let key = $("#key").val();
			let val = $("#val").val();
			$.ajax({
				url : "ajaxCommunitySearch.do",
				type : "post",
				data : {
					key : key,
					val : val
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					if (result.length > 0) {
						jsonHtmlConvert(result);
					} else {
						alert("검색한 결과가 없습니다.")
					}
				},
				error : function() {
				}
			})
		}
		function jsonHtmlConvert(data) {
			$('tbody').remove();
			$('#page').remove();
			var tbody = $("<tbody />");
			$.each(data, function(index, item) {
				console.log(item);
				var row = $("<tr />").append(
						$("<td />").text(item.comCategory),
						$("<td />").text(item.comTitle),
						$("<td />").text(item.nickname),
						$("<td />").text(item.comDate),
				);
				tbody.append(row);
			});
			$('table').append(tbody);
		}
	</script>


</body>
</html>