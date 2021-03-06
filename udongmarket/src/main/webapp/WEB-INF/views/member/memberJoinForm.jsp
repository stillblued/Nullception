<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
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
		<h1>${message }</h1>
	</div>
	
	<div align="center">
		<div>
			<h1>회원가입</h1>
		</div>
		
		  <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form id="frm" action="memberJoin.do" onsubmit="return formCheck()" class="col-md-9 m-auto" method="post" role="form">
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputname">아이디</label>
                        <input type="text" class="form-control mt-1" id="memberId" name="memberId" onKeyUp="KeyInput(2)">
                        <input type="hidden" class="form-control mt-1" id="checkId" value="No"><br>
						<button type="button" id="btn1" onclick="idCheck()" class="btn btn-info" role="button" style="width: 100px; color: white;">중복체크</button>
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputemail">비밀번호</label>
                        <input class="form-control mt-1" type="password" id="memberPassword" name="memberPassword" size="20" required="required" placeholder="숫자와 문자 포함,6~12자리">
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputname">비밀번호 확인</label>
                        <input class="form-control mt-1"  type="password" id="password" name="password" size="20" onKeyUp="KeyInput(1)" required="required">
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputemail">닉네임</label>
                        <input type="text" class="form-control mt-1" id="nickname" name="nickname" size="20" onKeyUp="KeyInput(3)">
                        <input type="hidden" class="form-control mt-1" id="checkNickname" value="No"><br>
						<button type="button" id="btn2" onclick="nicknameCheck()" class="btn btn-info" role="button" style="width: 100px; color: white;">중복체크</button>
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputname">연락처</label>
                        <div class="row">
                        <select id="phone" name="phone" class="form-control mt-1">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
							</select> 
							<b>-</b> 
							<input type="text" class="form-control mt-1" id="phone1" name="phone1" size= 7 onKeyUp="KeyInput(0)" required="required">
							 <b>-</b> 
							 <input type="text"	class="form-control mt-1" id="phone2" name="phone2" size= 7 required="required">
							 </div>
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputemail">지역</label>
                        <select id="location" name="location" class="form-control mt-1">
									<option>대구광역시</option>
							</select>
							<select id="location1" name="location1" class="form-control mt-1">
									<option> 중구</option>
									<option> 동구</option>
									<option> 서구</option>
									<option> 남구</option>
									<option> 북구</option>
									<option> 수성구</option>
									<option> 달서구</option>
									<option> 달성군</option>
							</select>  
							<input type="text" class="form-control mt-1" id="location2" name="location2" required="required">
                    </div>
                    <div class="form-group col-md-6 mb-3">
                        <label for="inputemail">이메일</label>
                        <input class="form-control mt-1" type="text" id="email" name="email" required="required">
                        <b>@</b> 
								<select id="email1" name="email1" class="form-control mt-1">
									<option>naver.com</option>
									<option>daum.net</option>
									<option>nate.com</option>
									<option>google.com</option>
							</select>
                    </div><br><br>
                    <div>
                        <button type="submit" class="btn btn-info" role="button" style="width: 100px; height:50px; color: white;">회원가입</button>&nbsp;&nbsp;
                        <button type="reset" class="btn btn-info" role="button" style="width: 100px; height:50px; color: white;">취소</button>&nbsp;&nbsp;
                        <a  href="javascript:kakaoLogin();">
					<img src="https://developers.kakao.com/tool/resource/static/img/button/kakaosync/complete/ko/kakao_login_medium_narrow.png" />
					</a> 
                    </div>
            </form>
        </div>
    </div>
    </div>
    <!-- End Contact -->
		
			<!-- <form id="frm" action="memberJoin.do" onsubmit="return formCheck()" method="post">//
				<div>//
					<table border="1">//
						<tr>//
							<th width="150">아이디</th>//
							<td width="300">//
							<input type="text" id="memberId" name="memberId" size="20" onKeyUp="KeyInput(2)"> &nbsp;//
							<input type="hidden" id="checkId" value="No">//
								<button type="button" id="btn1" onclick="idCheck()">중복체크</button>//
							</td>//
						</tr>//
						<tr>//
							<th width="150">패스워드</th>
							<td width="300">
							<input type="password" id="memberPassword" name="memberPassword" size="20" required="required" placeholder="숫자와 문자 포함,6~12자리"> &nbsp;</td>
						</tr>
						<tr>
							<th width="150">패스워드 확인</th>
							<td width="300">
							<input type="password" id="password" name="password" size="20" onKeyUp="KeyInput(1)" required="required"> &nbsp;
							</td>
						</tr>
						<tr>
							<th width="150">닉네임</th>//
							<td width="300">//
							<input type="text" id="nickname" name="nickname" size="20" onKeyUp="KeyInput(3)"> &nbsp; 
							<input type="hidden" id="checkNickname" value="No">//
								<button type="button" id="btn2" onclick="nicknameCheck()">중복체크</button>//
							</td>//
						</tr>//
						<tr>//
							<th width="150">연락처</th>
							<td><select id="phone" name="phone">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
							</select> 
							<b>-</b> 
							<input type="text" id="phone1" name="phone1" size= 7 onKeyUp="KeyInput(0)" required="required">
							 <b>-</b> 
							 <input type="text"	id="phone2" name="phone2" size= 7 required="required">
							</td>
						</tr>
						<tr>
							<th width="150">지역</th>
							<td width="300">
							<select id="location" name="location">
									<option>대구광역시</option>
							</select>
							<select id="location1" name="location1">
									<option> 중구</option>
									<option> 동구</option>
									<option> 서구</option>
									<option> 남구</option>
									<option> 북구</option>
									<option> 수성구</option>
									<option> 달서구</option>
									<option> 달성군</option>
							</select>  
							<input type="text" id="location2" name="location2" size="7" required="required"></td>
						</tr>
						<tr>
							<th width="150">이메일</th>
							<td width="300">
							<input type="text" id="email" name="email" size="10" required="required"> 
							<b>@</b> 
								<select id="email1" name="email1">
									<option>naver.com</option>
									<option>daum.net</option>
									<option>nate.com</option>
									<option>google.com</option>
							</select></td>
						</tr>
					</table>
				</div>
				<br>
				<div>
					<input type="submit" value="회원가입">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소">&nbsp;&nbsp;&nbsp;
					  <a  href="javascript:kakaoLogin();">
					<img src="https://developers.kakao.com/tool/resource/static/img/button/kakaosync/complete/ko/kakao_login_medium_narrow.png" />
					</a> 
				</div>
			</form> -->
		
	<!-- <form id="kakaoForm" method="post" action="kakaoLogin.do">
      <input type="hidden" name="email"/>
      <input type="hidden" name="name"/>
   </form> -->
	
	
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	//89bd47bf599b76dfe7bcd2c967e68e22 : 사용할 앱의 javascript키
     window.Kakao.init("89bd47bf599b76dfe7bcd2c967e68e22");
     
     function kakaoLogin() {
    	 window.Kakao.Auth.login({
    		 scope:'profile_nickname,account_email',
    		 success: function(authObj) {
    			 console.log(authObj);
    			 // id, password, email, nickname > 다른 값은 null이니까 마이페이지에서 수정
    			 // join command를 사용해서 일단 4개를 DB에 넘기고 넘어가는지 확인하기
    			 
    			 
				 window.Kakao.API.request({
    				 url:'/v2/user/me',
    				 success: function(res) {
    					 /*  var account = response.kakao_account;
    		                console.log(account)
    		                  $('#kakaoForm input[name=email]').val(account.email);
    		               $('#kakaoForm input[name=name]').val(account.profile.nickname);
    		               // 사용자 정보가 포함된 폼을 서버로 제출한다.
    		               document.querySelector('#kakaoForm').submit();
    					  */
    					 
    					 
    					 console.log("아이디:" + res.id);
    					 let id = res.id + "id";
    					 let pw = (res.id).toString().substr(0,5) + "pw";
    					 console.log(pw);
    					 // let key = Object.keys(res.kakao_account)[6];
    					 let val = res.kakao_account[Object.keys(res.kakao_account)[6]];
    					 console.log("메일:" + val);
    					 console.log("닉네임:" + res.properties['nickname']);
    					 console.log("토큰:" + authObj.access_token);  
    					 
    					 // id
    					 document.getElementById("memberId").value = id;
    					 console.log(frm.memberId.value);
    					 
    					 // password
    					 document.getElementById("memberPassword").value = pw;
    					 document.getElementById("password").value = pw;
    					 
    					 // nick
                         document.getElementById("nickname").value = res.properties['nickname'];
    					 
    					 // email
    					 document.getElementById("email").value = val;
    					 
    					 document.querySelector('#frm').submit();  // submit
     					 
    					 
    					 
    				 },
    				 fail: err => {
    					 console.log(err);
    				 }
    			 });
    		 } 
    	 });
    	
     }
	
		function formCheck() {
			
			if (frm.memberId.value == "") {
				alert("사용자아이디를 입력하세요.");
				frm.memberId.focus();
				return false;
			}

			if (frm.checkId.value == "No") {
				alert("아이디 중복체크를 해주세요.");
				return false;
			}


			if (frm.nickname.value == "") {
				alert("닉네임을 입력하세요.");
				frm.nickname.focus();
				return false;
			}

			if (frm.checkNickname.value == "No") {
				alert("닉네임 중복체크를 해주세요.");
				return false;
			}

			
			if (frm.phone2.value != "" && frm.phone1.value != "") {
				var p = document.getElementById("phone");
				console.log(p);
				var h = document.getElementById("phone").options.selectedIndex;
				console.log(h);
				p.options[h].value = p.options[h].value + "-"
						+ frm.phone1.value + "-" + frm.phone2.value;

			}

			if (frm.location2.value != "") {
				var l = document.getElementById("location");
				var o = document.getElementById("location").options.selectedIndex;
				var c = document.getElementById("location1");
				var a = document.getElementById("location1").options.selectedIndex;
				
				l.options[o].value = l.options[o].value + " " + c.options[a].value + " " + frm.location2.value;
				console.log(l.options[o].value);
				console.log("lacaion: "+frm.location.value);
			}

			if (frm.email.value != "") {
				var e = document.getElementById("email1");
				console.log(e);
				var m = document.getElementById("email1").options.selectedIndex;
				console.log(m);
				frm.email.value = frm.email.value + "@" + e.options[m].value;
				console.log(frm.email.value);
			}
			
			

			return true;
		}
		
		function KeyInput(mode) {
			if(mode == 0) {
				if(frm.phone1.value.length == 4) {
					frm.phone2.focus();
				} 
				}else if(mode == 1) {
					if(frm.memberPassword.value != "") {
						// 숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
						var regex = /^[A-Za-z0-9]{6,12}$/;
						if (regex.test(frm.memberPassword.value) == false) {
							alert("비밀번호 형식을 확인해주세요.");
							frm.memberPassword.value = "";
							frm.password.value = "";
							frm.memberPassword.focus();
							
						}
					}
					
					
				}else if(mode == 2) {
					if(frm.btn1.disabled = true) {
						if(frm.memberId.value != "") {
						frm.checkId.value = "No";
						frm.btn1.disabled = false;
						}
					
					}
					
				}else if(mode == 3) {
					if(frm.btn2.disabled = true) {
						if(frm.nickname.value != "") {
							frm.checkNickname.value = "No";
							frm.btn2.disabled = false;
						}
					}
						if(frm.memberPassword.value != frm.password.value ){
							alert("패스워드가 일치하지 않습니다.");
							frm.memberPassword.value = "";
							frm.password.value = "";
							frm.memberPassword.focus();
						}
					
				}
			}
		

		function idCheck() {
			let id = frm.memberId.value;
			if (id == "") {
				alert("아이디 입력 후 중복체크해주세요.");
				frm.memberId.focus();
			} else {
				// ajax를 이용하여 아이디 중복체크를 수행
				const xht = new XMLHttpRequest(); // ajax 객체생성
				xht.onload = function() { // xht가 로드될때 결과를 받아 처리하는 함수

					if (this.readyState == 4 && this.status == 200) {
						console.log(this.responseText);
						htmlConvertAjax(this.responseText); //성공했을 때 수행하는 함수
					} else {
						errorAjaxCall(); // 실패했을 때 수행하는 함수
					}

				}
				xht.open("GET", "ajaxMemberIdCheck.do?id=" + id); // 호출할 주소와 방식 설정
				xht.send(); // 호출
			}
		}

		function nicknameCheck() {
			let nickname = frm.nickname.value;
			if (nickname == "") {
				alert("닉네임 입력 후 중복체크해주세요.");
				frm.nickname.foucos();
			} else {
				// ajax를 이용하여 닉네임 중복체크를 수행
				const xht = new XMLHttpRequest(); // ajax 객체생성
				xht.onload = function() { // xht가 로드될때 결과를 받아 처리하는 함수

					if (this.readyState == 4 && this.status == 200) {
						//console.log(this.responseText);
						htmlConvertAjaxx(this.responseText); //성공했을 때 수행하는 함수 --str
					} else {
						errorAjaxCall(); // 실패했을 때 수행하는 함수
					}

				}
				xht.open("GET", "ajaxNicknameCheck.do?nickname=" + nickname); // 호출할 주소와 방식 설정
				xht.send(); // 호출
			}
		}

		function htmlConvertAjax(str) {
			if (str == "Usable") {

				alert("사용가능한 아이디입니다.");
				frm.checkId.value = "Yes";
				frm.btn1.disabled = true; // 버튼 비활성화
				frm.memberPassword.focus();
			} else {
				alert("이미 사용중인 아이디입니다.");
				frm.memberId.value = "";
				frm.memberId.foucos();
			}
		}

		function htmlConvertAjaxx(str) {
			if (str == "Usable") {

				alert("사용가능한 닉네임입니다.");
				frm.checkNickname.value = "Yes";
				frm.btn2.disabled = true; // 버튼 비활성화
			} else {
				alert("이미 사용중인 닉네임입니다.");
				frm.memberNickname.value = "";
				frm.memberNickname.foucos();
			}
		}

		function errorAjaxCall() {
			alert("네트워크 통신장애로 인해 처리할 수 없습니다. /n 잠시후 다시 해보세요.");
		}
	</script>
</body>
</html>