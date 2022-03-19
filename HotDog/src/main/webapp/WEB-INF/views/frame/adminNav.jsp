<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#nav_bar {
	margin-left: 10px;
	height: 100%;
}
</style>
<div id="nav_bar"
	class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
	style="width: 280px">
		<span class="fs-4">관리자 메뉴</span>
	<hr />
	<ul class="nav nav-pills flex-column mb-auto">
		<li class="nav-item"><a
			href="${pageContext.request.contextPath}/admin/board"
			class="nav-link text-white" aria-current="page"> 게시글 작성 </a></li>
		<li class="nav-item"><a
			href="${pageContext.request.contextPath}/admin/board/announcement"
			class="nav-link text-white"> 공지 게시글 목록 </a></li>
		<li class="nav-item"><a
			href="${pageContext.request.contextPath}/admin/board/event"
			class="nav-link text-white"> 이벤트 게시글 목록 </a></li>
		<li class="nav-item"><a href="#" class="nav-link text-white">
				Products </a></li>
		<li class="nav-item"><a href="#" class="nav-link text-white">
				Customers </a></li>
	</ul>
	<hr />
	<div class="dropdown" style="text-align: right;">
		<a href="${pageContext.request.contextPath}/logout/admin" style="color: white; text-decoration: none; ">로그아웃</a>
	</div>
</div>
