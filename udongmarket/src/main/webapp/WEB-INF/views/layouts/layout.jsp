<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><tiles:getAsString name="title" /></title>

<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}
/* Style the header */
header {
	background-color: #666;
	padding: 30px;
	text-align: center;
	font-size: 35px;
	color: white;
}
/* Create two columns/boxes that floats next to each other */
nav {
	width: 75%;
	height: 50px; /* only for demonstration, should be removed */
	background: #ccc;
	padding: 10px;
}
/* Style the list inside the menu */
nav ul {
	list-style-type: none;
	padding: 0;
}

article {
	padding: 20px;
	width: 75%;
	background-color: #f1f1f1;
}
/* Clear floats after the columns */
section {
	width: 75%;
	display: table;
}
/* Style the footer */
footer {
	background-color: #777;
	padding: 10px;
	text-align: center;
	color: white;
}
</style>

</head>

<body>
	<div align="center">
		<header>

			<tiles:insertAttribute name="header" />

		</header>

		<section>

			<tiles:insertAttribute name="menu" />

			<article>

				<tiles:insertAttribute name="body" />

			</article>
		</section>

		<footer>

			<tiles:insertAttribute name="footer" />

		</footer>

	</div>

</body>
</html>