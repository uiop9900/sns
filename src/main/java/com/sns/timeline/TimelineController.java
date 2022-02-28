package com.sns.timeline;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.timeline.bo.ContentBO;
import com.sns.timeline.model.ContentView;


@Controller
@RequestMapping("/timeline")
public class TimelineController {
	
	@Autowired
	private ContentBO contentBO;
	
	@RequestMapping("/timeline_list_view")
	public String timelineListView(
			Model model,
			HttpServletRequest request) {
		
		// 로그인했으면 아이디 가지고 온다. 
		HttpSession session = request.getSession();
		// 로그인하지않아도 timeline 볼수있기에 null값일수도 있다.
		Integer userId = (Integer)session.getAttribute("userId");
		
		//List<Post> postList = postBO.getPostList();
		//model.addAttribute("postList", postList);
		
		//하나의 카드 => ContentView객체 (view용 객체)
		List<ContentView> contentList = contentBO.generateContentViewList(userId); //->카드는 글의 수만큼 하니까 list이며, 글을 하나씩 꺼내려면 BO에서 가공한다 Controller는 input과 output만!
		
		model.addAttribute("contentList", contentList);
		model.addAttribute("viewName", "/timeline/timeline_list_view");
		
		return "template/layout"; 
	}
	
}
