package com.sns.timeline;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/timeline")
public class TimelineController {
	
//	@Autowired
//	private CommentBO // 이런식으로 autowired해서 가지고 온다. -> card를 위한 객체를 따로 만든다.
	
	@RequestMapping("/timeline_list_view")
	public String timelineListView(Model model) {
		
		//하나의 카드 => ContentView객체 (view용 객체)
		//List<ContentView> contentList = new arrayList<>(); //->카드는 글의 수만큼 하니까 list이며, 글을 하나씩 꺼내려면 BO에서 가공한다 Controller는 input과 output만!
		
		
		model.addAttribute("viewName", "/timeline/timeline_list_view");
		
		return "template/layout"; 
	}
	
}
