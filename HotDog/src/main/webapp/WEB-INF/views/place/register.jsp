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
	<form role="form" method="post">
		
		<div>
			<label for="adminIdx">관리자계정번호</label>
			<div>
				<input type="text" name="adminIdx" id="adminIdx" required>
			</div>
		</div>
		
		<div>
			<label for="title">장소 이름</label>
			<div>
				<input type="text" name="title" id="title" required>
			</div>
		</div>
		
		<div>
			<label for="subjectCategory">카테고리</label>
			<div>
				<select id="subjectCategory" name="subjectCategory">
					<option value="공원">공원</option>
					<option value="애견카페">애견카페</option>
					<option value="동물병원">동물병원</option>
				</select>
			</div>
		</div>
		
		<div>
			<label for="affiliation">지역</label>
			<div>
				<select id="affiliation" name="affiliation">
					<option value="서울">서울</option>
					<option value="부산">부산</option>
					<option value="인천">인천</option>
					<option value="대구">대구</option>
					<option value="광주">광주</option>
					<option value="대전">대전</option>
					<option value="울산">울산</option>
					<option value="부산">부산</option>
					<option value="세종">세종</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청북도">충청북도</option>
					<option value="충청남도">충청남도</option>
					<option value="전라북도">전라북도</option>
					<option value="전라남도">전라남도</option>
					<option value="경상북도">경상북도</option>
					<option value="경상남도">경상남도</option>
					<option value="제주">제주</option>
				</select>
			</div>
		</div>
		
		<div>
			<label for="oldAddress">구주소</label>
			<div>
				<input type="text" name="oldAddress" id="oldAddress" required>
			</div>
		</div>
		
		<div>
			<label for="newAddress">신주소</label>
			<div>
				<input type="text" name="newAddress" id="newAddress" required>
			</div>
		</div>
		
		<div>
			<label for="homepage">홈페이지</label>
			<div>
				<input type="text" name="homepage" id="homepage" required>
			</div>
		</div>
		
		<div>
			<label for="phone">전화번호</label>
			<div>
				<input type="text" name="phone" id="phone" required>
			</div>
		</div>
		
		<button type="submit">등록하기</button> 
		<button type="reset">초기화</button>
		
		
	
	</form>
</body>
</html>