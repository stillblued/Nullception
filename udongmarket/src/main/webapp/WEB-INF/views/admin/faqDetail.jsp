<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="writeFrm">
		<table border="1" width="90%">
			<tr>
				<td>작성자</td>
				<td></td>
				<td>작성일</td>
				<td></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" height="100"><%-- <%=dto.getContent().replace("\r\n", "<br/>")%> --%></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					
					<!-- if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId()))  -->
					
					<button type="button" onclick="">수정</button>
					<button type="button" onclick="faqDelete(this)">삭제</button>
					<button type="button" onclick="location.href='faq.do';">목록 보기</button>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>