<%@ page import="co.nullception.udongmarket.faq.vo.FaqVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">

<title>FAQ</title>
<script type="text/javascript">
	function autoDate() {
		var tDay = new Date();
		var tMonth = tDay.getMonth() + 1;
		var tDate = tDay.getDate();
		if (tMonth < 10)
			tMonth = "0" + tMonth;
		if (tDate < 10)
			tDate = "0" + tDate;
		document.getElementById("tDate").value = tDay.getFullYear() + "-"
				+ tMonth + "-" + tDate;
	}
	function addLoadEvent(func) {
		var oldonload = window.onload;
		if (typeof window.onload != 'function') {
			window.onload = func;
		} else {
			window.onload = function() {
				if (oldonload) {
					oldonload();
				}
				func();
			}
		}
	}
	addLoadEvent(function() {
		autoDate();
	});
</script>
</head>
<body>
<br>
	<div>
		<h1>FAQ</h1>
	</div>
	<br>
	<div>
		<form id="frm" action="faqInsert.do" method="post" enctype="multipart/form-data">

			<input type="hidden" id="nickname" value="${nick }">
			
			
			<table id="detailBoard" border="1">
			
			<c:if test="${not empty report }">
				<tr>
				<th>피신고인</th>
				<td><input type="text" id="reportedId" value="${report}" readonly="readonly"></td>
				</tr>
				</c:if>
				<tr>
					<th>닉네임</th>
					
					<td><input type="text" id="boardNick" name="boardNick" value="${nick}" readonly="readonly"></td>
			
				</tr>
				
				<tr>
					<th id="title">제목</th>
					<td colspan="3"><input type="text" id="faqTitle"
						name="faqTitle"></td>
				</tr>

				<tr>
					<th id="content">내용</th>
					<td colspan="3"><textarea id="faqContent" name="faqContent"
							rows="10"></textarea></td>
				</tr>
				
				<tr>
					<th id="file">첨부파일</th>
					<td colspan="3"><input type="file" id="attach" name="attach"></td>
				</tr>

			</table>
			<br> <input type="submit" value="전송">
			<input type="button" onclick="location.href='faq.do'" value="취소">
		</form>
		             
	</div>
</body>
</html>
