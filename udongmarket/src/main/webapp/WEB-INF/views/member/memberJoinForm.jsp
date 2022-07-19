<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div align="center">
		<h1>${message }</h1>
	</div>
	<div align="center">
		<div>
			<h1>회원가입</h1>
		</div>
		<div>
			<form id="frm" action="memberJoin.do" onsubmit="return formCheck()"
				method="post">
				<div>
					<table border="1">
						<tr>
							<th width="150">아이디</th>
							<td width="300"><input type="text" id="memberId"
								name="memberId" size="20"> &nbsp; <input type="text"
								id="checkId" value="No">
								<button type="button" id="btn1" onclick="idCheck()">중복체크</button>
							</td>
						</tr>
						<tr>
							<th width="150">패스워드</th>
							<td width="300"><input type="password" id="memberPassword"
								name="memberPassword" size="20" required="required"
								placeholder="숫자와 문자 포함,6~12자리"> &nbsp;</td>
						</tr>
						<tr>
							<th width="150">패스워드 확인</th>
							<td width="300"><input type="password" id="password"
								name="password" size="20" required="required"> &nbsp;</td>
						</tr>
						<tr>
							<th width="150">닉네임</th>
							<td width="300"><input type="text" id="nickname"
								name="nickname" size="20"> &nbsp; <input type="text"
								id="checkNickname" value="No">
								<button type="button" id="btn2" onclick="nicknameCheck()">중복체크</button>
							</td>
						</tr>
						<tr>
							<th width="150">연락처</th>
							<td><select id="phone" name="phone">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
							</select> <b>-</b> <input type="text" id="phone1" name="phone1" size="7"
								required="required"> <b>-</b> <input type="text"
								id="phone2" name="phone2" size="7" required="required">
							</td>
						</tr>
						<tr>
							<th width="150">지역</th>
							<td width="300"><select id="location" name="location">
									<option>대구광역시 중구</option>
									<option>대구광역시 동구</option>
									<option>대구광역시 서구</option>
									<option>대구광역시 남구</option>
									<option>대구광역시 북구</option>
									<option>대구광역시 수성구</option>
									<option>대구광역시 달서구</option>
									<option>대구광역시 달성군</option>
							</select> <input type="text" id="location1" name="location1" size="7"
								required="required"></td>
						</tr>
						<tr>
							<th width="150">이메일</th>
							<td width="300"><input type="text" id="email" name="email"
								size="10"> <b>@</b> <select id="email1" name="email1">
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
					<input type="submit" value="회원가입">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="취소">&nbsp;&nbsp;&nbsp;
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
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

			if (frm.memberPassword.value != "") {
				// 숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
				var regex = /^[A-Za-z0-9]{6,12}$/;
				if (regex.test(frm.memberPassword.value) == false) {
					alert("비밀번호 형식을 확인해주세요.");
					frm.memberPassword.value = "";
					frm.password.value = "";
					frm.memberPassword.focus();
					return false;
				}
			}

			if (frm.memberPassword.value != frm.password.value) {
				alert("패스워드가 일치하지 않습니다.");
				frm.memberPassword.value = "";
				frm.password.value = "";
				form.memberPassword.focus();
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

			if (frm.phone1.value != "" && frm.phone2.value != "") {
				var regP = /^([0-9]{3,4})$/;
				var regH = /^([0-9]{4})$/;
				if (!regP.test(frm.phone1.value) != true
						|| !regH.test(frm.phone2.value) != true) {
					alert("핸드폰 입력값을 다시 확인해 주세요.");
					frm.phone1.value = "";
					frm.phone2.value = "";
					form.phone1.focus();
					return false;
				}
			}
			
			if (frm.phone2.value != "" && frm.phone1.value != "") {
				var p = document.getElementById("phone");
				var h = document.getElementById("phone").options.selectedIndex;
				p.options[h].value = p.options[h].value + "-"
						+ frm.phone1.value + "-" + frm.phone2.value;

			}

			if (frm.location1.value != "") {
				var l = document.getElementById("location");
				var o = document.getElementById("location").options.selectedIndex;
				l.options[o].value = l.options[o].value + " "
						+ frm.location1.value;
			}

			if (frm.email.value != "") {
				var e = document.getElementById("email1");
				console.log(e);
				var m = document.getElementById("email1").options.selectedIndex;
				console.log(m);
				frm.email.value = frm.email.value + "@" + e.options[m].value;
			}

			return true;
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
				frm.memberPassword.focus();
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