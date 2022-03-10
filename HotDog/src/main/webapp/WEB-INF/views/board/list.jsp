<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:8080/hgs/css/list.css" />

<style>
.placeList-container {
	background-color: #D5D5D5;

}



</style>



<title>게시물 리스트</title>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	
	<div class="placeList-container" style="background-color= #D5D5D5"> 
		
		<div id="content">
			<div class="text-info">
				<h3 class="place-text-h3">커뮤니티</h3>
				<nav
					style="-bs-breadcrumb-divider: url(&amp; #34; data: image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&amp;#34;);"
					aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/hgs/home">메인</a></li>
						<li class="breadcrumb-item active" aria-current="page">커뮤니티</li>
					</ol>
				</nav>
			</div>

			<!-- 게시물 등록 버튼 -->
			<a class="btn btn-primary" href="register" role="button">등록</a>
		</div>

		<!-- 게시물 리스트 영역 -->
		<div class="place-list">
			<c:if test="${not empty listView.list}">
				<c:forEach items="${listView.list}" var="boards">
					
					<!-- 게시물을 표현할 카드 -->
					<div class="card" style="width: 50%;" onclick="location.href='${pageContext.request.contextPath}/board/view?boardIdx=${boards.boardIdx}';" >
							<img
							src="${pageContext.request.contextPath}/uploadfile/${boards.fileName}"
							class="card-img-top" alt="...">
						<div class="card-body">
							<!-- 해시태그 가 표현될 영역 최대 3개 --><div style="color: gray">#중형견, #산책가고싶어, #휴무</div>
							<h5 class="card-title">${boards.title}</h5>
							<h6 class="card-address">${boards.content}</h6>
						</div>
						<!-- 게시물을 표현할 카드 끝 -->
					</div>
				</c:forEach>
			</c:if>
		</div>
		<!-- 게시물 리스트 영역 끝 -->
	</div>




</body>
</html>