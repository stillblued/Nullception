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
			<h1>게시글 목록</h1>
		</div>
		<div>
			<form id="frm">
				<select id="key" name="key">
					<option value="community_title">제목</option>
					<option value="community_subject">내용</option>
					<option value="community_writer">작성자</option>
				</select> &nbsp; <input type="text" id="val" name="val"> &nbsp;&nbsp;
				<input type="button" value="검색" onclick="communitySearch()">

			</form>

		</div>
		<br>

		<div>
			<table border="1" id="table">
				<thead>
					<tr>
						<th width="70">글번호</th>
						<th width="130">작성자</th>
						<th width="200">제목</th>
						<th width="130">작성일</th>
						<th width="70">조회수</th>
						
					</tr>
				</thead>
				<tbody id="tb">
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach items="${list }" var="list">
								<tr>
									<td>${list.boardId }</td>
									<td>${list.memberNickname }</td>
									<td>${list.comTitle }</td>
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
				var row = $("<tr />").append($("<td />").text(item.boardId),
						$("<td />").text(item.memberNickname),
						$("<td />").text(item.comTitle),
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