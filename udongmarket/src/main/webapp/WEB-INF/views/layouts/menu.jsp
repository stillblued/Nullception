<%@page
	import="com.fasterxml.jackson.databind.introspect.TypeResolutionContext.Empty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>menu</title>
</head>
<body>
     <a href = "main.do"><h1>우동<br>마켓</h1></a>
     <% if(session.getAttribute("nick") == null) {%>
     
	<nav>
			
      		<button type="button" onclick="location.href='dealList.do'">장터</button>&nbsp;&nbsp;&nbsp;
      		<button type="button" onclick="location.href='communityList.do'">커뮤</button>
	</nav>
	
     <%} else {
    	 
 		//세션의 정보는 Object타입으로 저장되어있음
 		//다운 캐스팅 : 자식클래스의 변수 = (자식클래스 타입) 부모타입의 데이터
 		String author = (String) session.getAttribute("author");
 		// System.out.println(author);
    	 if(author.equals("admin")) {  %>
    	 <nav>
       
       <button type="button" onclick="location.href='dealList.do'">장터</button>&nbsp;&nbsp;&nbsp;
       <button type="button" onclick="location.href='communityList.do'">커뮤</button>
     </nav>
     
    	 <%}else{ %>
    	 
     <nav>
    	  
           <button type="button" onclick="location.href='dealList.do'">장터</button>&nbsp;&nbsp;&nbsp;
      	   <button type="button" onclick="location.href='communityList.do'">커뮤</button>
    	 </nav>
     
    	 <%} %>
     
     <%} %>
</body>
</html>