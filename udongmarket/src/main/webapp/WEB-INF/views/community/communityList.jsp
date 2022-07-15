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
						<th width="200">제목</th>
						<th width="70">작성자</th>
						<th width="130">작성일</th>
						<th width="100">조회수</th>
						
					</tr>
				</thead>
				<tbody id="tb">
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach items="${list }" var="list">
								<tr>
									<td>${list.comCategory }</td>
									<td>${list.comTitle }</td>
									<td>${list.nickname }</td>
									<td>${list.comDate }</td>
									<td>${list.comHit }</td>
								
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" align="center">게시글이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<br>
		<div>
			
				<button type="button" onclick="location.href='communityForm.do'">등록</button>
			
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
			var tbody = $("<tbody />");
			$.each(data, function(index, item) {
						console.log(item);
				var row = $("<tr />").append($("<td />").text(item.comCategory),
						$("<td />").text(item.comTitle),
						$("<td />").text(item.nickname),
						$("<td />").text(item.comDate),
						$("<td />").text(item.comHit)
						
				);
				tbody.append(row);
			});
			$('table').append(tbody);
		}
	</script>


</body>
</html>