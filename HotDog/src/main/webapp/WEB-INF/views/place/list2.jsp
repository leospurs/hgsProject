<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


<meta charset="UTF-8">
<title>추천장소 리스트</title>
<style>
a.btn btn-primary {
	float:right;
}
</style>
</head>
<body>

	<!-- 해더 시작 -->

	<!-- 해더 끝 -->

	<!-- 네비게이션 시작 -->

	<!-- 네비게이션 끝 -->

	<!-- content 시작 -->
	<div id="content">
		
		<h3>추천 장소</h3>
		<h5>추천장소 > 공원</h5>
		
		
		<!-- 후기 등록 버튼(관리자 전용) -->
		<a class="btn btn-primary" href="register" role="button">등록</a>
		
		<div class="wrap">
			<div class="tab_menu">
				<ul class="list">
					<li class="is_on" id="park"><a href="#tab1" class="btn">공원</a>
						<div class="place-container">
							<div>제목</div>
							<div>주소</div>
							<div>제목</div>
							<div>카테고리</div>
							
							<div>페이지 넘버</div>
						</div>
					</li>
					<li id="cafe"><a href="#tab2" class="btn">카페</a></li>
					<li id="dogHs"><a href="#tab3" class="btn">동물병원</a></li>
				</ul>
			</div>
		</div>
	</div>


	<script>
		const tabList = document.querySelectorAll('.tab_menu .list li');
		for (var i = 0; i < tabList.length; i++) {
			tabList[i].querySelector('.btn').addEventListener('click',
					function(e) {
						e.preventDefault();
						for (var j = 0; j < tabList.length; j++) {
							tabList[j].classList.remove('is_on');
						}
						this.parentNode.classList.add('is_on');
					});
		}
		
	</script>


	<div id="tab-2" class="tab-content current"></div>
	
	
	<script>
	//const test = ${listView}.list[0].subjectCategory;
	console.log(${listView}.list);
	
	
	console.log(${listView}.list.length)
	// form 생성 메소드
	const placeList = ${listView}.list;
	
	for (var i = 0; i < placeList.length; i++) {
		console.log("들어왔나요?>"+placeList[i].subjectCategory)
		if(placeList[i].subjectCategory === '애견카페'){
			console.log(placeList[i])
			var test = insertPlaceForm(placeList[i]);
			var cafe = document.querySelector("#cafe");
			
			cafe.append(test);
		}
		if(placeList[i].subjectCategory === '공원'){
			$("#cafe").append(insertPlaceForm(placeList[i]));
		}
		if(placeList[i].subjectCategory === '동물병원'){
			$("#dogHs").append(insertPlaceForm(placeList[i]));
		}
	}
	function insertPlaceForm(placeList){
		
		var html ="";
		html += "place-container'>";
		html += "<div>"+placeList.title+"</div>";
		html += "<div>"+placeList.newAddress+"</div>";
		html += "<div>"+placeList.subjectCategory+"</div></div>";
		
// 		html += <div>페이지 넘버</div>
		return html;
	}
	
	
	</script>
</body>
</html>