<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage.jsp</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- 만약 권한이 USER이면 마이페이지, 아니면 관리자페이지 로드 -->
	<h3>내정보</h3>
	<div align="center">
		<table border="1">
			<tr>
				<td>회원아이디</td>
				<td>${member.memberId }</td>
				<td>닉네임</td>
				<td>${member.nickname }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${member.phone }</td>
				<td>이메일</td>
				<td>${member.email }</td>
			</tr>
			<tr>
				<td>지역</td>
				<td>${member.location }</td>
				<td>매너온도</td>
				<td>${member.mannerTemp }</td>
			</tr>
			<tr>
				<td>등급</td>
				<td colspan="3">${member.author }</td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="location.href='myPageUpdate.do'">회원수정</button>
		<button type="button" onclick="location.href='deleteMember.do'">회원탈퇴</button>
		<hr>
		
		<h3>거래게시판 글목록</h3>
		<!-- 카테고리 값에 따라 필터되는 기능 추가(ajax) -->
		<select id="dealCategory" name="dealCategory" onchange="changeDealList()">
			<option value="unselect">==카테고리 선택==</option>
			<option value="elec">전자기기</option>
			<option value="clothes">의류/잡화</option>
			<option value="cosmetic">화장품</option>
			<option value="kid">유아동</option>
			<option value="home">생활가전</option>
			<option value="furniture">가구/인테리어</option>
			<option value="pet">반려동물용품</option>
			<option value="book">도서/음반</option>
			<option value="etc">기타</option>
		</select>
		<br><br>
		<table border="1" id="dealList">
			<thead>
				<th>카테고리</th>
				<th>글제목</th>
				<th>작성일자</th>
				<th>거래가능상태</th>
				<th>조회수</th>
			</thead>

		</table>
		<br>
		<hr>
		<br>
		<h3>커뮤니티 게시판 글목록</h3>
		<!-- 카테고리 값에 따라 필터되는 기능 추가(ajax) -->
		<select id="comCategory" name="comCategory" onchange="changeComList()">
			<option value="unselect">==카테고리 선택==</option>
			<option value="alert">알리미</option>
			<option value="together">소모임</option>
			<option value="sidejob">아르바이트</option>
			<option value="lost">분실실종</option>
			<option value="help">도움요청</option>
		</select>
		<br><br>
		<table border="1" id="comList">
			<thead>
				<th>카테고리</th>
				<th>글제목</th>
				<th>작성일자</th>
				<th>지역</th>
				<th>조회수</th>
			</thead>
<%-- 			<c:forEach items="${comList }" var="comList">
					<tr>
						<td>${comList.comCategory }</td>
						<td><a href=""}>${comList.comTitle} </a></td>
						<td>${comList.comDate }</td>
						<td>${comList.location }</td>
						<td>${comList.comHit }</td>
					</tr>
			</c:forEach> --%>
		</table>
		<br>
		<hr>
		<br>
		<h3>좋아요 게시글 목록</h3>
		<!-- 조금 더 수정하기(카테고리별 ajax사용하거나?) -->
		<table border="1">
			<thead>
				<th>카테고리</th>
				<th>글제목</th>
				<th>작성일자</th>
				<th>거래가능상태</th>
				<th>조회수</th>
			</thead>
			<c:forEach items="${likesList }" var="likesList">
				<tr>
					<td>${likesList.dealCategory }</td>
					<td><a href=""}>${likesList.dealTitle} </a></td>
					<td>${likesList.dealDate }</td>
					<td>${likesList.dealState }</td>
					<td>${likesList.dealHit }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script type="text/javascript">
	function changeDealList(){
		//select 태그의 값이 변경될 때 거래게시판 게시글 리스트를 필터하는 함수
		let category = $("#dealCategory option:selected").text();
		console.log(category);
		$.ajax({
			url : "ajaxDealList.do",
			type : "post",
			data : {category : category },
			dataType : "Json",
			success : function(result){
				console.log(result);//글을 배열로 받아오고 뿌려주면됨...
				if(result.length > 0){
					jsonDealListConvert(result);
				} else {
					"데이터가 존재하지 않습니다.";
				}
			},
			error: function(){
				console.log("error");
			}
		})
	}
	
	function changeComList(){
		//select 태그의 값이 변경될 때 커뮤니티 게시판 게시글 리스트를 필터하는 함수
		let category = $("#comCategory option:selected").text();
		console.log(category);
		$.ajax({
			url : "ajaxComList.do",
			type : "post",
			data : {category : category },
			dataType : "Json",
			success : function(result){
				console.log(result);//글을 배열로 받아오고 뿌려주면됨...
				if(result.length > 0){
					jsonComListConvert(result);
				} else {
					"데이터가 존재하지 않습니다.";
				}
			},
			error: function(){
				console.log("error");
			}
		})
	}
	
 	function jsonDealListConvert(data){
 		$("#dealList tbody").remove();
 		//내용이 없는 카테고리 선택하면 지워지도록(수정하기)
		let tbody = $("<tbody />");
		$.each(data, function(index, item){
			let row = $("<tr />").append(
					  $("<td />").text(item.dealCategory),
					  $("<td />").text(item.dealTitle),
					  $("<td />").text(item.dealDate),
					  $("<td />").text(item.dealState),
					  $("<td />").text(item.dealHit)
					);
			tbody.append(row);
		});
		$('#dealList').append(tbody);
	} 
 	
 	function jsonComListConvert(data){
 		$("#comList tbody").remove();
 		//내용이 없는 카테고리 선택하면 지워지도록(수정하기)
		let tbody = $("<tbody />");
		$.each(data, function(index, item){
			let row = $("<tr />").append(
					  $("<td />").text(item.comCategory),
					  $("<td />").text(item.comTitle),
					  $("<td />").text(item.comDate),
					  $("<td />").text(item.comHit)
					);
			tbody.append(row);
		});
		$('#comList').append(tbody);
 	}
	
</script>
</body>

</html>