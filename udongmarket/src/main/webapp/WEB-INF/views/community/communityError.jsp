<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>error</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>

	${message }
	<jsp:forward page="communityList.do"></jsp:forward>


</body>
</html>