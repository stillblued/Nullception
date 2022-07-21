<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageCommentsList.jsp</title>

<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<br>
	<div align="center">
		<button type="button" class="btn btn-info" style="color: white; width: 80%; text-align :center; margin-bottom: 15px;" >거래게시판</button>
		<table border = "1" id="dealCommentsList" class="table table-striped" style="width: 80%;  text-align :center;">
			<thead>
			<tr>
				<th style = "text-align :center;">글제목</th>
				<th style = "text-align :center;">카테고리</th>
				<th style = "text-align :center;">작성일자</th>
				<th style = "text-align :center;">거래상태</th>
				<th style = "text-align :center;">지역</th>
			</tr>
			</thead>
		</table>
	</div>
	<hr>
	<div align="center">
	<button type="button" class="btn btn-info" style="color: white; width: 80%; text-align :center; margin-bottom: 15px;" >커뮤니티 게시판</button>
	<table border = "1" id="commCommentsList" class="table table-striped" style="width: 80%;  text-align :center;">
		<thead>
		<tr>
			<th style = "text-align :center;">글제목</th>
			<th style = "text-align :center;" >카테고리</th>
			<th style = "text-align :center;">작성일자</th>
			<th style = "text-align :center;">지역</th>
		</tr>
		</thead>
	</table>
	<div aling="center">
		<button type="button" class="btn btn-info" role="button" style="color: white;" onclick="commentCheck()">알림 확인</button>
		<button type="button" class="btn btn-info" role="button" style="color: white;" onclick="location.href='main.do'">메인으로</button>		
	</div>
	</div>
	<br>

	<script>
	window.onload = ajaxDealList();
	window.onload = ajaxCommList();
	
	function ajaxDealList(){
		//거래게시판 리스트를 ajax로 받아오는 함수
		$.ajax({
			url : "ajaxDealPrintCommentLists.do",
			type : "post",
			dataType : "Json",
			success : function(result){
				console.log(result);
				jsonAjaxDealListConvert(result);
			},
			error: function(){
				console.log("error");
			}
		})   
	}
	
	function ajaxCommList(){
		//거래게시판 리스트를 ajax로 받아오는 함수
		$.ajax({
			url : "ajaxCommPrintCommentLists.do",
			type : "post",
			dataType : "Json",
			success : function(result){
				console.log(result);
				jsonAjaxCommListConvert(result);
			},
			error: function(){
				console.log("error");
			}
		})   
	}
	
	function jsonAjaxDealListConvert(data){
		//데이터를 테이블에 넣어주는 함수(일단 거래게시판 먼저)
		$("#dealCommentsList tbody").remove();
		let tbody = $("<tbody />");
		if(data.length>0){
			$.each(data, function(index, item){
				let row = $("<tr />").append(
	  					  $("<td style='display:none' />").text(item.boardId),
						  $("<td />").text(item.dealCategory),
						  $("<td id='title' onclick='commentOneCheck(this)' />").text(item.dealTitle),
						  $("<td />").text(item.dealDate),
						  $("<td />").text(item.dealState),
						  $("<td />").text(item.location)
						 );
				tbody.append(row);
			});	
		} else{
			let row = $("<td colspan='5' />)").text("댓글이 존재하지 않습니다.");
			tbody.append(row);
		}
		$('#dealCommentsList').append(tbody);
	}
	
	function jsonAjaxCommListConvert(data){
		//데이터를 테이블에 넣어주는 함수(일단 거래게시판 먼저)
		$("#commCommentsList tbody").remove();
		let tbody = $("<tbody />");
		if(data.length>0){
			$.each(data, function(index, item){
				let row = $("<tr />").append(
						  $("<td style='display:none' />").text(item.boardId),
						  $("<td />").text(item.comCategory),
						  $("<td id='title' onclick='commentOneCheck(this)' />").text(item.comTitle),
						  $("<td />").text(item.comDate),
						  $("<td />").text(item.location)
						 );
				tbody.append(row);
			});	
		} else{
			let row = $("<td colspan='4' align='center' />)").text("댓글이 존재하지 않습니다.");
			tbody.append(row);
		}
		$('#commCommentsList').append(tbody);
	}
	
	function commentCheck(){
		$.ajax({
			url : "ajaxUpdateComments.do",
			type : "post",
			dataType : "Json",
			success : function(result){
				
			},
			error: function(){
				console.log("error");
			}
		})  
		ajaxDealList();
		ajaxCommList();
	}
	
	 function commentOneCheck(e){
		let boardId = ((e.previousSibling).previousSibling).textContent;
		let table = (((e.parentNode).parentNode).parentNode);
		let tableId = $(table).attr('id');
		 $.ajax({
			url : "ajaxUpdateComments.do",
			type : "post",
			data : {boardId : boardId},
			dataType : "Json",
			success : function(result){
				console.log(result);
			},
			error: function(){
				console.log("error");
			}
		}) 
		if(tableId == 'dealCommentsList'){
			ajaxDealList();
			location.href='dealDetail.do?boardId='+boardId;
		} else{
			ajaxCommList();
			location.href='communityDetail.do?boardId='+boardId;
		}
	} 
	
	</script>
	
</body>
</html>