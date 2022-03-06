package com.sns.followee;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.followee.bo.FolloweeBO;

@RestController
@RequestMapping("/followee")
public class FolloweeRestController {
	
	@Autowired
	private FolloweeBO followeeBO;

	@RequestMapping("/followee")
	public Map<String, Object> followeeGenerate(
			@RequestParam("userId") int userId,
			@RequestParam("followerId") int followerId
			) {
		
		//id와 followerId를 BO에 넘겨서 가공한다.
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "error");
		result.put("errorMessage", "팔로우를 실패했습니다. 다시 실행해주세요.");
		
		String successMessage = followeeBO.generateFollowee(userId, followerId);
		
		result.put("result", "success");
		result.put("successMessage", successMessage);
		
		return result;
	}
}
