<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="d-flex">
		
		<%--프로필 사진 --%>
		<div id="mypageProfileImage">
			<c:choose>
				<c:when test="${not empty profileImageUrl}">
					<img src="${user.profileImageUrl}" alt="profile-image">
				</c:when>
				<c:otherwise>
					<img src="/images/default_profile_image.gif" alt="profile-image">
				</c:otherwise>
			</c:choose>
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
				<div class="font-weight-bold">${userName}</div>
				<div>${user.introduce}</div>
			</div>
			
		</div>
	</div>
		
	<%--게시글 추가 버튼 --%>
	<div class="mt-4 d-flex justify-content-between">
		<a href="/post/post_create_view" class="btn btn-primary btn-block w-75">게시글 업로드</a>
		<c:if test="${user.loginId != loginId}">
		<button id="followBtn" class="btn btn-secondary mr-4 font-weight-bold">follow</button>
		</c:if>
	 </div>
	 
	 <%--user가 쓴 게시글 --%>
	 <div id="myPageContent" class="mt-5">
	 	<div class="d-flex flex-wrap align-content-center ">
	 	<c:forEach var="post" items="${postList}">
	 		<div class="mt-1 mr-1">
	 			<a href="/timeline/timeline_detailed_view?userId=${userId}&postId=${post.id}">
	 				<img src="${post.imagePath}" alt="post-content-picture" class="myPageContent">
	 			</a>
	 		</div>
	 	</c:forEach>

	 	</div>
	 </div>
	 
	 <!-- 글쓴 사용자와 로그인 사용자가 일치할때만 삭제 가능 -->
	 <c:if test="${userName eq user.name}">
	 	<a href="#" class="more-btn" data-toggle="modal" data-target="#moreModal" data-post-id="${post.id}" >
	 		삭제
	 	</a>
	 </c:if>


<%--Modal --%>
<div class="modal fade" id="moreModal">
  	<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    	<div class="modal-content">
     		<%--modal 창 안에 내용 넣기 --%>
     		<div>
				<div class="my-3 text-center">
					<a href="#" class="del-post d-block">삭제하기</a>
				</div>
				<div class="border-top py-3 text-center">
				 	<a href="#" class="cancel d-block " data-dismiss="modal">취소</a>
				</div>
     		</div> 
    	</div>
  	</div>
</div>




<script>
$(document).ready(function(e){
	
	// 카드에서 더보기(...)클릭시 modal에 삭제될 글 번호(postId)를 넣어준다. : modal은 한개라 
	$(".more-btn").on('click', function(e){
		e.preventDefault();
		let postId = #(this).data('post-id');
		
		
		//set
		$("#moreModal").data('post-id', postId); // modal 태그안에 data-post-id='postId' 를 넣은것과 같다.
	});
	
	
	//modal안의 삭제하기 버튼 클릭
	$("#moreModal .del-post").on('click', function(e) {
		e.preventDefalut();
		
		let postId = $("#moreModal").data('post-id');
		alert(postId);
		
		
	});
});
</script>