<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mt-5">
    <div class="d-flex">
	    <button id="profileImageModify" class="btn btn-secondary">프로필 사진 변경하기</button>
	    <input type="file" id="file" class="d-none" accept=".jpg,.gif,.jpeg,.png">
	    <div id="fileName" class="ml-2 mt-1"></div>
	</div>
	
    <textarea id="introduce" class="form-control mt-4" rows="5" placeholder="100 이내의 자기소개를 적어주세요."></textarea>
    
    <div class="d-flex justify-content-center">
    	<button id="modifyBtn" class="btn btn-primary w-100 mt-4">프로필 수정사항 업로드</button>
    </div>
</div>

<script>
$(document).ready(function(e){
	$("#profileImageModify").on('click', function(e){
		$("#file").click();
	});
	
	$("#file").on('change', function(e){
		let fileName = $(this).val()//파일명 가지고 온다
		
		let extension = fileName.split('.').pop().toLowerCase();
		
		if ($.inArray(extension, ['jpg','gif','jpeg','png']) == -1) {
			alert("gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.");
			$("#file").val("");
			return;
		}
		
		$("#fileName").text(fileName);
	});
	
	$("#modifyBtn").on('click', function(e){
		let introduce = $("#introduce").val();
		
		//introduce validation 
		if (introduce.length >= 100) {
			alert("100자 이내의 자기소개만 가능합니다.")
			return;
		}

		//formData로 ajax
		let formData = new FormData();
		formData.append('userId', ${userId});
		formData.append('introduce', introduce);
		formData.append('file', $("#file")[0].files[0]);
		
		$.ajax({
			type: 'post'
			, url: '/user/user_profile_modify'
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false
			, success: function(data) {
				if (data.result == 'success') {
					alert("프로필이 성공적으로 수정되었습니다.")
					location.href="/user/my_page_view";
				} else {
					alert(data.result.errorMessage);
				}
			}
			, error: function(e) {
				alert("요청되지 않았습니다. 다시 실행해주세요.")
				location.reload();
			}
		})
		
		
	});
	
	
});

</script>