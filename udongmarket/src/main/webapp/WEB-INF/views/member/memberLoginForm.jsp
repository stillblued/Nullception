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
           <input type="reset" value="취소">&nbsp;&nbsp;&nbsp;
           <input type="button" value="홈 가기" onclick="location.href='main.do'"><br><br><br>
           <a href="javascript:kakaoLogin();"><img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png" /></a>
         </div>
       </form>
     </div>
   </div>
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script>
     //89bd47bf599b76dfe7bcd2c967e68e22 : 사용할 앱의 javascript키
     window.Kakao.init("89bd47bf599b76dfe7bcd2c967e68e22");
     
     function kakaoLogin() {
    	 window.Kakao.Auth.login({
    		 scope:'profile_nickname,account_email',
    		 success: function(authObj) {
    			 console.log(authObj);
    			 // key : access_token , value.
    			 let key = Object.keys(authObj)[0];
    			 let value = authObj[Object.keys(authObj)[0]];
				 let value1 = authObj[Object.keys(authObj)[3]];
				 let id = value.substr(0, 6);
    			 let password = value.substr(10, 3) + value1;
    			 
    			 console.log("id :" + id);
    			 console.log("password : " + password);
    			 // id, password, email, nickname > 다른 값은 null이니까 마이페이지에서 수정
    			 // join command를 사용해서 일단 4개를 DB에 넘기고 넘어가는지 확인하기
    			 
				 
				 window.Kakao.API.request({
    				 url:'/v2/user/me',
    				 success: res => {
    					 const kakao_account = res.kakao_account;
    					 console.log(kakao_account);
    				 },
    				 fail: err => {
    					 console.log(err);
    				 }
    			 });
    		 } 
    	 });
    	 //request.setAttribute(id);
    	 //request.setAttribute(password);
    	 //location.href='kakaoJoin.do';
     }
     
     
  </script>
   
</body>
</html>