package com.comverse.fourthsubject.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.comverse.fourthsubject.interceptor.AdminRequestInterceptor;

@Configuration
@EnableAspectJAutoProxy
public class WebConfig implements WebMvcConfigurer {
	
	@Autowired
	AdminRequestInterceptor ari;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(ari)
				.addPathPatterns("/admin/**");
	}
}
