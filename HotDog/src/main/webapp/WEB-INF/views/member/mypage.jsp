<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>

<%@ include file="/WEB-INF/views/frame/pageform.jsp"%>

<style>
body {
	height: 2000px;
	padding-top: 150px;
	background-image:
		url('${pageContext.request.contextPath}/uploadfile/civa.jpg');
}

.my-3 {
	margin-top: 200px;
	padding-top: 200px;
	/* 	border: 3px solid black; */
	height: 700px;
	width: 400px;
	
	margin-left : 360px;
}

.main {
	margin-top: 400px;
	padding-top: 500px;
}
</style>

</head>
<body>

	<!-- 해더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 해더 끝 -->

	<!-- 네비게이션 시작 -->
<%-- 	<%@ include file="/WEB-INF/views/frame/nav.jsp"%> --%>
	<!-- 네비게이션 끝 -->

	<!-- content 시작 -->

	<main role="main" class="container">

		<div class="my-3 p-3 bg-white rounded shadow-sm">

			<h4>${member.name}님의정보</h4>

			<hr>

			<table class="table">
				<tr>
					<td>이메일</td>
					<td>${member.email}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${member.name}</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<c:if test="${member.sex eq 1}">
							남자
						</c:if>
						<c:if test="${member.sex ne 1}">
							여자
						</c:if>
						</td>
				</tr>
				<tr>
					<td>펫 등록번호</td>
					<td>${member.petNumber}</td>
				</tr>
				<tr>
					<td>중성화 여부</td>
					<td>
						<c:if test="${member.neutering eq 1}" >
							Y
						</c:if>
						<c:if test="${member.neutering ne 1}">
							N
						</c:if>
						</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${member.address}</td>
				</tr>
				<tr>
					<td>프로필 사진</td>
					<td><img
						src="${pageContext.request.contextPath}/uploadfile/${member.profile}"
						height="100"></td>
				</tr>

			</table>

			<a href="/hgs/member/manager/memberEdit?idx=${member.memberIdx}">
				내 정보 수정</a> <a href="/hgs/home" class="btn btn-info"> 홈으로 </a>



		</div>

	</main>
</body>
</html>