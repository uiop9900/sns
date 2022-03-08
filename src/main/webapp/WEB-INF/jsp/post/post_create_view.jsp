<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="post-box">
	<div class="mt-4">
	   	<input type="file" id="file" class="d-none" accept=".jpg,.gif,.jepg,.png"> 
	   	<a href="#" id="fileUploadBtn" ><img src="/static/images/postPicture.png" alt="add picture" width="100"></a> 
	   	<span class="font-weight-bold">게시글 사진 추가</span>
	</div>
    <div id="fileName" class="mt-4 ml-5">
    </div>

    <textarea id="content" class="form-control mt-5" rows="10" placeholder="내용을 입력하세요."></textarea>
    
    <div class="d-flex justify-content-center">
    	<button id="postBtn" class="btn btn-primary w-100 mt-4">업로드 하기</button>
    </div>
</div>

<script>
$(document).ready(function(e){
	
	//파일업로드 이미지 클릭
	$("#fileUploadBtn").on('click', function(e) {
		e.preventDefault();
		$("#file").click(); // input file을 클릭한 것과 같은 효과
	});
	
	//사용자가 파일 업로드를 했을때, 유효성 확인 및 업로드 된 파일 이름 노출
	$("#file").on('change', function(e){
		let fileName = e.target.files[0].name; //이벤트가 일어났을때 모든 정보가 들어간다. target
		
		
		let extension  = fileName.split('.');
		//확장자 유효성 확인
		if (extension.length < 2 ||  
				(extension[extension.length - 1] != 'gif'
					&& 	extension[extension.length - 1] != 'jpeg'	
					&& 	extension[extension.length - 1] != 'jpg'	
					&& 	extension[extension.length - 1] != 'png')	
				)
				{
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$(this).val(""); //값을 비운다.
				$("#fileName").text(""); // 파일이름도 지워준다.
				return;
		}
		
		$("#fileName").text(fileName);
	
	});
	
	$("#postBtn").on('click', function(e){
		let content = $("#content").val()
		
		let formData = new FormData();
		formData.append('userId', ${userId});
		formData.append('content', content);
		formData.append('file', $("#file")[0].files[0]);
		
		$.ajax({
			type: "post"
			, url: "/post/create"
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false
			, success: function(data){
				if (data.result == 'success') {
					alert("성공적으로 게시되었습니다.");
					location.href="/timeline/timeline_list_view"
				} else if (data.result == 'fail') {
					alert("실패했습니다. 다시 업로드 해주세요.");
					location.reload();
				}
			}
			, error: function(e) {
				alert(error);
			}	
		});
		
	});
	
	
});
</script>