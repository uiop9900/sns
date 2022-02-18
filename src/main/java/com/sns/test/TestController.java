package com.sns.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@ResponseBody
	@RequestMapping("/test")
	public String test() {
		return "성공";
	}
	
	@RequestMapping("/test/test")
	public String testTest() {
		return "test/test";
	}
}
