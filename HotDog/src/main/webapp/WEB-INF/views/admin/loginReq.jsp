<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${not empty adminLogger}">
	<script>
		location.href = "${pageContext.request.contextPath}/admin/board";
	</script>
</c:if>
<html>
<head>
<title>관리자 로그인</title>
<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
<style type="text/css">
#login-form {
	margin: 0 auto;
	height: 100%;
	position: relative;
}

.form-signin {
	position: absolute;
	top: 40%;
	width: 100%;
	border: 1px solid rgb(0, 0, 0, 0.5);
	border-radius: 15px;
	padding: 10px 10px;
	box-shadow: 5px 5px 5px 5px rgb(0, 0, 0, 0.4);
	background-color: white;
}

.login-background-photo {
	position: absolute;
	width: 100%;
	left: 0;
	top: 0;
	max-height: 1009px;
}
</style>
</head>
<body>
	<img class="login-background-photo" alt=""
		src="${pageContext.request.contextPath}/images/login_background.jpg">
	<div id="login-form" class="text-center" style="width: 500px;">
		<main class="form-signin">
			<form method="post">
				<h1 class="h3 mb-3 fw-normal">관리자 로그인</h1>

				<div class="form-floating">
					<input type="text" name="id" class="form-control"
						id="floatingInput" required> <label for="floatingInput">아이디</label>
				</div>
				<div class="form-floating">
					<input type="password" name="password" class="form-control"
						id="floatingPassword" required> <label
						for="floatingPassword">비밀번호</label>
				</div>
				<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			</form>
		</main>
	</div>
</body>
</html>
