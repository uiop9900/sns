<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="timline-card mt-3">
	<%--프로필 사진과 아이디 --%>
	<div class="d-flex align-items-center timeline-otherUser">
		<div class="timeline-profile">
			<img src="/images/default_profile_image.gif" alt="profileImage">
		</div>
		<div class="ml-3 mt-2 timeline-userId">dkjshckusdh12</div>	
	</div>
	
	<%--게시사진 --%>
	<div class="timeline-image">
		<img src="/images/profileImage.jpg" alt="post-images" >
	</div>
	
	<%--게시글 내용과 댓글 --%>
	<div>
		<img src="/images/heart.png" alt="heart-logo" class="heartLogo">
	</div>
</div>