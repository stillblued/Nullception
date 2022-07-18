<%@page import="co.nullception.udongmarket.deal.vo.DealVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%-- <% 
	int id = Integer.parseInt(request.getParameter("boardId"));
	ArrayList<DealVO> list = (ArrayList<DealVO>) request.getAttribute("list");
	DealVO dvo = list.get(list.indexOf(new DealVO(id)));
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h1>글 상세보기</h1>
		<form action="dealUpdate.do" id="viewForm" method="post" encType="multipart/form-data">
		<table border="1" class="view">
			<thead>
				<tr>
					<th>제목</th>
				</tr>
				<tr>
					<th>가격</th>
				</tr>
				<tr>
					<th>내용</th>
				</tr>
				<tr>
					<th>상품이미지</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach items="${list}" var="d">
					<tr>
						<td>
						<input type="text" name="dealTitle" value="${d.dealTitle}"
						class="form-control" readonly>
						</td>
					</tr>
					<tr>
						<td>
						<input type="text" name="price" value="${d.price}"
						class="form-control">
						</td>
					</tr>
					<tr>
						<td>
						<textarea rows="6" cols="50" name="dealContent" class="form-control">${d.dealContent}</textarea>
						</td>
					</tr>
					<tr>
						<td>
						<input type="file" name="attach" value="${d.attach}"
						class="form-control">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<button id="btn_previous" type="button" class="btn_previous">이전</button>
							<button id="btn_delete" type="button" class="btn_delete">삭제</button>
							<button id="btn_update" type="button" class="btn_update">수정</button>
						</td>
					</tr>
					</c:forEach>
			</tbody>
		</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).on('click', '#btn_update', function(e) {
		if(confirm("수정하시겠습니까?") == true) {
			$("#dealForm").submit();
		} else {
			return;
		}
	});
	
	$(document).on('click', '#btn_delete', function(e) {
		if(confirm("삭제하시겠습니까?") == true) {
			$('#dealForm').attr("action", "dealDelete.do");
			$("#dealForm").submit();
		} else {
			return;
		}
	});
	
	$("#btn_previous").click(function javascript_onclick() {
		$(location).attr('href', 'dealList.do');
	});
</script>
</html>