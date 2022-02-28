<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
.rating .rate_radio {
	width: 30px;
	height: 30px;
	background-color: #fff;
	cursor: pointer;
	display: none;
}

.rating .rate_radio+label {
	display: inline-block;
	width: 30px;
	height: 30px;
	background-image: url('../images/starrate.png');
	background-repeat: no-repeat;
	background-size: 30px 30px;
	cursor: pointer;
	background-color: #F0F0F0;
}

.rating .rate_radio:checked+label {
	background-color: #FFBB00;
}
</style>


</head>
<body>

	<!-- 해더 시작 -->

	<!-- 해더 끝 -->

	<!-- 네비게이션 시작 -->

	<!-- 네비게이션 끝 -->

	<!-- content 시작 -->

	<table class="table">
		
		<tr>
			<td>번호</td>
			<td>${pageView.boardIdx}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${pageView.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${pageView.content}</td>
		</tr>
	</table>

	<div>
		<a id="scrap" class="text-dark heart"
			style="text-decoration-line: none;"> 스크랩 </a>
	</div>

	
	<!-- 댓글 리스트 영역-->
	<div id="relplyList">
		<h3>후기</h3>
		<c:if test="${empty replyList}">
			<tr>
				<td><h3>등록된 댓글이 없습니다.</h3></td>
			</tr>
		</c:if>

		<c:if test="${not empty replyList}">
			<c:forEach items="${replyList}" var="reply">

				<div id="reply${reply.boardReplyIdx}">
					
					<p>${reply.boardReplyIdx}</p>
					<p>${reply.content}</p>

				<div onclick="deleteReply(${reply.boardReplyIdx})" class="badge badge-info">x</div>
				</div>
			</c:forEach>
		</c:if>
	</div>

	<!-- 댓글 작성 영역-->
	<div class="col-md-8">

		<form id="replyWriteForm" class="text-right" method="POST">


			<textarea name="content" id="content" rows="5" cols="30"
				class="form-control p-3" required></textarea>

			<!-- <input type="hidden" name="memberIdx" value="${user.member.idx}"> -->
			<input type="hidden" name="boardIdx" value="${pageView.boardIdx}">

			<br> <input type="submit" value="작성" class="btn btn-primary">
		</form>
	</div>


	<button data-oper='update'>수정</button>
	<button data-oper='list'>목록보기</button>

	<form id='operForm' action="/board/update" method="get">
		<input type="hidden" id='boardIdx' name='boardIdx'
			value='<c:out value="${pageView.boardIdx}"/>'>
	</form>



	<!-- 수정 버튼 동작 -->
	<script>
	$(document).ready(function() {

		var operForm = $('#operForm')

		$("button[data-oper='update']").on("click", function(e) {

			operForm.attr("action", "update").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("boardIdx").remove();
			operForm.attr("action", "board/list")
			operForm.submit();
		});

	});
	</script>




	<!--  댓글작성 버튼 클릭 시 동작  -->
	<script>
		$("#replyWriteForm").submit(
					function() {
							$.ajax({
									url : '${pageContext.request.contextPath}/board/reply',
									type : 'POST',
									data : $(this).serialize(),
									success : function(data) {

											var html = '';
											html += '<div id="reply'+data+'" class="media text-muted pt-3">';
											html += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">';
											html += $('#content').val();
											html += '</p>';
											html += '<div onclick="deleteReply('
													+ data
													+ ')" class="badge badge-info">x</div>';
											html += '</div>';

											$('#replyList').append(html);
											$('#content').val('');
											location.reload();
										},
										error : function() {
											console.log('통신에러!');
										}

									});

							return false;
						});
		
		
		function deleteReply(placeReplyIdx){
			
			if(confirm('댓글을 삭제하시겠습니까?')){
				
				
				
				$.ajax({                       
					url : '${pageContext.request.contextPath}/board/reply/'+boardReplyIdx,
					type : 'DELETE',
					success : function(data){
						if(data == '1'){

							$('#reply'+boardReplyIdx).remove();
							
						}
						location.reload();
					}
				});
			}
		}
		
	
		
	</script>
	
	
	
	




</body>
</html>