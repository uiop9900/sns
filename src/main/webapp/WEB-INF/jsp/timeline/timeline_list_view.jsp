<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="content" items="${contentList}">
	<div class="timline-card mt-5">
		<%--프로필 사진과 아이디 --%>
		<div class="d-flex align-items-center timeline-otherUser">
			<div class="timeline-profile">
			<a href="/user/my_page_view?userId=${content.user.id}" class="userPage">
			<c:choose>
				<c:when test="${empty content.user.profileImageUrl}">
					<img src="/images/default_profile_image.gif" alt="profileImage" >
				</c:when>
				<c:otherwise>				
					<img src="${content.user.profileImageUrl}" alt="profileImage">
				</c:otherwise>
			</c:choose>
			</a>
			</div>
			<div class="ml-3 mt-2 timeline-userId">${content.user.loginId}</div>	
		</div>
		
		<%--게시사진 --%>
		<div class="timeline-image">
			<img src="${content.post.imagePath}" alt="post-images" >
		</div>
		
		
		<%--좋아요 --%>
		<%--로그인 안하면 빈하트와 좋아요 개수 --%>
		<c:if test="${empty userId }">
			<div class="mt-2 ml-2 d-flex justify-content-start align-items-center">
				<div class="mr-3"><img src="/images/heart.png" alt="heart-logo" class="noLike heartLogo" width="40" height="40"></div>
				<div class="font-weight-bold">${content.likeCount}</div>
			</div>
		</c:if>
		<%--로그인 하면 좋아요개수, 좋아요(빈,찬 하트) --%>
		<div class="mt-2 ml-2 d-flex align-items-center">
		<c:if test="${not empty userId}">
			<div class="likeBtn mr-3" data-user-id="${userId}" data-post-id="${content.post.id}" >
				<a href="#">
					<c:choose>
						<c:when test= "${content.filledLike == false}">
							<img src="/images/heart.png" alt="heart-logo" class="noLike heartLogo" width="40" height="40">
						</c:when>
						<c:when test="${content.filledLike == true}">
							<img src="/images/black_heart.png" alt="heart-logo" class="heartLogo noLike" width="40" height="40">
						</c:when>
					</c:choose>
				</a>
			</div>
			<div class="font-weight-bold">${content.likeCount}</div>
		</c:if>
		</div>
		
		<%--아이디와 코멘트 --%>
		<div class="d-flex">
			<div class="font-weight-bold ml-2">${content.user.loginId}</div>
			<div class="ml-4">${content.post.content}</div>
		</div>
		
		<%--댓글쓰기 --%>
			<div>
			<c:forEach var="commentView" items="${content.commentList}">
					<span class="ml-2 font-weight-bold">${commentView.user.loginId} :</span>
					<span class="ml-3">${commentView.comment.content}</span><br>
				</c:forEach>  
			</div>
		<c:if test="${not empty userId}"> <%--로그인된 사람만 쓸수있다. --%>
			<div class="d-flex justify-content-between">
				<input type="text" id ="commentText${content.post.id}" class="form-control border-0 mr-2 col-7 ml-2" placeholder="댓글">
				<button type="button" class="commentBtn btn btn-primary mr-2" data-post-id="${content.post.id}">게시</button>
			</div>
		</c:if>
		
	</div>
</c:forEach>

<script>
$(document).ready(function(e){
	//댓글 게시버튼 클릭
	$('.commentBtn').on('click', function(e){
		let postId = $(this).data('post-id'); //data-post-id : 무조건 -으로 연결
		
		//commentText2 이런식으로
		let commentContent = $("#commentText" + postId).val().trim(); //게시글에 대한 댓글을 작성한다.
		//let commentContent = $(this).siblings('input').val(); 이렇게 형제태그에서 찾을수도 있음
		
		$.ajax({
			type: "GET"
			,url: "/comment/create"
			,data: {'postId':postId, 'commentContent':commentContent}
			, success: function(data) {
				if (data.result == 'success'){
					alert("성공적으로 게시되었습니다.");
					location.reload();
				} else if (data.result == 'fail') {
					alert("실패했습니다, 다시 작성해주세요.");
					$("#commentText" + postId).val("");
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
	});
	
	// like를 좋아요가 된다.
	$(".likeBtn").on('click',function(e){
		e.preventDefault();
		
		// 버튼을 누르면 세션값을 가지고 온다.
		let userId = $(this).data('user-id');
		let postId = $(this).data('post-id');
		
		if (userId == "") {
			alert("로그인하세요");
			location.href="/user/sign_in_view"
			return false 
		}
		
		$.ajax({
			type: "get"
			, url: "/like/" + postId
			, data: {"userId":userId, "postId":postId}
			, success: function(data) {
				if (data.result == 'insert'){
					alert("'좋아요' 완료");
					location.reload();
				} else if(data.result == 'delete') {
					alert("좋아요 '취소' 완료");
					location.reload();
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
		
	});

	 
});

</script>


