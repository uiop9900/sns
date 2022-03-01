<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram Log in</title>

	<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Ajax 쓰려면 전체의 jQuery가져와야 한다 -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" type="text/css" href="/css/sign_in_style.css">
</head>
<body>
	<div id="signInBox" class="d-flex">
		<section id="signInImages">
			<img src="/images/sign_in.jpg" id="image" alt="image">
		</section>
		<form id="logInForm" method="post" action="/user/sign_in">
			<section id="signIn">
				<div class="d-flex justify-content-center pt-4">
					<img src="/images/logo.png" alt="instagram logo">
				</div>
				<div class="mt-4 d-flex justify-content-center">
					<input type="text" id="loginId" name="loginId" class="form-control col-10" placeholder="아이디">
				</div>
				<div class="mt-2 d-flex justify-content-center">
					<input type="password" id="password" name="password" class="form-control col-10" placeholder="비밀번호">
				</div>
				<div class="mt-4 d-flex justify-content-center">
					<a href="#" id="signInBtn" class="btn btn-primary b-block col-10">로그인</a>
				</div>
				
				<br><hr><br>
				
				<div id="signInText1">계정이 없으신가요?</div>
				<div class="text-center mt-2">
					<a href="/user/sign_up_view" class="signInText2">가입하기</a>
				</div>
				
				<hr>
				
				<div class="text-center mt-2">
					<a href="/timeline/timeline_list_view" class="signInText2">구경할래요!</a>
				</div>
			
			</section>
		</form>
	</div>

<script>
$(document).ready(function(e){
	//아이디, 비밀번호에서 엔터키 치면 submit
	$("#password, #loginId").keydown(function(e){
		
		//엔터를 치면 유효성검사 후 submit된다.
		if(e.keyCode == 13) {
			//validation
			let loginId = $("#loginId").val().trim();
			let password = $("#password").val();
			
			if(loginId == "") {
				alert("아이디를 입력하세요.");
				return;
			}
			
			if (password == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
		
			//submit될때 ajax 호출한다.
			let url = $("#logInForm").attr('action')
			let params = {"loginId":loginId, "password":password};
			
			$.post(url, params)
			.done(function(data){
				if (data.result == 'success') {
					location.href= "/timeline/timeline_list_view"
				} else if((data.result == 'fail')) {
					alert(data.errorMessage);
				}
			});
		}
		
	});
});

</script>
</body>
</html>