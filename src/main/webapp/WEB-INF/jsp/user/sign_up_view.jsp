<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram Sign Up</title>

	<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Ajax 쓰려면 전체의 jQuery가져와야 한다 -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" type="text/css" href="/css/sign_up_style.css">
</head>
<body>
	<div id="signUpBox">
		<div class="d-flex justify-content-center pt-4">
			<img src="/images/logo.png" alt="instagram logo">
		</div>
		<div class="signUpText">친구들의 사진과 동영상을 보려면</div>
		<div class="signUpText">가입하세요.</div>
		<hr>
		<%--이메일 주소 입력 --%>
		<div class="mt-4 d-flex justify-content-center">
			<input type="text" id="email" class="form-control col-10" placeholder="이메일 주소">
		</div>
		
		<%--이름 입력 --%>
		<div class="mt-3 d-flex justify-content-center">
			<input type="text" id="name" class="form-control col-10" placeholder="이름">
		</div>
		
		<%--아이디 입력, 중복확인 --%>
		<div class="mt-3 d-flex justify-content-center">
			<input type="text" id="loginId" class="form-control col-7" placeholder="아이디">
			<button id="isDuplicate" class="btn btn-primary ml-2 col-3">중복확인</button>
		</div>
		<div class="ml-5"><small id="isTooShort" class="text-danger font-weight-bold d-none">4글자 이상 입력해주세요.</small></div>
		<div class="ml-5"><small id="isCheckDuplicated" class="text-danger font-weight-bold d-none">이미 사용중인 아이디 입니다.</small></div>
		<div class="ml-5"><small id="isIdOk" class="text-primary font-weight-bold d-none">사용가능한 아이디입니다.</small></div>
		
		<%--비밀번호 확인 --%>
		<div class="mt-3 d-flex justify-content-center">
			<input type="password" id="password" class="form-control col-10" placeholder="비밀번호">
		</div>
		<div id="checkPassword" class="font-weight-bold text-success small ml-5">최소 8자 이상으로 영문, 숫자, 하나 이상의 특수문자를<br> 혼합해서 입력해주세요.</div><br>
		<div id="isOkPassword" class="font-weight-bold text-primary small ml-5 d-none">사용가능한 비밀번호 입니다.</div>
		
		<%--가입버튼 --%>
		<div class="mt-4 d-flex justify-content-center">
			<button type="button" id="signUpBtn" class="btn btn-primary b-block col-10" >가입</button>
		</div>
	</div>

<script>
$(document).ready(function(e){
	
	//ajax를 통해 아이디 중복 확인
	$("#isDuplicate").on('click', function(e){
		let loginId = $("#loginId").val().trim();
		
		$("#isTooShort").addClass('d-none');
		$("#isCheckDuplicated").addClass('d-none');
		$("#isIdOk").addClass('d-none');
		
		if (loginId.length < 4 ) {
			$("#isTooShort").removeClass('d-none');
			return;
		}
		
		$.ajax({
			type: "POST"
			, url: "/user/is_duplicated_id"
			, data: {"loginId":loginId}
			, success: function(data){
				if(data.result) {
					//중복(true)
					$("#isCheckDuplicated").removeClass('d-none');
				} else {
					$("#isIdOk").removeClass('d-none');
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
		
	});
	
	// 정규표현식을 통한 비밀번호 문구뜨기 
	$("#password").on("propertychange change keyup paste input", function(e){
		let password = $(this).val();
		let passwordRule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		let testResult = passwordRule.test(password)
		
 		if (testResult) {
			$("#isOkPassword").removeClass('d-none');
			$("#checkPassword").addClass('d-none');
			return false;
		}
		
	});
		
	// 가입버튼을 누를때 validation check
	$("#signUpBtn").on('click', function(e){
		let email = $("#email").val();
		let name = $("#name").val();
		let loginId = $("#loginId").val();
		let password = $("#password").val();
		
		
		if (email == "") {
			alert("이메일을 입력하세요.");
			return;
		}
		
		if (name == "") {
			alert("이름을 입력하세요.");
			return;
		}
		
		if (loginId == "") {
			alert("아이디를 입력하세요.");
			return;
		}
		
		if (password == "") {
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		if ($("#isIdOk").hasClass('d-none')) {
			alert("아이디 중복확인을 해주세요.");
			return;
		} 
		
		if ( $("#isOkPassword").hasClass('d-none')) {
			alert("비밀번호를 다시 입력해주세요.");
			return;
		}
			
		let url = "/user/sign_up"
		let params = {'loginId':loginId, 'email':email, 'name':name, 'password':password}
		$.post(url, params)
		.done(function(data){
			if (data.result == 'success'){
				alert('회원가입이 완료되었습니다. 로그인을 해주세요.');
				location.href="/user/sign_in_view"
			} else if (data.result == 'fail') {
				alert("회원가입이 실패했습니다. 다시 시도해주세요.");
				location.reload();
			}
		});
		
	});
	

		
	
});

</script>
</body>
</html>