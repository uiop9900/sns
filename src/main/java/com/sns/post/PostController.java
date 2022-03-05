package com.sns.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.post.dao.PostDAO;
import com.sns.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostDAO postDAO;
	
	@RequestMapping("/post_create_view")
	public String postCreateView(Model model) {
		model.addAttribute("viewName", "post/post_create_view");
		return "template/layout";
	}
	
	@RequestMapping("/post_update_view")
	public String postUpdateView(
			@RequestParam("postId") int postId,
			Model model) {
		
		Post post = postDAO.selectPostById(postId);
		
		model.addAttribute("post", post);
		model.addAttribute("viewName", "post/post_update_view");
		
		return "template/layout";
	}
}
