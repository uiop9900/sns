<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center aling-items-center">		
	<div class="profile">
		<a href="/user/my_page_view"><img src="/images/default_profile_image.gif" alt="profile image"></a>
	</div>
	<div class="mt-3 font-weight-bold">
		${loginId}
	</div>
		
	<div id="headerLogo">
		<img src="/images/logo.png" alt="instagram logo" >
	</div>
</div>

