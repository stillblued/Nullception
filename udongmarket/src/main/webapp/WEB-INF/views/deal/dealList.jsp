<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 게시판 목록</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div align="center">
	<div><h1>거래 게시글 목록</h1></div>
	<div>
		<form id="frm">
			<select id="key" name="key">
				<option value="deal_title">제목</option>
				<option value="deal_content">내용</option>
			</select>&nbsp;
			<input type="text" id="val" name="val">&nbsp;&nbsp;
			<input type="button" value="검색" onclick="noticeSearch()">
		</form>
		<table border="1">
			<thead>
				<tr>
					<th>제목</th>
					<th>닉네임</th>
					<th>가격</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list}" var="d">
						<tr>
							<td>${d.dealTitle}</td>
							<td>${d.memberNickname}</td>
							<td>${d.dealPrice}</td>
							<td>${d.dealDate}</td>
						</tr>			
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" align="center">
						현재 거래중인 상품이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>		
		</table><br>
		<div>
			<!-- 비회원은 글등록 못하게 -->
			<%-- <c:if test="${not empty id}"> --%>
				<button type="button" onclick="location.href='dealForm.do'">판매상품 등록하기</button>
			<%-- </c:if> --%>
		</div>
	</div>
</div>
	
	<script type="text/javascript">
		function noticeSearch() {
			let key = ${'#key'}.val();
			let val = ${'#val'}.val();
			$.ajax({
				url : "ajaxDealSearch.do",
				type : "post",
				data : {key : key, val : val},
				dataType : "Json,"
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
						  $("<td />").text(item.memberNickname),
						  $("<td />").text(item.dealPrice),
						  $("<td />").text(item.dealDate)
				);
				tbody.append(row);
			});
			$('table').append(tbody);
		}
	</script>
</body>
</html>