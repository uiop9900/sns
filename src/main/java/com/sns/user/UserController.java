package com.sns.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.followee.bo.FolloweeBO;
import com.sns.followee.model.Followee;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private FolloweeBO followeeBO;
	
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
	
	
	
	@RequestMapping("/profile_modify_view")
	public String profileModifyView(Model model) {
		model.addAttribute("viewName", "user/profile_modify_view");
		
		return "template/layout";
	}
	
	//logindId로 
	@RequestMapping("/my_page_view")
	public String myPageView(
			@RequestParam("userId") int userId,
			Model model
			) {
		
		//
		User user = userBO.getUserById(userId);
		
		List<Post> postList = postBO.getPostListByUserId(userId);
		List<Followee> followeeList = followeeBO.getFolloweeListByUserId(userId);
		List<Followee> followerList = followeeBO.getFollowerListByUserId(userId);
		
		model.addAttribute("user", user);
		model.addAttribute("postList", postList);
		model.addAttribute("followerList", followerList);
		model.addAttribute("followeeList", followeeList);
		model.addAttribute("viewName", "user/my_page_view");
		
		return "template/layout";
	}
	
}
