<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FAQ ����</title>
<script type="text/javascript">
	function validateForm(form) {
		if (form.faqTitle.value == "") {
			alert("������ �Է��ϼ���.");
			form.faqTitle.focus();
			return false;
		}
		if (form.faqContent.value == "") {
			alert("������ �Է��ϼ���.");
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
				<th>�г���</th>
				<td><%-- <%= vo.getNickname() %> --%></td>
				<th>�ۼ���</th>
				<td><%-- <%= vo.getFaqDate() %> --%></td>
			</tr>
			<tr>
				<th>����</th>
				<td colspan="3">
				<input type="text" id="faqTitle" name="faqTitle"></td>
			</tr>
			<tr>
				<th>����</th>
				<td colspan="3" height="100">
				<textarea id="faqContent" name="faqContent" rows="10" ></textarea></td>
				<%-- <%=dto.getContent().replace("\r\n", "<br/>")%> --%>
			</tr>
			<tr>
			    <th>÷������</th>
			    <td colspan="3"><input type="file" id="attach" name="attach"></td>
			</tr>
			
			<tr>
            <td colspan="2" align="center">
                <button type="submit">�ۼ� �Ϸ�</button>
                <button type="reset">�ٽ� �Է�</button>
                <button type="button" onclick="location.href='faq.do'">
                    ��� ����</button> 
            </td>
        </tr>
			</table>
</form>

</body>
</html>