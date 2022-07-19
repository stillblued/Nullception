<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FAQ 수정</title>
<script type="text/javascript">
	function validateForm(form) {
		if (form.faqTitle.value == "") {
			alert("제목을 입력하세요.");
			form.faqTitle.focus();
			return false;
		}
		if (form.faqContent.value == "") {
			alert("내용을 입력하세요.");
			form.faqContent.focus();
			return false;
		}
	}
</script>
</head>
<body>
<form name="writeFrm" method="post" action="faqUpdate.do" onsubmit="return validateForm(this);" enctype="multipart/form-data">
<table border="1" width="90%">
			
			<%-- <% FaqVO vo = (FaqVO)request.getAttribute("vo"); %> --%>
			<tr>
				<th>닉네임</th>
				<td><%-- <%= vo.getNickname() %> --%></td>
				<th>작성일</th>
				<td><%-- <%= vo.getFaqDate() %> --%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
				<input type="text" id="faqTitle" name="faqTitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" height="100">
				<textarea id="faqContent" name="faqContent" rows="10" ></textarea></td>
				<%-- <%=dto.getContent().replace("\r\n", "<br/>")%> --%>
			</tr>
			<tr>
			    <th>첨부파일</th>
			    <td colspan="3"><input type="file" id="attach" name="attach"></td>
			</tr>
			
			<tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='faq.do'">
                    목록 보기</button> 
            </td>
        </tr>
			</table>
</form>

</body>
</html>