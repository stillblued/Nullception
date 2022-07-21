<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.do">메인</a></li>
				<li><a href="dealList.do">장터</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>	

   <div align="center">
     <div>
       <h1>로 그 인</h1>
     </div>
     <div align="center">
		<h1>${message }</h1>
	</div>
     <div>
       <form id="frm" action="memberLogin.do" method="post">
         <div>
           <table>
              <tr>
                <td width="150">아이디</td>
                <td width="200">
                <input type="text" id="memberId" name="memberId" required="required" placeholder="Enter Your Id..."></td>
              </tr>
              <tr>
                <td width="150">비밀번호</td>
                <td width="200">
                <input type="password" id="memberPassword" name="memberPassword" required="required" placeholder="Enter Your Passwokd..."></td>
              </tr>
           </table>
         </div>
         <br>
         <div>
           <input type="submit" value="로그인">&nbsp;&nbsp;&nbsp;
           <input type="button" value="회원가입" onclick="location.href='memberJoinForm.do'">&nbsp;&nbsp;&nbsp;
           <input type="button" value="메인" onclick="location.href='main.do'"><br><br><br>
         </div>
       </form>
     </div>
   </div>
   
  
   
</body>
</html>