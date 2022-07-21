<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="js/jquery-3.6.0.min.js"></script>
<style>
#stateAlert:hover {
	color: coral;
}
</style>
<title>header</title>
</head>
<body>



	<%
	if (session.getAttribute("nick") == null) {
	%>

	<a href='memberLoginForm.do'>로그인 / 회원가입</a>

	<%
	} else {

	String author = (String) session.getAttribute("author");

	if (author.equals("ADMIN")) {
	%>
	${front }&nbsp;&nbsp;
	<a href='memberLogout.do'>로그아웃</a>&nbsp;
	<a>/</a>&nbsp;
	<a href='memberList.do'>관리자페이지</a>

	<%
	} else {
	%>

	<div>
		${front }&nbsp;
		<div align="center"
			style="color: navy; display: inline-block; width: 20px; height: 20px; position: relative; top: 3px;">
			<table id="alert">
				<thead style="display: none">
					<tr>
						<th>알림 내용</th>
					</tr>
				</thead>
			</table>
		</div>&nbsp;&nbsp;
		<a href='memberLogout.do'>로그아웃</a>&nbsp; <a>/</a>&nbsp; <a
			href='myPage.do'>마이페이지</a> &nbsp; <a>/</a>&nbsp; <a href='faq.do'>고객센터</a>

		<%
		}
		%>

		<%
		}
		%>
	</div>

	<script type="text/javascript">
		function checkCommentState() {
			//댓글 상태 확인
			//체크 요청을 보내면 ajax로 상태를 받아와서 확인(interval로 작동시간 정해주기)
			//읽지 않은 댓글의 개수(count)값이 있으면 개수를 result로 반환하고 닉네임이 다르면 빈 문자열을 반환(알림이 없음)
			let state = "check";
			$.ajax({
				url : "ajaxcommentCheck.do",
				type : "post",
				data : {
					state : state
				},
				dataType : "Json",
				success : function(result) {
					console.log("result : " + result);
					jsonStateConvert(result);
				},
				error : function() {
					console.log("error");
				}
			})
		}

		function jsonStateConvert(data) {
			console.log(data)
			$("#alert tbody").remove();
			//if data(count)가 0보다 크면 테이블에 출력
			if (data > 0) {
				let tbody = $("<tbody />");
				let row = $("<tr />").append(
						$("<td id='stateAlert' onclick='commentsList()'/>")
								.text(data));
				tbody.append(row);
				$('#alert').append(tbody);
			} else { //count가 0이면 댓글이 없습니다 알림 출력
				let tbody = $("<tbody />");
				let row = $("<tr />").append($("<td />").text("0"));
				tbody.append(row);
				$('#alert').append(tbody);
			}
		}

		function commentsList() {
			//내가 확인하지 않은 댓글들의 리스트를 보여줌
			location.href = 'printCommentLists.do';
		}

		window.onload = checkCommentState();
		setInterval(function() {
			checkCommentState();
		}, 6000);
	</script>

</body>
</html>