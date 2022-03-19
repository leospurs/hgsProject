<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>커뮤니티 > ${pageView.title}</title>


</head>
<body>
	<div style="margin: 0 280px;">
		<!-- Top Nav bar -->
		<%@ include file="/WEB-INF/views/frame/nav.jsp"%>


		<!-- content 시작 -->
		<main role="main" class="container">

			<div class="my-3 p-3 bg-white rounded shadow-sm">
				<table class="table">
					<tr>
						<td>작성자</td>
						<td>${pageView.name}</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td>${pageView.createDate}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${pageView.title}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><pre style="line-height: 180%">${pageView.content}</pre></td>
					</tr>
					<tr>
						<td>사진</td>
						<td><img
							src="${pageContext.request.contextPath}/uploadfile/${pageView.fileName}"
							width="500px"></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td><span class="badge bg-secondary"><h5>#간식</h5></span> <span -->
<!-- 							class="badge bg-secondary"><h5>#손</h5></span> <span -->
<!-- 							class="badge bg-secondary"><h5>#불독</h5></span></td> -->
<!-- 					</tr> -->
				</table>

				<!-- 좋아요 하트 영역 -->
				<div>
					<a class="text-dark heart" style="text-decoration-line: none; cursor:pointer;">
						<img id="heart" src="http://localhost:8080/hgs/images/heart.svg">
						좋아요
					</a>
				</div>
			</div>

			<div id="replyList"
				class="col-md-12 my-3 p-3 bg-white rounded shadow-sm">
				<h4 class="border-bottom border-gray pb-2 mb-0">댓글</h4>
				<!-- 등록된 댓글이 없을 시 -->
				<c:if test="${empty replyList}">
					<tr>
						<td><h5>등록된 댓글이 없습니다.</h5></td>
					</tr>
				</c:if>
				<!-- 등록된 댓글이 있을 시 -->
				<c:if test="${not empty replyList}">
					<c:forEach items="${replyList}" var="reply">

						<div id="reply${reply.boardReplyIdx}"
							class="media text-muted pt-3">

							<p
								class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
								<strong class="d-block text-gray-dark">@${reply.name}</strong>
								${reply.content}
							</p>

							<div onclick="deleteReply(${reply.boardReplyIdx})"
								class="badge  badge-info" style="color: red; cursor:pointer;">X</div>
						</div>
					</c:forEach>
				</c:if>

			</div>

			<!-- 댓글 작성 폼 -->
			<div class="col-md-12 my-3 p-3 bg-white rounded shadow-sm">
				<h5 class="border-bottom border-gray pb-2 mb-0">${logger.name}</h5>

				<form id="replyWriteForm" class=" text-right" method="POST">

					<textarea name="content" id="content" rows="5" cols="30"
						class="form-control p-3" required></textarea>

					<input type="hidden" name="memberIdx" value="${logger.memberIdx}">
					<input type="hidden" name="boardIdx" value="${pageView.boardIdx}">
					<br /> <input type="submit" value="댓글작성" class="btn btn-success">
				</form>

			</div>

			<div class="my-3 p-3 bg-white rounded shadow-sm mb-5">
				<a href="list" class="btn btn-success">목록</a>
				<c:if test="${logger.name eq pageView.name}">
					<a href="update?boardIdx=${pageView.boardIdx}" class="btn btn-info">수정</a>
					<a href="delete?boardIdx=${pageView.boardIdx}"
						class="btn btn-danger">삭제</a>
				</c:if>

			</div>

		</main>


	</div>

	<!-- 좋아요 버튼 클릭 시 동작 -->
	<script>
	
	     $(document).ready(function () {

	 		// 좋아요가 있는지 확인한 값을 heartval에 저장
	    	var list = [${boardLike.memberIdx}];
	 		
	 		console.log(list);
	 		
	 		console.log('이값은' + $("#heart").attr("src"));

	        if(list.includes(${logger.memberIdx})) {

	             $("#heart").prop("src", "http://localhost:8080/hgs/images/heart-fill.svg");
	             
	         } else {

	             $("#heart").prop("src", "http://localhost:8080/hgs/images/heart.svg");
	             
         }

	 	// 좋아요 버튼을 클릭 시 실행되는 코드
	        $("#heart").on("click", function () {
	        	
	 	    $.ajax({
	 	    	url :'${pageContext.request.contextPath}/board/boardLike',
	 	        type :'POST',
	 	        data : {'boardIdx':${pageView.boardIdx}, 'memberIdx':${logger.memberIdx}},
	 	    	success : function(data){
	 	    	
	 	    	console.log(data);
	 	    	
	 	        if($("#heart").attr("src") == "http://localhost:8080/hgs/images/heart.svg") {
					
	 	        	location.reload();
	 	           	$('#heart').prop("src","http://localhost:8080/hgs/images/heart-fill.svg");
	 	            
	 	           
 	        	} else if ($("#heart").attr("src") == "http://localhost:8080/hgs/images/heart-fill.svg"){
	                
 	        		location.reload();
 	        		$('#heart').prop("src","http://localhost:8080/hgs/images/heart.svg");
 	        		
	 	        	}
	              	}
	 	    });
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
						html += '<strong class="d-block text-gray-dark">@${logger.name}</strong>';
						html += $('#message').val();
						html += '</p>';
						html += '<div onclick="deleteReply('+data+')" class="badge  badge-info" style="color: black;">x</div>';
						html += '</div>';
						html += '<hr>';

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
		
		
		function deleteReply(boardReplyIdx){
			
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