package com.sns.like;

import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikeRestController {

	// /like/{postId} - 와일드 카드
	@RequestMapping("/like/{postId}") 
	public Map<String, Object> like(
			@PathVariable int postId) {// 와일드 카드 사용가능
		
		
		return null;
	}
	

}
