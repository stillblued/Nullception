<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
li {
  list-style-type: none;
  font-size: 20px;
 
}

h1 {
 color: pink;
 list-style-type: none;
}

</style>
<title>header</title>
</head>
<body>
<!-- 관리자페이지 작업끝나기전까지 좀 빼놓을게요. -->
<li><a href='memberList.do'">관리자페이지</a>&nbsp;</li>

      <% if(session.getAttribute("nick") == null) { %>
      
    	    <a href='memberLoginForm.do'">로그인</a>&nbsp;
			<a href='memberJoinForm.do'">회원가입</a>&nbsp;
			
      <% } else { 
      
 		String author = (String) session.getAttribute("author");
 		
       if(author.equals("ADMIN")) { %> 
       
       <li>${front }</li>
       <a href='memberLogout.do'">로그아웃</a>&nbsp;
       <!-- <a href='memberList.do'">관리자페이지</a>&nbsp; -->
       
      <% } else{ %> 
      
        <li>${front }</li>
        <a href='memberLogout.do'">로그아웃</a>&nbsp;&nbsp;&nbsp;
        <a href='myPage.do'">마이페이지</a>&nbsp;&nbsp;&nbsp;
        
      <%} %>
        
      <% } %>
  
</body>
</html>