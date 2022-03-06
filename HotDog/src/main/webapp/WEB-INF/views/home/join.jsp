<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>핫핫!! 핫한 개들의 수다</title>
	<%@ include file="/WEB-INF/views/frame/pageSet.jsp" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
		integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
		crossorigin="anonymous">
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>

<style>

/* #msg { */
/* 	display: none; */
/* } */

body {
	height: 2000px;
	background-color: #ffe395;
	padding-top: 50px;
	/* 	padding-left: 100px; */
	background-image:
		url('${pageContext.request.contextPath}/uploadfile/civa.jpg');
	backdrop-filter: blur(4px);
	/* 	backdrop-filter: brightness(50%); */
	/* 	backdrop-filter: contrast(60%); */
}

#header {
	font-size: 45px;
	font-weight: bolder;
	
	text-align: center;
	
	color: black;
}

.my-3 {
	width : 450px;
	height : 1000px;
	
	margin-left : 300px;
	
	border : 1px solid white;
	
	border-radius : 15px;
	
/* 	box-shadow: 10px 10px 50px 20px grey; */
}

/* .col-sm-8 { */
/* 	padding-left : 20px; */
	
/* 	padding-bottom : 3px; */
/* } */

</style>
</head>

<body>

	<!-- 
	
		1. 이메일 타입에 따른 input창 보여주기  / ok
		2. 주소 api 사용 / ok
		3. 품종 ajax활용 / ok
		4. 해쉬태그 폼  / ok 별거없었네
		5. 패스워드 정규식
		6. 이메일 정규식
		7. submit 제출
		
	 -->

	<div id="header">회원가입하고 인싸가 되어보세요!</div>

	<main role="main" class="container">
	
		<div class="my-3 p-3 bg-white shadow-sm">
		
			<form method="post" enctype="multipart/form-data" action="/hgs/join">
				<div class="form-group row">
					<label for="email" class="col-sm-3 col-form-label">이메일</label>
					<div class="col-sm-8">
						<c:if test="${not empty emailType.snsType}">
							<input class="form-control" type="email" id="snsId" name="snsId" autocomplete="username" value="${emailType.email}" placeholder="이메일을 입력해주세요 . *">
							<input type="hidden" id="snsType" name="snsType" value="${emailType.snsType}" >
						</c:if>

						<c:if test="${empty emailType}">
							<input type="email" id="email" name="email"	autocomplete="username" placeholder="이메일을 입력해주세요 ." class="form-control">
						</c:if>
					</div>
				</div>

				<!-- 패스워드 입력  정규식 활용 -->
				<div class="form-group row">
					<label for="pw" class="col-sm-3 col-form-label">비밀번호 </label> 
					<div class="col-sm-8">
						<input type="password" id="password1" name="password1" autocomplete="new-password" placeholder="패스워드를 입력해주세요 " class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<label for="repw" class="col-sm-3 col-form-label">비밀번호</label> 
					<div class="col-sm-8">
						<input type="password" id="password2" name="password2"	autocomplete="new-password" placeholder="비밀번호 확인" class="form-control">
					</div>
				</div>

				<div id="password_answer"></div> <!-- 이건 뭐임? -->

				<div class="form-group row">
					<div class="col-sm-12">
						<input type="text" id="dogName" name="name"	placeholder="반려견 이름을 입력해주세요 " class="form-control">
					</div>
				</div>	
				
				<div class="form-group row">
					<div class="col-sm-12" >
						<input type="text" id="petNumber" name="petNumber"	placeholder="등록번호가 있으시면 입력해주세요!" class="form-control">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="profile" class="col-sm-4 col-form-label">프로필 사진</label>
					<input type="file" name="profile" id="profile">
				</div>
				
				<div class="form-group row">
					<div class="col-sm-12">
						<div id="address" >
							<input type="button" onclick="daumPostcode()" value="우편번호 찾기" class="btn btn-light"> <br>
							<input type="text" id="postcode" placeholder="우편번호" class="form-control"> 
							<input type="text" id="roadAddress" placeholder="도로명주소" class="form-control"> 
							<input type="text" id="jibunAddress" placeholder="지번주소" class="form-control"> 
							<span id="guide" style="color: #999; display: none"> </span> 
							<input type="text" id="detailAddress" placeholder="상세주소 " class="form-control">
						</div>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="birthday" class="col-sm-3 col-form-label"> 생년월일 </label>
					<div class="col-sm-8">
						<input type="date" id="birthday" name="birthday" class="form-control">
					</div>
				</div>
			
				<div class="form-group row">
					<label for="sex" class="col-sm-2 col-form-label"> 성별</label>
					<div class="col-sm-10">
						<input type="radio" name="sex" value="0" checked> 여성
						<input type="radio" name="sex" value="1"> 남성
					</div>
				</div>
				
				<div class="form-group row">
					<label for="neutering" class="col-sm-4 col-form-label"> 중성화 여부</label>
					<div class="col-sm-8">
						<input type="radio" id="neutering" name="neutering" value="0" checked> 아니오
						<input type="radio" id="neutering" name="neutering" value="1" > 예
					</div>
				</div>
				
				<div class="form-group row"> 
					<label for="breed" class="col-sm-2 col-form-label"> 품종 </label>
					<div class="col-sm-10"> 
						<div id="breedContainer">
							<input type="text" id="breed" name="breedIdx" list="breedList"	placeholder="품종을 입력해주세요." class="form-control">
							<div id="breed_checking"> </div>
						</div>
					</div>
				</div>
				
				<datalist id="breedList">
					<c:forEach items="${breedList}" var="breed">
						<option data-value="${breed.breedIdx}" value="${breed.dogType}"></option>
					</c:forEach>
				</datalist>

				<ul id="breedList">
				</ul>

				<h5> 관심사를 선택해주세요!!! (중복선택 가능) </h5>
				
				<div id="hashtags">
					<input type="checkbox" name="hashtags" value="28">대형견
					<input type="checkbox" name="hashtags" value="29">중형견 
					<input type="checkbox" name="hashtags" value="30">소형견 
					<input type="checkbox" name="hashtags" value="8">산책 
					<input type="checkbox" name="hashtags" value="3">강아지 
					<input type="checkbox" name="hashtags" value="17">장난감  <br>
					<input type="checkbox" name="hashtags" value="9">사료 
					<input type="checkbox" name="hashtags" value="1">동물병원 
					<input type="checkbox" name="hashtags" value="5">애견카페 
					<input type="checkbox" name="hashtags" value="2">공원	 <br>				
				</div>
				
				<br>
				
				<div class="btn btn-success" id="joinBtn">회원가입 </div>
				<input type="reset" class="btn btn-primary">
				<a href="/hgs" class="btn btn-secondary">로그인창으로 돌아가기</a>
			
			</form>
		</div>
	</main>
</body>

<script>
	$(document).ready(function(){
		console.log('${emailType.snsType}', '${emailType}')
		
// 		// SNS형식 가입이면 이메일을 수정 못하도록 readonly 속성 추가	
// 		if($('#snsId').val().length > 0){
// 			$('#snsId').attr("readonly","readonly");
// 			$('#snsId').attr("style","color:gray");
// 		}
		
	})
	
	
</script>

<script>


	// submit ajax
	joinBtn.onclick = function(){
		const formData = new FormData();
		if(typeof $('#email').val() != "undefined" || $('#email').val()  != null ){
			formData.append('email', $('#email').val());
			console.log($('#email').val())
		} else {
			formData.append('snsId', $('#snsId').val());
			formData.append('snsType', $('#snsType').val());
			console.log($('#snsId').val())
			console.log($('#snsType').val())
		}
		// 비밀번호  	password1
		formData.append('password',$('#password1').val())
		
		// 반려견 이름  dogName
		formData.append('name',$('#dogName').val())
		
		// 펫		petNumber
		formData.append('petNumber',$('#petNumber').val())
		
		// 프로파일 	profile
		formData.append('profile',$('#profile')[0].files[0])
		
		// 주소  		roadAddress + _ + detailAddress
		formData.append('address',$('#roadAddress').val()+"_"+$("#detailAddress").val())
		
		// 생일 		birthday
		formData.append('birthday',$('#birthday').val())
		
		// 성별		sex  0이 여자 1이 남자
		formData.append('sex',$("input:radio[name=sex]:checked").val())
		
		// 중성화 여부	neutering
		formData.append('neutering',$('#neutering')[0].checked ? 1 : 0)
		
		// 품종		id값 1개필요
		// 품종 무조껀 한개 값은 받아와야함
		const breedIdx = $("#breedList option[value="+$('#breed').val()+"]")[0].dataset.value;
		formData.append('breedIdx',breedIdx);
		
		// 관심사 
		var tagIdxList = [];
		$("input:checkbox[name=hashtags]:checked").each(function(index,tag){
			tagIdxList.push(tag.value)
		})
		formData.append('hashtagIdx',tagIdxList)
		console.log("formData = " + formData)
		$.ajax({
			url : 'join',
			type : 'POST',
			data : formData,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			cash : false,
		}).done(function(){
			console.log("ok")
			location.href = "/hgs";
		}).fail(function(){
			console.log("no")
		})
	
	}

</script>

<script>
	// 패스워드 확인 
	const passwordAnswer = $("#password_answer");
	
	$("#password2").focusout(function(){
		const password1 = $("#password1").val();
		const password2 = $("#password2").val();
		const yes = "비밀번호가 일치합니다.";
		const no = "비밀번호가 일치하지 않습니다.";
		
		// 패스워드 1,2가 같은지 확인 후 같으면 다음으로 넘어가기
		passwordAnswer.text(password1 === password2 ? yes : no);

	})
	
</script>

<script>	
	/* 
		품종 선택 Ajax
		- input창에 입력한 즉시 관련 결과들을 출력.
		- 결과 값들 중에 유저가 선택 한 값이 있다면, 선택한 값을 input창에 채워 넣기
		- 유저가 입력한 값이 DB에 같은 데이터가 있는지 확인 후, 확인 결과를 알리기 

	
	breed.onkeyup = function(){
		$.ajax({
			url : "join/breed",
			data : {"word" : breed.value},
			contentType: "text/html; charset=utf-8",
			type : "get",
			
		}).done(function(data){					// 초기화 후 결과 값을 생성
			breedList.empty();   		//   리스트 초기화
			$.each(data, insertToBreedList);	//   b.결과 값 생성	
		}).fail(function(request, error){		// 실패 시, 오류 메시지 출력
			console.log("code : %s	 message : %s	error : %s",request.status, request.responseText,error);
		})
	}
	유저가 검색한 결과를 도출하는 Ajax
	$("#breed").keyup(function(){
		$.ajax({
			url : "join/breed",
			data : {"word" : breed.innerText},
			type : "get",
			
		}).done(function(data){					// 초기화 후 결과 값을 생성
			$("#breed_list").empty();   		//   리스트 초기화
			$.each(data, insertToBreedList);	//   b.결과 값 생성	
			
		}).fail(function(request, error){		// 실패 시, 오류 메시지 출력
			console.log("code : %s	 message : %s	error : %s",request.status, request.responseText,error);
		})
	});
	
	// b.결과 값 생성 : 받은 데이터를 li에 셋팅 후 list에 삽입.
	const insertToBreedList = function(index,value){
		$("#breed_list").append("<option>"+value+"</option>");
	}
	
	// 유저가 품종을 선택 시, 품종 데이터를 input 속으로 삽입.
	$("#breed_list").on("click","li",function(event){
		$("#breed").val(event.target.innerText);
	});
	
	input을 벗어날 때, 정확한 입력하지 않았으면, 정확한 값 입력하라고 표시해주기.
	$("#breed-container").hover(function(){}, function(){
		$.ajax({
			url  : "join/breed",
			data : {"dogType" : breed.val()},
			type : "post",
			
		}).done(function(data){
			const pass = "훌륭한 강아지를 키우시고 계시군요?";
			const again = "그런 강아지가 없어요! 다시 확인 해 주시겠어요?";
			$("#breed_checking").text(data > 0 ? pass : again);
			
		}).fail(function(request,error){
			console.log("code : %s	 message : %s	error : %s",request.status, request.responseText,error);
		});
	});
*/
	
</script>
<script>

	// 다음 주소 API //
	
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</html>
