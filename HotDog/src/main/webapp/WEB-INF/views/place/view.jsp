<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<!-- 해더 시작 -->

	<!-- 해더 끝 -->

	<!-- 네비게이션 시작 -->

	<!-- 네비게이션 끝 -->

	<!-- content 시작 -->

	<table class="table">
		<tr>
			<td>${pageView.fileName}</td>
		</tr>
		<tr>
			<td>장소명</td>
			<td>${pageView.title}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${pageView.oldAddress}</td>
		</tr>
		<tr>
			<td>신주소</td>
			<td>${pageView.newAddress}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${pageView.phone}</td>
		</tr>
		<tr>
			<td>지역</td>
			<td>${pageView.affiliation}</td>
		</tr>
		<tr>
			<td>홈페이지</td>
			<td><a href="${pageView.homepage}" target="_blank">${pageView.homepage}</td>
			
		</tr>
		
	</table>
	
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b831cb9231e82dc116c15d613033258a&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${pageView.oldAddress}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${pageView.title}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

	<h3>후기</h3>
	
	 
	
	<a href="list">목록으로</a>


</body>
</html>