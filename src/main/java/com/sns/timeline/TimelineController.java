package com.sns.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/timeline")
public class TimelineController {
	
	@RequestMapping("/timeline_list_view")
	public String timelineListView(Model model) {
		
		model.addAttribute("viewName", "/timeline/timeline_list_view");
		
		return "template/layout"; 
	}
	
}
