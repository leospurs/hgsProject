<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h2>장소 등록하기</h2>
	<form role="form" method="post" enctype="multipart/form-data">
		
		<div>
			<label for="memberIdx">계정번호</label>
			<div>
				<input type="text" name="memberIdx" id="memberIdx" required>
			</div>
		</div>
		
		<div>
			<label for="title">제목</label>
			<div>
				<input type="text" name="title" id="title" required>
			</div>
		</div>
		
		
		<div>
			<label for="content">내용</label>
			<div>
				<input type="text" name="content" id="content" required>
			</div>
		</div>
		
		
		
		
		<button type="submit">등록하기</button> 
		<button type="reset">초기화</button>
		
		
	
	</form>
</body>
</html>