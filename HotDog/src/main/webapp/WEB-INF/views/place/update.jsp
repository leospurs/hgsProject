<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

$(document).ready(function(){
	
	var formObj = $('form');
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'delete') {
			fromObj.attr("method","post");
			formObj.attr("action", "/place/delete");
			
		}else if(operaion === 'list') {
			formObj.attr("action", "/place/list");
			return;
		}
		formObj.submit();
	});
});

</script>
</head>
<body>

<form role="form" method="post">

<div>
<label>IDX</label>
<input class="form-control" name='placeIdx' value='<c:out value="${pageView.placeIdx}"/>' readonly="readonly">
</div>

<div>
<label>장소명</label>
<input class="form-control" name='title' value='<c:out value="${pageView.title}"/>'>
</div>

<div>
<label>구주소</label>
<input class="form-control" name='oldAddress' value='<c:out value="${pageView.oldAddress}"/>'>
</div>

<div>
<label>신주소</label>
<input class="form-control" name='newAddress' value='<c:out value="${pageView.newAddress}"/>'>
</div>

<div>
<label>전화번호</label>
<input class="form-control" name='phone' value='<c:out value="${pageView.phone}"/>'>
</div>

<div>
<label>지역</label>
<input class="form-control" name='affiliation' value='<c:out value="${pageView.affiliation}"/>'>
</div>


<button type="submit" data-oper='update'>수정</button>
<button type="submit" data-oper='delete'>삭제</button>
<button type="submit" data-oper='list'>목록보기</button>

</form>
</body>
</html>