<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
<style type="text/css">
html, body {
	margin: 0;
	height: 100%;
	overflow: hidden;
}

#container {
	height: 100%;
}
</style>
</head>
<body>
	<div id="container" class="row">
		<%@ include file="/WEB-INF/views/frame/adminNav.jsp"%>
		<div class="col-md-8" style="margin-top: 50px;">
			<h3>게시글 목록</h3>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">게시글 번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${board}" var="b">
						<tr>
							<th scope="row">${b.adminBoardIdx}</th>
							<td><a
								href="${pageContext.request.contextPath}/admin/board/detail/${b.adminBoardIdx}">${b.title}</a></td>
							<td><c:out value="${fn:substring(b.createDate, 0, 10)}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>