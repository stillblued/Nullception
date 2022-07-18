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
	<div><h1>거래 게시글 목록</h1></div>
	 <div>
		<form id="frm">
			<select id="key" name="key">
				<option value="deal_title">제목</option>
				<option value="deal_content">내용</option>
			</select>&nbsp;
			<input type="text" id="val" name="val">&nbsp;&nbsp;
			<input type="button" value="검색" onclick="dealSearch()">
		</form>
		
		<br>
		<!-- <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100" height="100" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/></svg>
            <div class="card-body">
              <p class="card-text"></p>
              <div class="d-flex justify-content-between align-items-center">
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
         </div><br> -->
		
		<table border="1">
			<thead>
				<tr>
					<th>작성자</th>
					<th>제목</th>
					<th>가격</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list}" var="d">
						<tr>
							<td>${d.nickname}</td>
							<td>${d.dealTitle}</td>
							<td>${d.price}</td>
							<td>${d.dealDate}</td>
							<td>${d.dealHit}</td>
						</tr>			
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" align="center">
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
	
	<script type="text/javascript">
		function dealSearch() {
			let key = $("#key").val();
			let val = $("#val").val();
			$.ajax({
				url : "ajaxDealSearch.do",
				type : "post",
				data : {key : key, val : val},
				dataType : "json",
				success : function(result) {
					if(result.length > 0) {
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
						  $("<td />").text(item.nickname),
						  $("<td />").text(item.dealTitle),
						  $("<td />").text(item.price),
						  $("<td />").text(item.dealDate),
						  $("<td />").text(item.dealHit)
				);
				tbody.append(row);
			});
			$('table').append(tbody);
		}
	</script>
</body>
</html>