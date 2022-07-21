<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>dealDetail</title>
</head>
<body>

	<br>
	<br>

	<div align="center"  width="60%">
	
	<div><h1> ${ vo.dealTitle}</h1></div>
<br>
		<table id="tb" border="1" width="60%">


			<tr>
				<th>작성자</th>
				<td>${ vo.nickname}</td>
				<th>작성일</th>
				<td>${ vo.dealDate}</td>
			</tr>

			<tr>
				<td colspan="4"><c:if test="${not empty vo.attachDir }">
						<img src="${vo.attachDir}" width="50%">
					</c:if> ${vo.dealContent }</td>
			</tr>
		</table>

		<br>

		<c:if test="${vo.nickname eq nick }">
			<form name="Frm" action="dealUpdate.do" method="post"
				enctype="application/x-www-form-urlencoded">
				<input type="hidden" id="boardId" name="boardId"
					value="${vo.boardId}" />
				<button type="submit">수정</button>
				<button type="button" onclick="delDeal(${vo.boardId})">삭제</button>
			</form>
		</c:if>

		<c:if test="${not empty nick }">
			<button type="button" id="Ilikeit"
				onclick="likeDeal(${ vo.boardId})">♥</button>
			<button type="button"
				onclick="location.href='faqForm.do?reportedId=${ vo.nickname}'">신고</button>
		</c:if>

		<button type="button" onclick="location.href='dealList.do'">목록</button>


		<hr>


		<table border="1" width="60%">

			<tbody id="comm">
				<c:forEach items="${coList}" var="list">
					<tr>
						<th>${list.commentsNick }</th>
						<td>${list.commentsContent }</td>
						<td>${list.commentsDate }</td>
						<td><c:if test="${ not empty nick }">
								<button type="button"
									onclick="location.href='faqForm.do?reportedId=${list.commentsNick }'">신고</button>
							</c:if> <c:if test="${ nick eq list.commentsNick }">
								<button type="button" onclick="comDelete(${list.commentsId })">삭제</button>
							</c:if></td>
					</tr>
				</c:forEach>

				<c:if test="${empty coList}">
					<tr id="coEmpty">
						<td colspan="6" align="center">등록된 댓글이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>


		<c:if test="${not empty nick}">

			<table border="1" width="60%">
				<tr>
					<td>${nick}</td>
					<td><textarea id="commentsContent"></textarea></td>
					<td><button type="button" onclick="comInsert()">등록</button></td>
				</tr>
			</table>

		</c:if>

	</div>
	<br>
	<br>



	<script>
	
	function likeDeal(data) {
		let BoardId = data;
		if(confirm('관심 상품에 추가하시겠습니까?')){  
			$.ajax({
				url : "ajaxLikeDeal.do",
				type : "post",
				data : { BoardId : BoardId
				},
				dataType : "Json",
				
				success : function(result) {
					if (result != null) {
						
						$("#Ilikeit").attr('disabled', true);
						alert("관심 상품 추가!");

					} else {
						alert("추가 실패");
					}
				},
				
				error : function(err) {
					console.log(err);
				}
				
			})
			}
		
	}
	
	
	function comInsert(){

		let Content = $("#commentsContent").val();
		let BoardId = ${vo.boardId};
		let BoardNick = '${vo.nickname}';
		
		$("#commentsContent").val('');

		$.ajax({
			url : "ajaxCommentsInsert.do",
			type : "post",
			data : {
				Content : Content,
				BoardId : BoardId,
				BoardNick : BoardNick
			},
			dataType : "Json",
			success : function(result) {
				if (result != null) {
					
					window.location.reload();
					
				} else {
					alert("댓글 등록 실패.");
				}
			},
			error : function(err) {
				console.log("err");
			}
		})
	}
	
	function comDelete(data) {
		let CommentsId = data;
		
		if(confirm('댓글을 삭제하시겠습니까?')){  
		$.ajax({
			url : "ajaxCommentsDelete.do",
			type : "post",
			data : { CommentsId : CommentsId
			},
			dataType : "Json",
			
			success : function(result) {
				if (result != null) {
			
					window.location.reload();

				} else {
					alert("댓글 삭제 실패.");
				}
			},
			
			error : function(err) {
				console.log(err);
			}
		})
		}
	}
	
function delDeal (data) {
		
		let BoardId = data;
		
		if(confirm('게시글을 삭제하시겠습니까?')){  
			
			$.ajax({
				url : "ajaxDealDelete.do",
				type : "post",
				data : { BoardId : BoardId },
				dataType : "Json",
				success : function(result) {

					if (result != null) {
						location.replace('dealList.do');

					} else {
						alert("게시글 삭제 실패.");
					}},
				error : function() {
					console.log("error");
				}
			});
		
		};
	}
		

</script>




</body>
</html>