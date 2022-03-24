<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>게시글 수정</title>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
	$(document).ready(function() {
		$("#summernote").summernote({
			placeholder : "게시글을 작성하세요.",
			tabsize : 2,
			height : 500,
		});
	});
</script>
<style type="text/css">
html, body {
	margin: 0;
	height: 100%;
	overflow: hidden;
}
#container {
	height: 100%;
}
#board-form {
	height: 100%;
}
</style>
</head>
<body>
	<div id="container" class="row">
		<%@ include file="/WEB-INF/views/frame/adminNav.jsp"%>
		<div class="col-md-8" style="margin-top: 50px">
			<h1>게시글 수정</h1>
			<hr />
			<form id="board-form" method="post">
				<input type="hidden" name="adminBoardIdx"
					value="${board.adminBoardIdx}">
				<div class="row">
					<div class="col-md-1" style="text-align: center; font-weight: bold">
						제목</div>
					<div class="col-md-8" style="padding: 0">
						<input type="text" name="title" required style="width: 100%"
							value="${board.title}" required />
					</div>
					<div class="col-md-2" style="padding: 0">
						<select name="adminBoardListIdx" id="adminBoardListIdx"
							class="form-select" aria-label="Default select example" required>
							<c:if test="${board.adminBoardListIdx == 1 }">
								<option value="1" selected>공지사항</option>
								<option value="2">이벤트</option>
							</c:if>
							<c:if test="${board.adminBoardListIdx == 2 }">
								<option value="1">공지사항</option>
								<option value="2" selected>이벤트</option>
							</c:if>
						</select>
					</div>
				</div>
				<textarea id="summernote" name="content" required>${board.content}</textarea>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button class="btn btn-primary me-md-2" type="submit">
						수정하기</button>
					<button class="btn btn-primary" type="reset">리셋</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>