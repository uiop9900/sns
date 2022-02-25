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
	
	<%--댓글쓰기 --%>
	<c:if test="${not empty userId}"> <%--로그인된 사람만 쓸수있다. --%>
		<div>
			<input type="text" id="commentText${post.id}" class="form-control border-0 mr-2" placeholder="댓글">
			<button type="button" class="commentBtn btn btn-light" data-post-id="${post.id}">게시</button>
		</div>
	</c:if>
	
</div>

<script>
$(document).ready(function(e){
	//댓글 게시버튼 클릭
	$('.commentBtn').on('click', function(e){
		let postId = $(this).data('post-id'); //data-post-id : 무조건 -으로 연결
		alert(postId);
		
		//commentText2 이런식으로
		let commentContent = $("#commentText" + postId).val().trim(); //게시글에 대한 댓글을 작성한다.
		alert("commentCotent");
	});
	
	
});

</script>


