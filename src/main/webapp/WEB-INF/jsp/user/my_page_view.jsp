<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="d-flex">
		
		<%--프로필 사진 --%>
		<div id="mypageProfileImage">
			<img src="${user.profileImageUrl}" alt="profile-image">
			<c:if test="${empty user.profileImageUrl}">
				<img src="/images/default_profile_image.gif" alt="profile-image">
			</c:if>
		</div>
	
	
		<div class="col-6">
		
			<%--아이디와 프로필편집 버튼(사진, 소개, 이름 변경/추가가능) --%>
			<div class="d-flex">
				<div class="display-4 userId w-100">${user.loginId}</div>
				<c:if test="${userId eq user.id}">
					<a href="/user/profile_modify_view" id="modifyProfileBtn" class="btn btn-primary">프로필 편집</a>
				</c:if>
			</div>
			
			<%--게시물, 팔로워, 팔로우 --%>
			<div class="d-flex justify-content-center mt-3">
				<div class="col-4 ml-4">
					게시물 <b>${postList.size()}</b>
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
				<div class="font-weight-bold">${user.name}</div>
				<div>${user.introduce}</div>
			</div>
			
		</div>
	</div>
		
	<%--게시글 추가 버튼 --%>
	<div class="mt-4 d-flex justify-content-between">
		<c:if test="${userId eq user.id}">
			<div class="w-100">
				<a href="/post/post_create_view" class="btn btn-primary btn-block col-8">게시글 업로드</a>
			</div>
		</c:if>
		<c:if test="${user.loginId != loginId and not empty userId}">
			<div class="w-100 d-flex justify-content-end">
				<div class="ml-3"><button id="followBtn" class="btn btn-primary mr-4 col-12 font-weight-bold">follow</button></div>
			</div>
		</c:if>
	 </div>
	 
	 <%--user가 쓴 게시글 --%>
	 <div id="myPageContent" class="mt-5">
	 	<div class="d-flex flex-wrap align-content-center ">
		 	<c:forEach var="post" items="${postList}">
		 		<div class="userPost mt-1 mr-1" data-user-id="${user.id}">
		 			<a href="/timeline/timeline_detailed_view?userId=${user.id}&postId=${post.id}">
		 				<img src="${post.imagePath}" alt="post-content-picture" class="myPageContent">
		 			</a>
		 		</div>
		 	</c:forEach>
	 	</div>
	 </div>
	 
<script>
$(document).ready(function(e){
	//로그인 안하고 개인페이지-게시물 클릭하면 로그인 페이지로 보낸다.
	$(".userPost").on('click', function(e){
		
		let userId = $(this).data('user-id');
		
		if (userId == "") {
			alert("로그인 후에 이용가능합니다.");
			location.href="/user/sign_in_view";
		}
	});
	
});

</script>