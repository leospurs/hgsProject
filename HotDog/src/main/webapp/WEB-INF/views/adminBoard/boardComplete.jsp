<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result > 0 }">
	<script>
		alert("게시믈 등록 성공");
		location.href="${pageContext.request.contextPath}/admin/board/list";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script>
		alert("게시믈 등록 실패");
		history.go(-1);
	</script>
</c:if>