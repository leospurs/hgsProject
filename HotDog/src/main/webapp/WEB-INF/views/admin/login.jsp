<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result == 0}">
	<script>
		alert("아이디 또는 비밀번호를 확인하세요.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result > 0 }">
	<script>
		location.href="${pageContext.request.contextPath}/admin/board";
	</script>
</c:if>