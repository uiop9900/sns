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
					<img src="/static/images/default_profile_image.gif" alt="profileImage" >
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
				<div class="mr-3"><img src="/static/images/heart.png" alt="heart-logo" class="noLike heartLogo" width="40" height="40"></div>
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
							<img src="/static/images/heart.png" alt="heart-logo" class="noLike heartLogo" width="40" height="40">
						</c:when>
						<c:when test="${content.filledLike == true}">
							<img src="/static/images/black_heart.png" alt="heart-logo" class="heartLogo noLike" width="40" height="40">
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
		
		<%--댓글목록 --%>
		<div class="comment-list-view" id="comments${commentView.post.id}">
			<c:forEach var="commentView" items="${content.commentList}">
				<span class="ml-2 font-weight-bold">${commentView.user.loginId} :</span>
				<span class="ml-3">${commentView.comment.content}</span>
				<%--댓글 지우기 --%>
				<c:if test="${commentView.user.id eq userId}">
					<a href="#" class="commentDelete font-weight-bold text-danger text-decoration-none" data-comment-id="${commentView.comment.id}">delete</a>
				</c:if>
				<br>
			</c:forEach>  
		</div>
		<small><a href="#" data-post-id="${commentView.post.id}" class="open-btn text-decoration-none text-secondary font-weight-bold">--------------read more--------------</a></small>
		<%--댓글쓰기 --%>
		<c:if test="${not empty userId}"> <%--로그인된 사람만 쓸수있다. --%>
			<div class="comment-box d-flex justify-content-between align-items-center">
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

	$(".open-btn").on('click', function(e){
		e.preventDefault();

		let postId = $(this).data('post-id');
		
		if ($("#comments" + postId).hasClass('comment-list-view') == true) { //속성이 있다.
			$("#comments" + postId).removeClass('comment-list-view');
			$(this).text("--------------hide--------------");
		} else if ($("#comments" + postId).hasClass('comment-list-view') == false) { //속성이 없다.
			$("#comments" + postId).addClass('comment-list-view');
			$(this).text("--------------read more--------------");
		}
		
	});
	
	$(".commentDelete").on('click', function(e){
		let commentId = $(this).data('comment-id');
		
		$.ajax({
			type: "DELETE"
			, url: "/comment/delete"
			, data: {"commentId":commentId}
			, success: function(data) {
				if (data.result == 'success') {
					alert("댓글이 삭제되었습니다.");
					location.reload();
				} else if (data.result == 'error') {
					alert("댓글삭제가 실패했습니다.");
				}
			}
			, error: function(e){
				alert("error");
			}
		})
	});
	
});

</script>


