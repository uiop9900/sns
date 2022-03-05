package com.sns.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.AbstractDocument.Content;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostBO postBO;
	
	/**
	 * create post
	 * @param userId
	 * @param content
	 * @param file
	 * @param request
	 * @return
	 */
	@PostMapping("/create")
	public Map<String, Object> postCreate(
			@RequestParam("userId") int userId,
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpServletRequest request
			) {
		
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		// TODO: loginId, userId, content, file 넘겨서 post에 저장한다. 이때 file은 nullable
		
		int count = postBO.addPost(userId, content, file, loginId);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		if (count != 1) {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	
	
	@PutMapping("/update")
	public Map<String, Object> postUpdate(
			@RequestParam("content") String Content,
			@RequestParam("postId") int postId,
			@RequestParam("loginId") String loginId,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpServletRequest request
			){
		
		//db update
		postBO.generateUpdatePostByPostId(postId, loginId, Content, file);
		
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		result.put("postId", postId);
		result.put("userId", userId);
		
		return result;
	}
	
	
	//글의 삭제이니까 post로 넘어간다.
	/**
	 * delete post
	 * @param postId
	 * @param request
	 * @return
	 */
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId,
			HttpServletRequest request
			) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		//권한검사를 각 메소드에서 할것임, 그렇기에 여기서는 null을 허용해준다.
		Integer userId = (Integer)session.getAttribute("userId");
	
		if (userId == null) { //사용자가 최대한 정제된 에러를 보게 한다.
			result.put("result", "error");
			result.put("errorMessage", "로그인을 다시 해주세요.");
			logger.error("[delete post] 로그인세션이 없습니다. userId:{}, postId:{}" + userId, postId);
			return result;
		}
	
		//delete
		postBO.generateDeletePostByPostIdUserId(postId);
		result.put("result", "success");
		
		return result;
	}
	

}
