<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>FAQ</title>
<style>
#membauthorCategory > ul  {
	list-style:none;
	padding: 0
}
li{
display: inline-block
}
</style>
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
			    <li class="active"><a href="memberList.do">사용자 목록</a></li>
			    <li><a href="faq.do">FAQ</a></li>
			</ul>
		</div>
	</nav>
	<div><h1>사용자 목록</h1></div>
	<br>

		<div id="membauthorCategory" onchange="authorselectList()">
		<ul>
		<!-- <li>
		    <label for="ALL" style="cursor:pointer">
		    <input type="radio" id="ALL" onclick="" />전체 </label>
		</li> -->
		<li>
		    <label for="ADMIN" style="cursor:pointer">
		    <input type="radio" id="ADMIN" name="author" value="ADMIN" />&nbsp;ADMIN&nbsp;&nbsp; </label>
		</li>
		<li>
		    <label for="USER" style="cursor:pointer">
		    <input type="radio" id="USER" name="author" value="USER" />&nbsp;USER&nbsp;&nbsp;</label>
		</li>
		<li>
		    <label for="BLIND" style="cursor:pointer">
		    <input type="radio" id="BLIND" name="author" value="BLIND" />&nbsp;BLIND&nbsp;&nbsp;
		    </label>
		</li>
		</ul>
		</div><br>
		<table border=1 id='tble'>
			<thead>
				<tr>
					<th>권한</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>매너온도</th>
					<th>권한변경<th>
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
						<td><input type="button" onclick="" value="권한변경"></td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>


<script type="text/javascript">
	function authorselectList(){
		//select 태그의 값이 변경될 때 멤버 리스트 필터하는 함수 #membauthorCategory
		let category = $("input[name='author']:checked").val();

		$.ajax({
			url : "ajaxMemberList.do",
			type : "post",
			data : {category : category},
			dataType : "Json",
			success : function(result){
				
				result.length != 0 ? jsonMembListConvert(result) : jsonMembListNull();

				/* if(result != null){jsonComListConvert(result);*/

			}, 
			error: function(){
				console.log("error");
			}
		})
	}

	function jsonMembListConvert(data){
 		$("#tble tbody").remove();
		let tbody = $("<tbody />");
		$.each(data, function(index, item){
			let row = $("<tr />").append(
   					  $("<td />").text(item.author),
					  $("<td />").text(item.memberId),
					  $("<td />").text(item.nickname),
					  $("<td />").text(item.email),
					  $("<td />").text(item.mannerTemp),
					  $(("<td  />").append($("<button onclick='' />").text("권한변경"))
					);
			tbody.append(row);
		});
		$('#tble').append(tbody);
 	}
	
	function jsonMembListNull(){
		$("#tble tbody").remove();
		let tbody = $("<tbody />");
			let row = $("<tr />").append(
   					  $("<td colspan='5' />").text("결과값이 없습니다")
   					  
					);
			tbody.append(row);
		$('#tble').append(tbody);
	}
	
	
</script>


</body>
</html>