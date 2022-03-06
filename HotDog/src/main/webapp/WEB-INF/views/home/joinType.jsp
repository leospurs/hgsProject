<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>핫핫!! 핫한 개들의 수다</title>
	<%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>

<!-- <script -->
<!-- 	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>

<style>
* {
	text-align: center;
}

h1 {
	color : orange;
}

a {
	text-align: center;
}

a:link {
	color: red;
	text-decoration: none;
	
	font-size : 20px;
	font-style : italic;
	font-weight : bold;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}

body {
	background-color: #ffe395;
	padding-top: 110px;
	padding-left: 100px;
	background-image:
		url('${pageContext.request.contextPath}/uploadfile/civa.jpg');
}

#div01 {
	font-size : 23px;
}

</style>
</head>
<body>

	<h1 >Create an account</h1>
	<h1>Sign up with social</h1>
	<br>
	<br>
	<div>
		<a href="join">이메일로 회원가입 하기</a> <br> <br> <a
			href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=43759419ecbf05fbee7b1064e2ea3094&redirect_uri=http://localhost:8080/hgs/oauth/kakao">카카오
			아이디로 회원가입</a> <br> <br> <a
			href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=5aNOGrdJbdtyJSOIZFn3&state=STATE_STRING&redirect_uri=http://localhost:8080/hgs/oauth/naver">네이버
			계정으로 회원가입</a> <br> <br>
	</div>

	<!-- 이거 구글 -->
	<!-- <a href="https://accounts.google.com/o/oauth2/v2/auth?client_id=820302346751-8vua4mbcio64i4v5btqprjkchm41ufhm.apps.googleusercontent.com&redirect_uri=http://localhost:8080/hgs/oauth/google&response_type=code&scope=https%3A//www.googleapis.com/auth/drive.file">구글 계정으로 회원가입</a> -->
	<div id="div01">
		Already have an account?<a href="#"> <br> Sign in</a>
	</div>

</body>
	
</html>
