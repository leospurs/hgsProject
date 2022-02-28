<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script>

$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'delete') {
			formObj.attr("action", "/hgs/board/delete");
			
		}else if(operation == 'list') {
			self.location = "/hgs/board/list";
			return;
		}
		formObj.submit();
	});
});

</script>
</head>
<body>

<h4>일반 게시물 수정 페이지</h4>
<form role="form" action="/board/update" method="post">

<div>
<label>IDX</label>
<input class="form-control" name='boardIdx' value="<c:out value="${boards.boardIdx}"/>" readonly="readonly">
</div>

<div>
<label>제목</label>
<input class="form-control" name='title' value='<c:out value="${pageView.title}"/>'>
</div>

<div>
<label>내용</label>
<input class="form-control" name='content' value='<c:out value="${pageView.content}"/>'>
</div>




<button type="submit" data-oper='update'>수정</button>
<button type="submit" data-oper='delete'>삭제</button>
<button type="submit" data-oper='list'>목록보기</button>

</form>
</body>
</html>