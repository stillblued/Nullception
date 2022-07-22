<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo.css">
<link rel="stylesheet" href="css/custom.css">
<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="css/fontawesome.min.css">
<script src="js/jquery-3.6.0.min.js"></script>
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

	<br><br>
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
		<table border=1 id='tble' class="table table-striped" style="width: 80%; text-align :center;">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>매너온도</th>
					<th>권한</th>
					<th>권한변경</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="m">
					<tr>
						<td>${m.memberId}</td>
						<td>${m.nickname}</td>
						<td>${m.email}</td>
						<td>${m.mannerTemp}</td>
						<td>${m.author}</td>
						<td>
						<c:if test="${m.author != 'ADMIN' }">
						<button type="button" class="btn btn-info" role="button" style="width: 120px; color: white; display: inline-block;" onclick="location.href='memberauthorChange.do?memberId='+'${m.memberId}'">권한변경</button>
						</c:if>
						</td>
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
					  $("<td />").text(item.memberId),
					  $("<td />").text(item.nickname),
					  $("<td />").text(item.email),
					  $("<td />").text(item.mannerTemp),
   					  $("<td />").text(item.author)
					  ,$("<td  />").append($("<button class='btn btn-info' role='button' style='width: 120px; color: white; display: inline-block; onclick='' />").text("권한변경"))
							  );
			tbody.append(row);
		});
		$('#tble').append(tbody);
 	}
	
	function jsonMembListNull(){
		$("#tble tbody").remove();
		let tbody = $("<tbody />");
			let row = $("<tr />").append(
   					  $("<td colspan='6' />").text("결과값이 없습니다")
   					  
					);
			tbody.append(row);
		$('#tble').append(tbody);
	}
	
	
</script>

	<!-- Start Script -->
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/templatemo.js"></script>
    <script src="js/custom.js"></script>
    <!-- End Script -->

</body>
</html>