package com.sns.followee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.followee.bo.FolloweeBO;
import com.sns.followee.model.FolloweeView;

@Controller
@RequestMapping("/followee")
public class FolloweeController {
	
	@Autowired
	private FolloweeBO followeeBO;
	
	@RequestMapping("/followee_list_view/{userId}")
	public String followeeListView(
			Model model,
			@PathVariable int userId) {
		
		List<FolloweeView> followeeView = followeeBO.generateFolloweeList(userId);
		
		model.addAttribute("followeeView", followeeView);
		model.addAttribute("viewName", "followee/followee_list_view");
		return "template/layout";
	}
	
	@RequestMapping("/follower_list_view/{userId}")
	public String followerListVIew(
			Model model,
			@PathVariable int userId) {
		List<FolloweeView> followerView = followeeBO.generateFollowerList(userId);
		
		model.addAttribute("followerView", followerView);
		model.addAttribute("viewName", "followee/follower_list_view");
		
		return "template/layout";
	}
	
}
