package com.sns.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws IOException {
		
		//로그인이 되어있는 상태에서 sign_in, sign_up으로 들어가면 my page로 돌린다.
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		String uri = request.getRequestURI();
		if (userId != null && uri.startsWith("/user/sign")) {
			
			response.sendRedirect("/user/my_page_view?userId=" + userId);
			return false;
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object Handler, ModelAndView modelAndView) {
		String uri = request.getRequestURI();
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object Hanlder, Exception ex) {
		String uri = request.getRequestURI();
		
	}
	
}
