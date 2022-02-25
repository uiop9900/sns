<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="d-flex">
		
		<%--프로필 사진 --%>
		<div id="mypageProfileImage">
			<c:if test="${not empty user.profileImageUrl}">
				<img src="${user.profileImageUrl}" alt="profile-image">
			</c:if>
			${user.profileImageUrl}
			<img src="/images/default_profile_image.gif" alt="profile-image">
		</div>
	
	
		<div class="col-6">
		
			<%--아이디와 프로필편집 버튼(사진, 소개, 이름 변경/추가가능) --%>
			<div class="d-flex">
				<div class="display-4 userId w-100">${loginId}</div>
				<a href="/user/profile_modify_view" id="modifyProfileBtn" class="btn btn-primary">프로필 편집</a>
			</div>
			
			<%--게시물, 팔로워, 팔로우 --%>
			<div class="d-flex justify-content-center mt-3">
				<div class="col-4 ml-4">
					게시물 <b>15</b>
				</div>
				<div class="col-4">
					팔로워 <b>15</b>
				</div>
				<div class="col-4">
					팔로우 <b>15</b>
				</div>
			</div>
			<%--이름과 자기소개 --%>
			<div class="ml-4 mt-3">
				<div class="font-weight-bold">${userName}</div>
				<div>안녕? 나는 이지아야. 내 피드에 놀러와! </div>
			</div>
			
		</div>
	</div>
		<%--게시글 추가 버튼 --%>
		<div class="mt-4">
			<a href="/post/post_create_view" class="btn btn-primary btn-block w-75">게시글 업로드</a>
	 	</div>

<script>
$(document).ready(function(e){
	$("#modifyProfileBtn").on('click', function(e){
		
	});
});
</script>