package com.sns.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
	
	//로그인 로직
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request
			) {
		
		//암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		//아이디 확인
		User user = userBO.getUserByLoginIdPassword(loginId, encryptPassword);
		
		// 결과값 내리기
		Map<String, Object> result = new HashMap<>();
		
		if (user != null) {
			result.put("result", "success");
			HttpSession session = request.getSession();
			session.setAttribute("loginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userId", user.getId());
		} else {
			result.put("result", "fail");
			result.put("errorMessage", "로그인이 실패했습니다. 아이디와 비밀번호를 확인해주세요.");
		}
		
		return result;
	}
	
	
	// 프로필 수정하기
	@RequestMapping("/user_profile_modify")
	public Map<String, Object> userProfileModify(
			@RequestParam(value="introduce", required=false) String introduce,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpServletRequest request
			) {
		
		// 세션에서 userId 꺼냄
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		// TODO: id로 사용자를 찾아서 사진path와 자기소개를 넣는다(nullable)
		userBO.updateProfileIntroduceByLoginId(loginId, introduce, file);
		
		
		// map을 return한다.
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		
		return result;
	}
	
}
