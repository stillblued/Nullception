<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/custom.css">
<link rel="apple-touch-icon" href="img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo.css">
<link rel="stylesheet" href="css/custom.css">
<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="css/fontawesome.min.css">
<title>main</title>
<style>
.fa-chevron-left {
	color: #34b6d3;
}
.fa-chevron-right {
	color: #34b6d3;
}
#template-mo-zay-hero-carousel .carousel-indicators li {
    margin-top: -50px;
    background-color: #34b6d3;
}
#template-mo-zay-hero-carousel .carousel-control-next i, #template-mo-zay-hero-carousel .carousel-control-prev i {
    color: #34b6d3 !important;
    font-size: 2.8em !important;
}

</style>
</head>
<body>
	<%
		String memberId = null;
		if (session.getAttribute("memberId") != null) {
			memberId = (String) session.getAttribute("memberId");
		}
	%>
	
	<!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./img/banner_img_01.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success">우리 동네의</h1>
                                <h3 class="h2">믿을 수 있는 직거래 중고 커뮤니티</h3>
                                <p>
                                동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.
                                    <a rel="sponsored" class="text-success" href="main.do" target="_blank"></a>
                                    <a rel="sponsored" class="text-success" href="main.do" target="_blank"></a> 
                                    <a rel="sponsored" class="text-success" href="main.do" target="_blank"></a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./img/banner_img_02.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">동네 모임</h1>
                                <h3 class="h2">이웃과 함께 하는 동네생활</h3>
                                <p>
                                    중고 거래부터 동네 정보까지, 이웃과 함께해요. </p>
                                  <p>  가깝고 따뜻한 우리 동네를 만들어요 </p>
                                   <p> 관심사가 비슷한 이웃과 온오프라인으로 만나요.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./img/banner_img_03.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">우리 동네 질문</h1>
                                <h3 class="h2">동네 분실 센터 </h3>
                                <p>
                                  궁금한 게 있을 땐 이웃에게 물어보세요.</p>
                                  <p>무언가를 잃어버렸을 때, 함께 찾을 수 있어요. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->
    
    			
	<!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">중고 매물 더보기</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="dealList.do">
                            <img src="./img/feature_prod_01.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                
                                <li class="text-muted text-right">4500￦</li>
                            </ul>
                            <a href="dealList.do" class="h2 text-decoration-none text-dark">고성능 손전등</a>
                            <p class="card-text">
                                 사용감 적어요!
                            </p>
                            <p class="text-muted">관심 등록 / 거래 신청</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="dealList.do">
                            <img src="./img/feature_prod_02.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                
                                <li class="text-muted text-right">150000￦</li>
                            </ul>
                            <a href="dealList.do" class="h2 text-decoration-none text-dark">스마트 워치</a>
                            <p class="card-text">
                                이 기회에 싼 값에 구매하세요 </p>
                            <p class="text-muted">관심 등록 / 거래 신청</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="dealList.do">
                            <img src="./img/feature_prod_03.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                
                                <li class="text-muted text-right">62000￦</li>
                            </ul>
                            <a href="dealList.do" class="h2 text-decoration-none text-dark">폴라로이드 카메라</a>
                            <p class="card-text">
                              사용감 있지만 A급이라 자부합니다.</p>
                            <p class="text-muted">관심 등록 / 거래 신청</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->
	
	<!-- <div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="2" class="active"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img class="img-fluid" src="images/1.jpg">
				</div>
				<div class="item">
					<img class="img-fluid" src="images/2.jpg">
				</div>
				<div class="item">
					<img class="img-fluid" src="images/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div> -->
	<!-- Start Script -->
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/templatemo.js"></script>
    <script src="js/custom.js"></script>
    <!-- End Script -->
</body>
</html>