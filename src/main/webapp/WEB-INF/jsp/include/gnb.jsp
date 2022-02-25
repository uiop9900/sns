<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex aling-items-center">		
	<div id="headerLogo">
		<a href="/timeline/timeline_list_view"><img src="/images/logo.png" alt="instagram logo" ></a>
	</div>
	
	<div class="heartLogo">
		<img src="/images/heart.png" alt="heartLogo" >
	</div>
	
	<div class="profile">
		<a href="/user/my_page_view"><img src="/images/default_profile_image.gif" alt="profile image"></a>
	</div>
	
	
	<div class="mt-2 ml-1 mr-2 font-weight-bold">
		${loginId}
	</div>
		
</div>
<hr>

