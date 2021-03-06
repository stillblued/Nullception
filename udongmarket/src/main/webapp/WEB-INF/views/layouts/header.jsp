<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo.css">
<link rel="stylesheet" href="css/custom.css">
<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="css/fontawesome.min.css">
<script src="js/jquery-3.6.0.min.js"></script>
<title>header</title>
</head>
<body>
	<%-- <div>
		<%
		if (session.getAttribute("nick") == null) {
		%>


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

	</div> --%>
	
	
	<!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-end">
                <div>
                	<%
					if (session.getAttribute("nick") == null) {
					%>
                    <a class="navbar-sm-brand text-light text-decoration-none" href='memberLoginForm.do'>로그인 / 회원가입</a>&nbsp;&nbsp;
                    <%
					} else {
			
					String author = (String) session.getAttribute("author");
			
					if (author.equals("ADMIN")) {
					%>
			        ${front }&nbsp;&nbsp;
                    <a class="navbar-sm-brand text-light text-decoration-none" href='memberLogout.do'>로그아웃</a>&nbsp;<a>/</a>&nbsp;
                    <a class="navbar-sm-brand text-light text-decoration-none" href='faq.do'>고객센터</a>&nbsp;<a>/</a>&nbsp;
                    <a class="navbar-sm-brand text-light text-decoration-none" href="memberList.do">사용자관리</a>
                    <%
					} else {
					%>
			        ${front }&nbsp;&nbsp;
			        <div align="center"
					style="color: white; display: inline-block; width: 20px; height: 20px; position: relative; top: 8px;">
					<table id="alert">
						<thead style="display: none">
							<tr>
								<th>알림 내용</th>
							</tr>
						</thead>
					</table>
					</div>&nbsp;&nbsp;
                    <a class="navbar-sm-brand text-light text-decoration-none" href='memberLogout.do'>로그아웃</a>&nbsp;<a>/</a>&nbsp;
                    <a class="navbar-sm-brand text-light text-decoration-none" href='myPage.do'>마이페이지</a>&nbsp;<a>/</a>&nbsp;
                    <a class="navbar-sm-brand text-light text-decoration-none" href='faq.do'>고객센터</a>
                    <%
					}
					%>
			
					<%
					}
					%>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->
    
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="main.do">
            <h1><img class="logo" width="50px" src="./img/logo4.png" href="main.do">
                우동마켓</h1>
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="dealList.do">장터</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="communityList.do">커뮤니티</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="faq.do">고객센터</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Header -->
                
                <!-- 검색, 장바구니, 마이페이지 아이콘 -->
                <!-- <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
                    </a>
                </div> -->
	
	
	
	
	<!-- Start Script -->
    
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/templatemo.js"></script>
    <script src="js/custom.js"></script>
    <!-- End Script -->
	


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

	<!-- Start Script -->
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/templatemo.js"></script>
    <script src="js/custom.js"></script>
    <!-- End Script -->

</body>
</html>