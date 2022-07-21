<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title><tiles:getAsString name="title" /></title>

<style>
/* header {
	height: 30px;
	font-size: 15px;
	text-align: right;
	position: fixed;
	top: 3px;
	left: 17.75%;
	right: 17.75%;
}
 */

/* hr {
	height: 10px;
	border: 0;
	box-shadow: 0 10px 10px -10px #8c8c8c inset;
}

a {
	text-decoration: none;
	color: black;
	margin-bottom: 3px;
	margin-top: 3px;
}

body {
	font-family: Arial, 맑은 고딕;
	margin: 0, 25%, 0 25%;
}

header {
	height: 30px;
	background-color: white;
	font-size: 10px;
	text-align: right;
	position: fixed;
	top: 0px;
	left: 17.75%;
	right: 17.75%;
}

section {
	position: fixed;
	height: 120px;
	left: 17.75%;
	right: 17.75%;
	background-color: white;
	top: 25px;
}

nav {
	color: black;
	text-align: center;
	height: 20px;
	background: #ccc;
	font-size: 15px;
	padding-top: 5px;
	padding-bottom: 5px;
	margin-bottom: -10px;
}

nav ul {
	list-style-type: none;
}

article {
	padding-top: 200px;
	width: 65%;
	background-color: #f1f1f1;
}

footer {
	width: 65%;
	margin-top: 5px;
	padding-top: 5px;
	height: 100px;
	background-color: #777;
	text-align: center;
	color: white;
	height: 30px;
}

h5 {
	margin: 0;
	padding: 0;
} */
</style>

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

</body>
</html>