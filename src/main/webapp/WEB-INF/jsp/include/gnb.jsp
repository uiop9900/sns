<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-flex align-items-center">		
	<div id="headerLogo">
		<a href="/timeline/timeline_list_view"><img src="/images/logo.png" alt="instagram logo" ></a>
	</div>
	
	<%--로그인 안하면 --%>
	<c:if test="${empty loginId}">
		<div class="w-100">
			<a href="/user/sign_up_view" class="font-weight-bold text-primary decoration-none float-right">회원가입</a>
		</div>
	</c:if>
	
	<%--로그인 하면 --%>
	<c:if test="${not empty loginId }">
	
	<div class="heartLogo">
		<img src="/images/heart.png" alt="heartLogo" >
	</div>
	
	<div class="profile">
		<c:choose>
			<c:when test="${not empty profileImageUrl}">
				<a href="/user/my_page_view"><img src="${profileImageUrl}" alt="profile-image"></a>
			</c:when>
			<c:otherwise>
				<a href="/user/my_page_view"><img src="/images/default_profile_image.gif" alt="profile-image"></a>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="mt-2 mr-2 font-weight-bold">
		<a href="/user/my_page_view" class="text-decoration-none text-dark">${loginId}</a>
	</div>
	</c:if>
		
</div>
<hr>

