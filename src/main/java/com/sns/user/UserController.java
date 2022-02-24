package com.sns.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

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
	
	@RequestMapping("my_page_view")
	public String myPageView(Model model) {
		model.addAttribute("viewName", "user/my_page_view");
		return "template/layout";
	}
}
