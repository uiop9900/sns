package com.sns.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.common.EncryptUtils;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@RestController
@RequestMapping("/user")
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
		result.put("result", existUserId);
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId, 
			@RequestParam("name") String name, 
			@RequestParam("password") String password, 
			@RequestParam("email") String email 
			) {
		
		//비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		Map<String, Object> result = new HashMap<>();
		
		int count = userBO.addUser(loginId, encryptPassword, name, email);
		
		if (count > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
