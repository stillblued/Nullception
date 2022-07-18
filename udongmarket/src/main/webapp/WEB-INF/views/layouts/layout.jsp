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
    height: 30px; 
	background-color: white;
	text-align: center;
	font-size: 10px;
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
    height: 50px; 
	background-color: #777;
	padding: 1px;
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