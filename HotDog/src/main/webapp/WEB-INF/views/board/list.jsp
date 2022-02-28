<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
	font-size: 20px;
}

a {
	text-decoration: none;
	color: #333;
	font-size: 20px;
}

.wrap {
	padding: 15px;
}

.tab_menu {
	position: relative;
}

.tab_menu .list {
	overflow: hidden;
}

.tab_menu .list li {
	float: left;
	margin-right: 14px;
}

.tab_menu .list .btn {
	font-size: 13px;
}

.tab_menu .list .cont {
	display: none;
	position: absolute;
	top: 25px;
	left: 0;
	color: #000;
	text-align: center;
	width: 900px;
	height: 500px;
	line-height: 100px;
}

.tab_menu .list li.is_on .btn {
	font-weight: bold;
	color: black;
}

.tab_menu .list li.is_on .cont {
	display: block;
}


</style>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>

	<!-- 해더 시작 -->

	<!-- 해더 끝 -->

	<!-- 네비게이션 시작 -->

	<!-- 네비게이션 끝 -->

	<!-- content 시작 -->
	<div id="content">
		<h3>게시물 목록</h3>
		<a href="register">작성</a>

		<!-- 탭 메뉴 -->		
		<div id="board-content">
			<table>
				<c:if test="${not empty listView.list}">
						<tr>
							<th>idx</th>
							<th>제목</th>
						</tr>
						<c:forEach items="${listView.list}" var="boards">
							<tr>
								<td>${boards.boardIdx}</td>
								<td><a
									href="${pageContext.request.contextPath}/board/view?boardIdx=${boards.boardIdx}">
										${boards.title} </a></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<div class="row justify-content-md-center mt-4">
					<div class="btn-toolbar " role="toolbar">
						<div class="btn-group mr-2" role="group">
							<c:if test="${listView.pagination.preNum>0}">
								<a href="list?p=${listView.pagination.preNum}"
									class="btn btn-primary">이전</a>
							</c:if>
							<c:forEach begin="${listView.pagination.startNum}"
								end="${listView.pagination.endNum}" var="pnum">
								<a href="list?p=${pnum}"
									class="btn ${listView.pageNum eq pnum ? 'btn-dark': 'btn-white'}">${pnum}</a>
							</c:forEach>
							<c:if test="${listView.pagination.nextNum>0}">
								<a href="list?p=${listView.pagination.nextNum}"
									class="btn btn-primary">다음</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			
	</div>
			




</body>
</html>