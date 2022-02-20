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
			<input type="text" class="form-control col-10" placeholder="이메일 주소">
		</div>
		
		<%--이름 입력 --%>
		<div class="mt-2 d-flex justify-content-center">
			<input type="text" class="form-control col-10" placeholder="이름">
		</div>
		
		<%--아이디 입력, 중복확인 --%>
		<div class="mt-2 d-flex justify-content-center">
			<input type="text" class="form-control col-7" placeholder="아이디">
			<button class="btn btn-primary ml-2 col-3">중복확인</button>
		</div>
		<div><small id="isDuplicate" class="text-danger font-weight-bold"></small></div>
		
		<%--비밀번호 확인 --%>
		<div class="mt-2 d-flex justify-content-center">
			<input type="password" class="form-control col-10" placeholder="비밀번호">
		</div>
		<small class="font-weight-bold text-danger ml-5">사용불가능한 비밀번호 입니다.</small><br>
		<small class="font-weight-bold text-primary ml-5 d-none">사용가능한 비밀번호 입니다.</small>
		
		<%--가입버튼 --%>
		<div class="mt-5 d-flex justify-content-center">
			<button type="button" id="signUpBtn" class="btn btn-primary b-block col-10" >가입</button>
		</div>
	</div>

</body>
</html>