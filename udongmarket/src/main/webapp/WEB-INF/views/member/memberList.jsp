<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 사용자 목록</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div>
		<!-- 메인 > 관리자페이지 > 상세 카테고리 노출 -->
		<nav>
				<a href="memberList.do">사용자 목록</a>&nbsp;&nbsp;&nbsp;
				<a href="faq.do">FAQ</a>
		</nav>
		<br>
		<br> 
		<div align="center">
		<select id="membauthorCategory" name="membauthorCategory"
		 onchange="authorselectList()">
		<option value="membauthorselect">== 권 한 ==</option>
		<option value="ADMIN">ADMIN</option>
		<option value="USER">USER</option>
		<option value="BLIND">BLIND</option>
		</select>
		</div>
		<table border=1>
			<thead>
				<tr>
					<th>권한</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>매너온도</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="m">
					<tr>
						<td>${m.author}</td>
						<td>${m.memberId}</td>
						<td>${m.nickname}</td>
						<td>${m.email}</td>
						<td>${m.mannerTemp}</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
	</div>
<script type="text/javascript">
	function authorselectList(){
		//select 태그의 값이 변경될 때 멤버 리스트 필터하는 함수
		let category = $("#membauthorCategory option:selected").text();
		
		$.ajax({
			url : "ajaxMemberList.do",
			type : "post",
			data : {category : category},
			dataType : "Json",
			success : function(result){
				console.log(result);
				/* if(result != null){
					jsonComListConvert(result);
				} else {
				
				}*/
			}, 
			error: function(){
				console.log("error");
			}
		})
	}
</script>
</body>
</html>