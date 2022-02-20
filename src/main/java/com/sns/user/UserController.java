package com.sns.user;

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
}
