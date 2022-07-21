
<%@page import="co.nullception.udongmarket.faq.vo.FaqVO"%>
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

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.do">메인</a></li>
				<li><a href="dealList.do">장터</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
				<c:if test="${author == 'ADMIN' }">
			    <li><a href="memberList.do">사용자 목록</a></li>
			    </c:if>
				<li class="active"><a href="faq.do">FAQ</a></li>
			</ul>
		</div>
	</nav>



	<div>
		<h1>FAQ</h1>
	</div>
	<form name="writeFrm">
		<table border="1" width="50%">

			<%
			FaqVO vo = (FaqVO) request.getAttribute("vo");
			%>

			<tr>
				<input type="hidden" id="boardId" name="boardId"
					value="<%=vo.getBoardId()%>">
				<th>닉네임</th>
				<td id="boardNick" name="boardNick"><%=vo.getBoardNick()%></td>
				<th>작성일</th>
				<td><%=vo.getFaqDate()%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=vo.getFaqTitle()%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" height="100"><%=vo.getFaqContent()%></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="3"><%=vo.getAttach()%></td>
			</tr>


			<tr>
				<td colspan="4" align="center">
					<!-- ajax 방식으로 쓰면 안됨... --> <!-- <button type="button" onclick="faqUpdate(this)">수정</button>
					<button type="button" onclick="location.href='ajaxFaqDelete.do'">삭제</button>  -->
					<button type="button" onclick="location.href='faq.do'">목록</button>

				</td>
			</tr>
		</table>
	</form>
	<br>
	<hr>


	<table border=1>
		<thead>
			<form name="commentsfrm" action="commentsInsert()" method="post">
			<tr>
				<input type="hidden" name="nickname" value="${nick}">
				<th>${nick}</th>
				<td><textarea id="commentsContent"></textarea></td>&nbsp;&nbsp;&nbsp;&nbsp;
				<td><input type="button" onclick="commentsInsert()"
					value="댓글등록"></td>
			</tr>
			</form>
		</thead>
		<tbody id = "comm">
			<%-- <c:if test="${empty coList}">
				<tr>
					<td colspan="6" align="center">등록된 댓글이 없습니다.</td>
				</tr>
			</c:if> --%>
			<c:forEach items="${coList}" var="list">
				<tr>
					<th>${list.nickname }</th>
					<td>${list.commentsContent }</td>
					<td>${list.commentsDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>





	<script type="text/javascript">
		/* ajax를 이용해 댓글 등록하기 -> 성공하면 리스트 뿌리기*/
		function commentsInsert() {
			let Content = $("#commentsContent").val();//댓글내용
			let BoardId = $("#boardId").val();
			
			$.ajax({
				url : "ajaxCommentsInsert.do",
				type : "post",
				data : {
					Content : Content , BoardId : BoardId
				},
				dataType : "Json",
				success : function(result) {
					if (result != null) {
						jsonListConvert(result);

					} else {
						alert("댓글 등록 실패.");
					}
				},
				error : function() {
					console.log("error");
				}
			});
		}
		
		function jsonListConvert(data){
			
				let today = timestamp();   	

				let tr = $("<tr />").append(
				 		$("<th />").text(data.nickname),
				 		$("<td />").text(data.commentsContent),
				 		$("<td />").text(today)
				 		 ,$("<td  />").append($("<button onclick='' />").text("수정"))
				 		 ,$("<td  />").append($("<button onclick='commentdelete()' />").text("삭제"))
				 		);
				
				$('#comm').append(tr);
				
			};
	 		
			function timestamp(){
			    var today = new Date();
			    today.setHours(today.getHours() + 9);
			    return today.toISOString().replace('T', ' ').substring(0, 19);
			}
			
		function commentdelete(){
			console.log("삭제해야돼,,, 클릭은 됨 ㅇㅅㅇ...");
		} 
		
		
	</script>

</body>
</html>