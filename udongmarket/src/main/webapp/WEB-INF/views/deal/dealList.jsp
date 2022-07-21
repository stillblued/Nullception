<%@page import="co.nullception.udongmarket.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

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
<script src="js/jquery-1.11.0.min"></script>
<title>거래 게시판 목록</title>
<style>
.h1 {
	font-family : 'Hanna';
}
</style>
</head>
<body>
<%
	MemberVO mvo = new MemberVO();
%>

	<!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">게시글 목록</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="./img/feature_prod_01.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">$240.00</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">Gym Weight</a>
                            <p class="card-text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt in culpa qui officia deserunt.
                            </p>
                            <p class="text-muted">Reviews (24)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="./img/feature_prod_02.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">$480.00</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">Cloud Nike Shoes</a>
                            <p class="card-text">
                                Aenean gravida dignissim finibus. Nullam ipsum diam, posuere vitae pharetra sed, commodo ullamcorper.
                            </p>
                            <p class="text-muted">Reviews (48)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="./img/feature_prod_03.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">$360.00</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">Summer Addides Shoes</a>
                            <p class="card-text">
                                Curabitur ac mi sit amet diam luctus porta. Phasellus pulvinar sagittis diam, et scelerisque ipsum lobortis nec.
                            </p>
                            <p class="text-muted">Reviews (74)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->
    
	<div><h1>거래 게시글 목록</h1></div>
	 <div>
		<form id="frm" action="dealSearch.do" method="get">
			<select id="key" name="key">
				<option value="deal_title">제목</option>
				<option value="deal_content">내용</option>
				<option value="deal_content">작성자</option>
			</select>&nbsp;
			<input type="text" id="val" name="val">&nbsp;&nbsp;
			<input type="submit" value="검색">
		</form><br>
		


		<table border="1" class="table table-striped" style="width: 80%;  text-align :center;">
			<thead>
				<tr>
					<th style = "text-align :center;">NO</th>
					<th style = "text-align :center;">상품이미지</th>
					<th style = "text-align :center;">작성자</th>
					<th style = "text-align :center;">제목</th>
					<th style = "text-align :center;">가격</th>
					<th style = "text-align :center;">작성일자</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list}" var="d">
						<tr>

							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.boardId}</td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.dealCategory}</td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'"><img src="${d.attach}"></td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.nickname}</td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.dealTitle}</td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.price}</td>
							<td onclick="location.href='dealDetail.do?boardId=${d.boardId}'">${d.dealDate.substring(0, 11)}</td>
						</tr>			
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7" align="center">
						현재 거래중인 상품이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>		

		</table>
    
		<div id = "page">
			<%
			int pageCount = (int) request.getAttribute("pageCount");
			int pageBlock = (int) request.getAttribute("pageBlock");
			int startPage = (int) request.getAttribute("startPage");
			int endPage = (int) request.getAttribute("endPage");

			for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="dealList.do?pageNum=<%=i%>"><%=i%></a>
			<%
			}
			%>
		</div><br>
		
		<div>
			<!-- 비회원은 글등록 못하게 -->
			<c:if test="${not empty nickname}">
				<a href="dealForm.do" class="btn btn-primary">판매상품등록</a>
				<!-- <input class="btn btn-primary" value="판매상품등록" onclick="location.href='dealForm.do'"> -->
				<!-- <button type="button" onclick="location.href='dealForm.do'">판매상품 등록하기</button> -->
			</c:if>
		</div>
	</div>
	
	<!-- Start Script -->
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/templatemo.js"></script>
    <script src="js/custom.js"></script>
    <!-- End Script -->

	<script type="text/javascript">
		function dealSearch() {
			let key = $("#key").val();
			let val = $("#val").val();
			$.ajax({
				url : "ajaxDealSearch.do",
				type : "post",
				data : {key : key, val : val},
				dataType : "json",
				success : function(result) {
					if(result.length > 0) {
						jsonHtmlConvert(result);
					} else {
						alert("검색한 결과가 없습니다.");
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
				var row = $("<tr />").append(
						  $("<td />").text(item.boardId),
						  $("<td />").text(item.dealAttach),
						  $("<td />").text(item.nickname),
						  $("<td />").text(item.dealTitle),
						  $("<td />").text(item.price),
						  $("<td />").text(item.dealDate)
				);
				tbody.append(row);
			});
			$('table').append(tbody);
		}
	</script>

</body>
</html>