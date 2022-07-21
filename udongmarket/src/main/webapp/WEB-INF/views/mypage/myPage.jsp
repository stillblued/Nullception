<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>myPage.jsp</title>
<script src="js/jquery-3.6.0.min.js"></script>
<style>
	#title:hover{
		color: blue;
	}
	
	#stateAlert:hover{
		color: coral;
	}
	
	th, tr, td{
		text-align: center;
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
			</ul>
		</div>
	</nav>	

	<div align="center">
		<table border="1" class="table table-striped" style="width: 80%; text-align :center;">
			<thead>
				<tr>
					<th colspan="4" style="text-align :center;"><h4>내 정보</h4></th>
				</tr>
			</thead>
			<tbody>
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
			</tbody>
		</table>
		<button type="button" class="btn btn-primary btn-block" style="width: 80px; display: inline-block;" onclick="location.href='myPageUpdate.do'">회원수정</button>
		<button type="button" class="btn btn-primary btn-block" style="width: 80px; margin: 0px; display: inline-block;" onclick="location.href='deleteMember.do'">회원탈퇴</button>
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
		<table border="1" id="dealList" class="table table-striped" style="width: 80%;  text-align :center;">
			<thead>
				<tr>
					<th style="display: none">글번호</th>
					<th style = "text-align :center;">카테고리</th>
					<th style = "text-align :center;">글제목</th>
					<th style = "text-align :center;">작성일자</th>
					<th style = "text-align :center;">거래가능상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan='5' align='center'>게시글이 존재하지 않습니다.</td>
				</tr>
			</tbody>
		</table>
		<br>
		<hr>
		<h3>커뮤니티 게시판 글목록</h3>
		<select name="comCategory" onchange="changeComList()">
			<option value="unselect">==카테고리 선택==</option>
			<option value="alert">알리미</option>
			<option value="together">소모임</option>
			<option value="sidejob">아르바이트</option>
			<option value="lost">분실실종</option>
			<option value="help">도움요청</option>
		</select> <br> <br>
		<table border="1" id="comList" class="table table-striped" style="width: 80%;  text-align :center;">
			<thead>
				<tr>
					<th style="display: none">글번호</th>
					<th style = "text-align :center;">카테고리</th>
					<th style = "text-align :center;">글제목</th>
					<th style = "text-align :center;">작성일자</th>
					<th style = "text-align :center;">지역</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan='4' align='center'>게시글이 존재하지 않습니다.</td>
				</tr>
			</tbody>
		</table>
		<br>
		<hr>
		<br>
		<h3>좋아요 게시글 목록</h3>
		<table border="1" class="table table-striped" style="width: 80%;  text-align :center;">
			<thead>
				<tr>
					<th style = "text-align :center;">카테고리</th>
					<th style = "text-align :center;">글제목</th>
					<th style = "text-align :center;">작성일자</th>
					<th style = "text-align :center;">거래가능상태</th>
				</tr>
			</thead>
			<c:forEach items="${likesList }" var="likesList">
				<tr>
					<td>${likesList.dealCategory }</td>
					<td id='title'>${likesList.dealTitle}</td>
					<!-- 해당 게시글로 이동하는 기능 => ?? -->
					<td>${likesList.dealDate }</td>
					<td>${likesList.dealState }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 위치 헤더로 옮기기 / div + checkCommentState() + setInterval -->
	<!-- <h3>알림</h3>
	<div align="center" style="color:navy; width:20px; height: 20px;">
		<table id="alert">
			<thead style="display:none">
			<tr>
				<th>알림 내용</th>
			</tr>
			</thead>
			
		</table>
	
	</div> -->

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
		let category = $('select[name=comCategory] option:selected').text();
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
		if(data.length>0){
			$.each(data, function(index, item){
				let row = $("<tr />").append(
			   			  $("<td style='display:none' />").text(item.boardId),
						  $("<td />").text(item.dealCategory),
						  $("<td id='title' onclick='selectDeal(this)' style='cursor:pointer' />").text(item.dealTitle),
						  $("<td />").text(item.dealDate),
						  $("<td />").append($("<select onchange='changeState(this)'/>")
								     .append($("<option " + (state1 == item.dealState ? 'selected' : '')+">거래가능</option> <option " + (state2 == item.dealState ? 'selected' : '') + ">거래중</option> <option " + (state3 == item.dealState ? 'selected' : '') + ">거래완료</option>")))
						);
				tbody.append(row);
			});	
		} else{
			let row = $("<td colspan='5' align='center' />)").text("게시글이 존재하지 않습니다.");
			tbody.append(row);
		}
		$('#dealList').append(tbody);
	} 
 	
 	function jsonComListConvert(data){
 		$("#comList tbody").remove();
		let tbody = $("<tbody />");
		if(data.length>0){
			$.each(data, function(index, item){
				let row = $("<tr />").append(
	   					  $("<td style='display:none' />").text(item.boardId),
						  $("<td />").text(item.comCategory),
						  $("<td id='title' onclick='selectCom(this)' style='cursor:pointer' />").text(item.comTitle),
						  $("<td />").text(item.comDate),
						  $("<td />").text(item.location)
						);
				tbody.append(row);
			});
		} else{
			let row = $("<td colspan='4' align='center' />)").text("게시글이 존재하지 않습니다.");
			tbody.append(row);
		}
		$('#comList').append(tbody);
 	}
 	
 	function selectDeal(e){
 		//onclick 이벤트 => board_id를 받아서 그 거래게시판 게시글 조회(페이지 이동)
 		console.log(e); //글번호 받아옴 >> 해당 글 페이지로 이동(수정)
 		let boardId = ((e.previousSibling).previousSibling).textContent;
 		console.log(boardId);
 		location.href='dealDetail.do?boardId='+boardId;
 	}
 	
 	function selectCom(e){
 		//onclick 이벤트 => board_id를 받아서 그 커뮤니티 게시글 조회(페이지 이동)
 		console.log(e);
 		let boardId = ((e.previousSibling).previousSibling).textContent;
 		console.log(boardId);
 		location.href='communityDetail.do?boardId='+boardId;
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
 	
 	/* function checkCommentState(){
 		//댓글 상태 확인
 		//체크 요청을 보내면 ajax로 상태를 받아와서 확인(interval로 작동시간 정해주기)
 		//읽지 않은 댓글의 개수(count)값이 있으면 개수를 result로 반환하고 닉네임이 다르면 빈 문자열을 반환(알림이 없음)
 		let state = "check";
 		$.ajax({
 			url : "ajaxcommentCheck.do",
 			type : "post",
 			data : {state : state},
 			dataType : "Json",
 			success : function(result){
 				console.log("result : "+ result);
 				jsonStateConvert(result);
 			},
 			error: function(){
 				console.log("error");
 			}
 		})
 	}
 	
 	function jsonStateConvert(data){
		console.log(data)
 		$("#alert tbody").remove();
		//if data(count)가 0보다 크면 테이블에 출력
		if(data>0){
			let tbody = $("<tbody />");
			let row = $("<tr />").append(
					  $("<td id='stateAlert' onclick='commentsList()'/>").text(data)
					);
			tbody.append(row);
			$('#alert').append(tbody);
		} else{ //count가 0이면 댓글이 없습니다 알림 출력
			let tbody = $("<tbody />");
			let row = $("<tr />").append(
					  $("<td />").text("0")
					);
			tbody.append(row);
			$('#alert').append(tbody);
		}
 	}
 	
 	
 	window.onload = checkCommentState();
 	setInterval(function(){
 		checkCommentState();
 	}, 6000); 
 	
 	function commentsList(){
 		//내가 확인하지 않은 댓글들의 리스트를 보여줌
 		location.href='printCommentLists.do';
 	}*/
	
</script>
</body>

</html>