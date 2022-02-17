<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천장소 리스트</title>
</head>
<body>

	<!-- 해더 시작 -->

	<!-- 해더 끝 -->

	<!-- 네비게이션 시작 -->

	<!-- 네비게이션 끝 -->

	<!-- content 시작 -->
	<div id="content">
		<h3>추천장소 목록</h3>

		<div>전체 추천장소 수 : ${listView.totalCount}</div>

		<!-- 탭 메뉴 -->
		<section id="category_tab_wrap" class="rounded">
			<h4 class="tab-btn-1">
				<a href="#" class="on">전체</a>
			</h4>
			<div class="tab-container-1">
				<table>
					<c:if test="${not empty listView.list}">
						<tr>
							<th>idx</th>
							<th>이름</th>
							<th>주소</th>
							<th>카테고리</th>
							<th>이미지파일</th>
						</tr>
						<c:forEach items="${listView.list}" var="places">
							<tr>
								<td>${places.placeIdx}</td>
								<td><a
									href="${pageContext.request.contextPath}/place/view?idx=${places.placeIdx}">
										${places.title} </a></td>
								<td>${places.oldAddress}</td>
								<td>${places.subjectCategory}</td>
								<td>${places.fileName}</td>
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
			
	
	<script>
		$(function() {
			$(".main-visual-slide").bxSlider({
				auto : true,
				pause : 2000,
				autoHover : true,
				autoControls : true,
				autoControlsCombine : true
			});

			$("#category-tab-wrap h4 a").on("click", tabmenu);
			function tabmenu(e) {
				e.preventDefault();
				var $ts = $(this);
				var $next = $ts.parent().next();
				if ($next.is(":hidden")) {
					$("#category-tab-wrap h4 a").removeClass("on");
					$ts.addClass("on");
					$("#category-tab-wrap > div:visible").hide();
					$next.show();
				}
			}

			$('.grid').isotope({
				// options
				itemSelector : '.grid-item',
				layoutMode : 'fitRows'
			});
		});
	</script>








</body>
</html>