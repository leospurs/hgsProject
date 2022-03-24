<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result > 0 }">
	<c:if test="${type == 1}">
		<script>
			alert("게시믈 등록 성공");
			location.href = "${pageContext.request.contextPath}/admin/board/announcement";
		</script>
	</c:if>
	<c:if test="${type == 2}">
		<script>
			alert("게시믈 등록 성공");
			location.href = "${pageContext.request.contextPath}/admin/board/event";
		</script>
	</c:if>
</c:if>
<c:if test="${result == 0 }">
	<script>
		alert("게시믈 등록 실패");
		history.go(-1);
	</script>
</c:if>