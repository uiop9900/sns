package com.sns.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/imagePath/**") // http://localhost:8080/images/uiop9900_4257864557/sun.png
		.addResourceLocations("file:///C:\\JiaLEE\\6_spring-project\\sns\\imagePath/"); // 실제 파일 저장 위치
	}
}
