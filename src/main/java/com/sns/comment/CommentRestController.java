package com.sns.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.comment.bo.CommentBO;

@RestController
@RequestMapping("/comment")

//댓글을 쓰면 DB에 저장합니다. 
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	
	@RequestMapping("/create")
	public Map<String, Object> commentCreate(
			@RequestParam("postId") int postId,
			@RequestParam("commentContent") String content,
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userId");
		
		// bo에서 넘기면 저장한다. -> userId를 통해 loginId 가져와서 저장한다.
		int count = commentBO.addComment(userId, content, postId);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		if (count != 1) {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
