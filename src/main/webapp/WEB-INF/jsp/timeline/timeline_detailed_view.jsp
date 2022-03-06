<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="timline-card mt-5">
		<%--프로필 사진과 아이디 --%>
		<div class="d-flex align-items-center timeline-otherUser">
			<div class="timeline-profile">
				<a href="/user/my_page_view?userId=${userContent.user.id}" class="userPage">
					<c:choose>
						<c:when test="${empty userContent.user.profileImageUrl}">
							<img src="/images/default_profile_image.gif" alt="profileImage" >
						</c:when>
						<c:otherwise>				
							<img src="${userContent.user.profileImageUrl}" alt="profileImage">
						</c:otherwise>
					</c:choose>
				</a>
			</div>
			<div class="ml-3 mt-2 timeline-userId">
				${userContent.user.loginId}
			</div>	
			<!-- 글쓴 사용자와 로그인 사용자가 일치할때만 삭제 가능- modal -->
			<c:if test="${userId eq userContent.user.id}">
				<div class="w-75 d-flex justify-content-end align-items-center">
					<div class="mt-1">
						<a href="#" class="more-btn" data-toggle="modal" data-target="#moreModal" data-post-id="${userContent.post.id}" data-user-id="${userContent.user.id}" >
							<img src="/images/moreInfo.png" alt="more-info" width="30">
						</a>
					</div>
				</div>
			</c:if>
		</div>
		
		<%--게시사진 --%>
		<div class="timeline-image">
			<img src="${userContent.post.imagePath}" alt="post-images" >
		</div>
		
		
		<%--좋아요 --%>
		<%--로그인 안하면 빈하트와 좋아요 개수 --%>
		<c:if test="${empty userId}">
			<div class="mt-2 ml-2 d-flex justify-content-start align-items-center">
				<div class="mr-3"><img src="/images/heart.png" alt="heart-logo" class="noLike heartLogo" width="40" height="40"></div>
				<div class="font-weight-bold">${userContent.likeCount}</div>
			</div>
		</c:if>
		
		<%--로그인 하면 좋아요개수, 좋아요(빈,찬 하트) --%>
		<c:if test="${not empty userId}">
		<div class="mt-2 ml-2 d-flex align-items-center">
			<div class="likeBtn mr-3" data-user-id="${userId}" data-post-id="${userContent.post.id}" >
				<c:choose>
					<c:when test= "${userContent.filledLike == false}">
						<a href="#">
							<img src="/images/heart.png" alt="heart-logo" class="heartLogo noLike" width="40" height="40">
						</a>
					</c:when>
					<c:when test="${userContent.filledLike == true}">
						<a href="#">
							<img src="/images/black_heart.png" alt="heart-logo" class="heartLogo noLike" width="40" height="40">
						</a>
					</c:when>
				</c:choose>
			</div>
			<div class="font-weight-bold">
				${userContent.likeCount}
			</div>
		</div>
		</c:if>
		
		<%--아이디와 코멘트 --%>
		<div class="d-flex">
			<div class="font-weight-bold ml-2">${userContent.user.loginId}</div>
			<div class="ml-4">${userContent.post.content}</div>
		</div>
		
		<%--댓글보기, 쓰기 --%>
		<div>
			<c:forEach var="commentView" items="${userContent.commentList}">
				<span class="ml-2 font-weight-bold">${commentView.user.loginId} :</span>
				<span class="ml-3">${commentView.comment.content}</span><br>
			</c:forEach>  
		</div>
		<c:if test="${not empty userId}">
			<div class="d-flex justify-content-between">
				<input type="text" id ="commentText${content.post.id}" class="form-control border-0 mr-2 col-7 ml-2" placeholder="댓글">
				<button type="button" class="commentBtn btn btn-primary mr-2" data-post-id="${content.post.id}">게시</button>
			</div>
		</c:if>
	</div>

		


<%--Modal --%>
<div class="modal fade" id="moreModal">
  	<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    	<div class="modal-content">
     		<%--modal 창 안에 내용 넣기 --%>
     		<div>
     			<div class="my-3 text-center">
					<a href="#" class="modify-post d-block text-dark d-none">수정하기</a>
				</div>
				<div class="my-3 text-center">
					<a href="#" class="del-post d-block text-danger">삭제하기</a>
				</div>
				<div class="border-top py-3 mr-2 d-flex justify-content-end">
				 	<a href="#" class="cancel d-block btn btn-light col-3" data-dismiss="modal">취소</a>
				</div>
     		</div> 
    	</div>
  	</div>
</div>


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
	
	// like를 누르면 toggle된다.
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

	
	// 카드에서 더보기(...)클릭시 modal에 삭제될 글 번호(postId)를 넣어준다. : modal은 한개라 
	$(".more-btn").on('click', function(e){
		e.preventDefault();
		let postId = $(this).data('post-id');
		let userId = $(this).data('user-id');
		
		//set
		$("#moreModal").data('user-id', userId); 
		$("#moreModal").data('post-id', postId); // modal 태그안에 data-post-id='postId' 를 넣은것과 같다.
	});
	
	//modal안의 수정하기 버튼 클릭
	$("#moreModal .modify-post").on('click', function(e){
		e.preventDefault();
		
		let postId = $("#moreModal").data('post-id');
		location.href="/post/post_update_view?postId=" + postId;
	
	});
	
	
	//modal안의 삭제하기 버튼 클릭
	$("#moreModal .del-post").on('click', function(e) {
		e.preventDefault();
		
		let postId = $("#moreModal").data('post-id');
		let userId = $("#moreModal").data('user-id');
		//ajax로 삭제하기 -> 글의 삭제니까 delete로 간다.
		$.ajax({
			type:"DELETE"
			, url: "/post/delete"
			, data: {'postId':postId}
			, success: function(data) {
				if (data.result == 'success') {
					alert("삭제되었습니다.");
					location.href="/user/my_page_view?userId=" + userId;
				} else if (data.result == 'error') {
					alert(data.errorMessage);
					location.href="/user/my_page_view?userId=" + userId;
				}
			}
			, error: function(e){
				alert("error");
			}
		});
	});

});

</script>

