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

<title>추천장소 > ${pageView.title}</title>


</head>
<body>
	<div style="margin: 0 280px;">
		<!-- Top Nav bar -->
		<%@ include file="/WEB-INF/views/frame/nav.jsp"%>


		<!-- content 시작 -->
		<main role="main" class="container">

			<div class="my-3 p-3 bg-white rounded shadow-sm">
				<table class="table">
					<tr></tr>
					<td><img
						src="${pageContext.request.contextPath}/uploadfile/${pageView.fileName}"
						class="card-img-top" alt="" style="width:60%; height:350px;"></td>

					<tr>
						<td>${pageView.title}</td>
					</tr>

					<tr>
						<td>${pageView.newAddress}</td>
					</tr>
					<tr>
						<td>${pageView.phone}</td>
					</tr>
					<tr>
						<td>${pageView.affiliation}</td>
					</tr>
					<tr>
						<td><a href="${pageView.homepage}" target="_blank">${pageView.homepage}</a></td>
					</tr>
					<tr>
						<td><div id="map" style="width: 60%; height: 350px;"></div></td>
					</tr>

				</table>

				<!-- 스크랩 영역 -->
				<div>
					<a class="text-dark scarp" style="text-decoration-line: none; cursor:pointer;">
						<img id="scrap" src="http://localhost:8080/hgs/images/bookmark-star.svg" style="width:30px;">
						스크랩
					</a>
				</div>
			</div>


			<div id="replyList"
				class="col-md-12 my-3 p-3 bg-white rounded shadow-sm">
				<h4 class="border-bottom border-gray pb-2 mb-0">후기</h4>
				<!-- 등록된 후기가 없을 시 -->
				<c:if test="${empty replyList}">
					<tr>
						<td><h5>등록된 후기가 없습니다.</h5></td>
					</tr>
				</c:if>
				<!-- 등록된 후기가 있을 시 -->
				<c:if test="${not empty replyList}">
					<c:forEach items="${replyList}" var="reply">

						<div id="reply${reply.placeReplyIdx}"
							class="media text-muted pt-3">

							<p
								class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
								<strong class="d-block text-gray-dark">@${reply.name}</strong>
								${reply.content}
							</p>

							<div onclick="deleteReply(${reply.placeReplyIdx})"
								class="badge  badge-info" style="color: red; cursor:pointer;">X</div>
						</div>
					</c:forEach>
				</c:if>

			</div>

			<!-- 후기 작성 폼 -->
			<div class="col-md-12 my-3 p-3 bg-white rounded shadow-sm">
				<h5 class="border-bottom border-gray pb-2 mb-0">${logger.name}</h5>

				<form id="replyWriteForm" class=" text-right" method="POST">

					<textarea name="content" id="content" rows="5" cols="30"
						class="form-control p-3" required></textarea>

					<input type="hidden" name="memberIdx" value="${logger.memberIdx}">
					<input type="hidden" name="placeIdx" value="${pageView.placeIdx}">
					<br /> <input type="submit" value="후기작성" class="btn btn-success">
				</form>

			</div>

			<div class="my-3 p-3 bg-white rounded shadow-sm mb-5">
				<a href="list" class="btn btn-success">목록</a>
				<!-- logger가 admin이면.... --><c:if test="${logger.name eq pageView.name}">
					<a href="update?placeIdx=${pageView.placeIdx}" class="btn btn-info">수정</a>
					<a href="delete?placeIdx=${pageView.placeIdx}"
						class="btn btn-danger">삭제</a>
				</c:if>

			</div>

		</main>

	</div>





	<!-- 스크랩 버튼 클릭 시 동작 -->
	<script>
	
 	     $(document).ready(function () {

 	 		// 좋아요가 있는지 확인한 값을 heartval에 저장
 	    	var list = [${placeScrap.memberIdx}];
	 		
 	 		console.log(list);
	 		
 	 		console.log('이값은' + $("#scrap").attr("src"));

 	        if(list.includes(${logger.memberIdx})) {

 	             $("#scrap").prop("src", "http://localhost:8080/hgs/images/bookmark-star-fill.svg");
	             
 	         } else {

 	             $("#scrap").prop("src", "http://localhost:8080/hgs/images/bookmark-star.svg");
	             
          }

 	 	// 좋아요 버튼을 클릭 시 실행되는 코드
 	        $("#scrap").on("click", function () {
	        	
 	 	    $.ajax({
 	 	    	url :'${pageContext.request.contextPath}/place/placeScrap',
 	 	        type :'POST',
 	 	        data : {'placeIdx':${pageView.placeIdx}, 'memberIdx':${logger.memberIdx}},
 	 	    	success : function(data){
	 	    		
 	 	    		console.log(data);
 	 	    		
 	 	        if($("#scrap").attr("src") == "http://localhost:8080/hgs/images/bookmark-star.svg") {
					
 	 	        	location.reload();
 	 	        	
 	 	           	$('#scrap').prop("src","http://localhost:8080/hgs/images/bookmark-star-fill.svg");
	 	            
	 	           
  	        	} else if ($("#scrap").attr("src") == "http://localhost:8080/hgs/images/bookmark-star-fill.svg"){
	                
  	        		location.reload();
  	        		
  	        		$('#scrap').prop("src","http://localhost:8080/hgs/images/bookmark-star.svg");
 	        		
 	 	        	}
 	              	}
 	 	    });
 	         });
  	     });
	</script> 





	<!-- 후기작성 버튼 클릭 시 동작  -->
	<script>
		$("#replyWriteForm").submit(
					function() {
							$.ajax({
									url : '${pageContext.request.contextPath}/place/reply',
									type : 'POST',
									data : $(this).serialize(),
									success : function(data) {

											var html = '';
											html += '<div id="reply'+data+'" class="media text-muted pt-3">';
											html += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">';
											html += '<strong class="d-block text-gray-dark">@${logger.name}</strong>';
											html += $('#message').val();
											html += '</p>';
											html += '<div onclick="deleteReply('+data+')" class="badge badge-info">X</div>';
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
					url : '${pageContext.request.contextPath}/place/reply/'+placeReplyIdx,
					type : 'DELETE',
					success : function(data){
						if(data == '1'){

							$('#reply'+placeReplyIdx).remove();
							
						}
						location.reload();
					}
				});
			}
		}
		
	
		
	</script>
	
	<!-- 카카오맵 API -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b831cb9231e82dc116c15d613033258a&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${pageView.oldAddress}',
				function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">${pageView.title}</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
								 
							}
						});
		
		
		
						
	</script>
	<script>
	console.log($(".btn-click"))
	$(".btn-click").on("click",(function(){
		console.log("gdgd")
		const display =	$(".accordion-body").css("display");
		if(display === "none"){
			$(".accordion-body").css("display","block");
		} else {
			$(".accordion-body").css("display","none");
		}
	}))

</script>
</body>
</html>