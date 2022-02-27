package com.sns.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
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
}
