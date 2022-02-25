package com.sns.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/sign_in_view")
	public String singInView() {
		return "/user/sign_in_view";
	}
	
	@RequestMapping("/sign_up_view")
	public String signUpView() {
		
		return "/user/sign_up_view";
	}
	
	@RequestMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginId");
		session.removeAttribute("userName");
		session.removeAttribute("userId");
		
		return "user/sign_in_view";
	}
	
	@RequestMapping("/my_page_view")
	public String myPageView(
			Model model,
			HttpServletRequest request
			) {
		
		//세션에서 정보받아서 내리기
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		//bo에서 객체 하나 받아서 model로 내리기
		User user = userBO.getUserByLoginId(loginId);
		
		model.addAttribute("user", user);
		model.addAttribute("viewName", "user/my_page_view");
		return "template/layout";
	}
	
	@RequestMapping("/profile_modify_view")
	public String profileModifyView(Model model) {
		model.addAttribute("viewName", "user/profile_modify_view");
		
		return "template/layout";
	}
}
