<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="co.nullception.udongmarket.deal.vo.DealVO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 게시판 목록</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>거래 게시글 목록</h1>
	<div>
		<form id="frm">
			<select id="key" name="key">
				<option value="deal_title">제목</option>
				<option value="deal_content">내용</option>
			</select>&nbsp; <input type="text" id="val" name="val">&nbsp;&nbsp; <input
				type="button" value="검색" onclick="dealSearch()">
		</form>
		<br>
		<%
		ArrayList<DealVO> deal = (ArrayList<DealVO>) request.getAttribute("deal");
		for (DealVO dvo : deal) {
		%>
		<table border="1">
			<thead>
				<tr>
					<th>상품이미지</th>
					<th>작성자</th>
					<th>제목</th>
					<th>가격</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%= dvo.getAttach() %></td>
					<td><%= dvo.getNickname() %></td>
					<td><%= dvo.getDealTitle() %></td>
					<td><%= dvo.getPrice() %></td>
					<td><%= dvo.getDealDate() %></td>
					<td><%= dvo.getDealHit() %></td>
				</tr>
				<tr>
					<td colspan="5" align="center">현재 거래중인 상품이 없습니다.</td>
				</tr>
			</tbody>
		</table>
		<br>
		<%
		}
		%>

		<div>
			<!-- 비회원은 글등록 못하게 -->
			<%-- <c:if test="${not empty id}"> --%>
			<button type="button" onclick="location.href='dealForm.do'">판매상품
				등록하기</button>
			<%-- </c:if> --%>
		</div>
	</div>

	<script type="text/javascript">
		function dealSearch() {
			let key = ${'#key'}.val();
			let val = ${'#val'}.val();
			$.ajax({
				url : "ajaxDealSearch.do",
				type : "post",
				data : {key : key, val : val},
				dataType : "json,"
				success : function(result) {
					if (result.length > 0) {
						jsonHtmlConvert(result);
					} else {
						alert("검색한 결과가 없습니다.");
					}
				},
				error : function() {
					
				}
			})
		}
		
		function jsonHtmlConvert(data) {
			$('tbody').remove();
			var tbody = $("<tbody />");
			$.each(data, function(index, item) {
				var row = $("<tr />").append(
						  $("<td />").text(item.dealTitle),
						  $("<td />").text(item.nickname),
						  $("<td />").text(item.price),
						  $("<td />").text(item.dealDate)
				);
				tbody.append(row);
			});
			$('table').append(tbody);
		}
	</script>
</body>
</html>