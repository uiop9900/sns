package com.sns.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
		
	//http:/localhost/user
	@RequestMapping("/user")
	public List<User> userTest() {
		
		List<User> userList = userBO.getUserList();
		
		return userList;
	}
	
	//아이디 중복확인
	@PostMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId
			){
		
		//중복 체크
		boolean existUserId = userBO.existUserId(loginId);
		
		Map<String, Object> result = new HashMap<>();
		return result;
	}
	
}
