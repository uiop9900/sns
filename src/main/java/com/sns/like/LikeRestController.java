package com.sns.like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.like.bo.LikeBO;

@RestController
public class LikeRestController {

	@Autowired
	private LikeBO likeBO;
	
	// /like/{postId} - 와일드 카드
	@RequestMapping("/like/{postId}") 
	public Map<String, Object> like(
			@PathVariable int postId,
			@RequestParam("userId") int userId
			) {// 와일드 카드 사용가능
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");

		// bo를 통해 담는다.
		
		String process = likeBO.generateLikeByUserIdPostId(userId, postId);
		
		result.put("result", process);
		
		//bo를 통해 총합을 꺼내온다. -> contenview에서 할일
		
		return result;
	}
	

}
