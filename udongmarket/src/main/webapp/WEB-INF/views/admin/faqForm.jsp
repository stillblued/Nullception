<%@ page import="co.nullception.udongmarket.faq.vo.FaqVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>FAQ</title>
<script type="text/javascript">
function autoDate () {
	var tDay = new Date();
	var tMonth = tDay.getMonth()+1;
	var tDate = tDay.getDate();
	if ( tMonth < 10) tMonth = "0"+tMonth;
	if ( tDate < 10) tDate = "0"+tDate;
	document.getElementById("tDate").value = tDay.getFullYear()+"-"+tMonth+"-"+tDate;
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
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.do">메인</a></li>
				<li><a href="dealList.do">장터</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
			    <c:if test="${author == 'ADMIN' }">
			    <li><a href="memberList.do">사용자 목록</a></li>
			    </c:if>
			    <li><a href="faq.do">FAQ</a></li>
			</ul>
		</div>
	</nav>
	<div><h1>FAQ</h1></div>
	<br><br>
	<div>
		<form id="frm" action="faqInsert.do" method="post" enctype="multipart/form-data">
			<table id="detailBoard" border="1">
			 <%
			FaqVO vo = (FaqVO) request.getAttribute("vo");
			%> 
				
				<tr>
				    <input type="hidden" id="nickname" value="${nick }">
					<th>닉네임</th><%-- ${nick } --%>
					<td><input type="text" id="boardNick" name="boardNick" value="${nick}" readonly="readonly" ></td>
					<th id="nickname">작성 날짜</th>
					<%-- <td><input type="text" id="faqDate" name="faqDate" value="${list.getFaqDate() }"  readonly="readonly"></td> --%>
					<td><input name="tName" type="text" id="tDate"></td>
				
				</tr>
				<tr>
					<th id="title">제목</th>
					<td colspan="3" ><input type="text" id="faqTitle" name="faqTitle"></td>
				</tr>
				
				<tr>
					<th id="content">내용</th>
					<td colspan="3"> <textarea id="faqContent" name="faqContent" rows="10" ></textarea></td>
				</tr>
				<tr>
					<th id="file">첨부파일</th>
					<td colspan="3"><input type="file" id="attach" name="attach"></td>
				</tr>
					
			</table><br>
			<input type="submit" value="전송">
			<input type="button" onclick="location.href='faq.do'" value="취소">
		</form>
		             
	</div>
</body>
</html>
