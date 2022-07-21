<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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

<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<div align="center">
		<header>
			<tiles:insertAttribute name="header" />
		</header>

		<section>
			<tiles:insertAttribute name="menu" />
		</section>

		<article>
			<tiles:insertAttribute name="body" />
		</article>

		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
	
	<!-- Start Script -->
   
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/templatemo.js"></script>
    <script src="js/custom.js"></script>
    <!-- End Script -->
</body>
</html>