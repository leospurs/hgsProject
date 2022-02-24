<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
  margin-top: 100px;
  font-family: 'Trebuchet MS', serif;
  line-height: 1.6
}

.container{
  width: 500px;
  margin: 0 auto;
}

ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 15px;
  cursor: pointer;
}

ul.tabs li.current{
  background: #ededed;
  color: #222;
}

.tab-content{
  display: none;
  background: #ededed;
  padding: 15px;
}

.tab-content.current{
  display: inherit;
}
</style>
<script>
	$(document).ready(function(){
	  
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');

	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');

	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })

	})
</script>
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
		<a href="register">추천장소 등록하기</a>
		<a href="scrapList">스크랩한 목록보기</a>
		<div>전체 추천장소 수 : ${listView.totalCount}</div>

		<!-- 탭 메뉴 -->
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">전체보기</li>
			<li class="tab-link" data-tab="tab-2">공원</li>
			<li class="tab-link" data-tab="tab-3">애견카페</li>
			<li class="tab-link" data-tab="tab-4">동물병원</li>
		</ul>
		
		<div id="tab-1"class="tab-content current">
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
									href="${pageContext.request.contextPath}/place/view?placeIdx=${places.placeIdx}">
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
			
	
			







</body>
</html>