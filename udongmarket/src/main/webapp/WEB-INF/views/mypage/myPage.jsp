<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage.jsp</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	#title:hover{
		color: blue;
	}
</style>
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
		<select id="dealCategory" name="dealCategory"
			onchange="changeDealList()">
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
		</select> <br> <br>
		<table border="1" id="dealList">
			<thead>
				<tr>
					<th style="display: none">글번호</th>
					<th>카테고리</th>
					<th>글제목</th>
					<th>작성일자</th>
					<th>조회수</th>
					<th>거래가능상태</th>
				</tr>
			</thead>

		</table>
		<br>
		<hr>
		<br>
		<h3>커뮤니티 게시판 글목록</h3>
		<select id="comCategory" name="comCategory" onchange="changeComList()">
			<option value="unselect">==카테고리 선택==</option>
			<option value="alert">알리미</option>
			<option value="together">소모임</option>
			<option value="sidejob">아르바이트</option>
			<option value="lost">분실실종</option>
			<option value="help">도움요청</option>
		</select> <br> <br>
		<table border="1" id="comList">
			<thead>
				<tr>
					<th style="display: none">글번호</th>
					<th>카테고리</th>
					<th>글제목</th>
					<th>작성일자</th>
					<th>지역</th>
				</tr>
			</thead>

		</table>
		<br>
		<hr>
		<br>
		<h3>좋아요 게시글 목록</h3>
		<table border="1">
			<thead>
				<tr>
					<th>카테고리</th>
					<th>글제목</th>
					<th>작성일자</th>
					<th>조회수</th>
					<th>거래가능상태</th>
				</tr>
			</thead>
			<c:forEach items="${likesList }" var="likesList">
				<tr>
					<td>${likesList.dealCategory }</td>
					<td id='title'>${likesList.dealTitle}</td>
					<!-- 해당 게시글로 이동하는 기능 => ?? -->
					<td>${likesList.dealDate }</td>
					<td>${likesList.dealHit }</td>
					<td>${likesList.dealState }</td>
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
				//console.log(result);
				if(result != null){
					jsonDealListConvert(result);
				} else {
					
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
				//console.log(result);
				if(result != null){
					jsonComListConvert(result);
				} else {
				
				}
			},
			error: function(){
				console.log("error");
			}
		})
	}
	
 	function jsonDealListConvert(data){
 		$("#dealList tbody").remove();
		let tbody = $("<tbody />");
		let state1 = '거래가능';
		let state2 = '거래중';
		let state3 = '거래완료';
		$.each(data, function(index, item){
			let row = $("<tr />").append(
		   			  $("<td style='display:none' />").text(item.boardId),
					  $("<td />").text(item.dealCategory),
					  $("<td id='title' onclick='selectDeal(this)' />").text(item.dealTitle),
					  $("<td />").text(item.dealDate),
					  $("<td />").text(item.dealHit),
					  $("<td />").append($("<select onchange='changeState(this)'/>")
							     .append($("<option " + (state1 == item.dealState ? 'selected' : '')+">거래가능</option> <option " + (state2 == item.dealState ? 'selected' : '') + ">거래중</option> <option " + (state3 == item.dealState ? 'selected' : '') + ">거래완료</option>")))
					);
			tbody.append(row);
		});
		$('#dealList').append(tbody);
	} 
 	
 	function jsonComListConvert(data){
 		$("#comList tbody").remove();
		let tbody = $("<tbody />");
		$.each(data, function(index, item){
			let row = $("<tr />").append(
   					  $("<td style='display:none' />").text(item.boardId),
					  $("<td />").text(item.comCategory),
					  $("<td id='title' onclick='selectCom(this)'/>").text(item.comTitle),
					  $("<td />").text(item.comDate),
					  $("<td />").text(item.location)
					);
			tbody.append(row);
		});
		$('#comList').append(tbody);
 	}
 	
 	function selectDeal(e){
 		//onclick 이벤트 => board_id를 받아서 그 거래게시판 게시글 조회(페이지 이동)
 		console.log(e); //글번호 받아옴 >> 해당 글 페이지로 이동(수정)
 		let boardId = ((e.previousSibling).previousSibling).textContent;
 		console.log(boardId);
 	}
 	
 	function selectCom(e){
 		//onclick 이벤트 => board_id를 받아서 그 커뮤니티 게시글 조회(페이지 이동)
 		console.log(e);
 		let boardId = ((e.previousSibling).previousSibling).textContent;
 		console.log(boardId);
 	}
 	
 	function changeState(e){
 		//select 값이 변경(onchange 이벤트 발생하면) dealState value를 변경
 		//board id 가져오기
 		console.log(e); //select 태그
 		let boardId = (((e.parentNode).parentNode).childNodes[0]).innerHTML; //게시글 아이디
 		let selectedState = e.value;
 		console.log(selectedState);
 		//console.log(boardId);
 		
 		   $.ajax({
			url : "ajaxDealState.do",
			type : "post",
			data : {selectedState : selectedState, boardId : boardId },
			dataType : "Json",
			success : function(result){
				console.log(result);
			},
			error: function(){
				console.log("error");
			}
		})   
 	}
	
</script>
</body>

</html>