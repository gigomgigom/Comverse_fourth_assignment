package com.comverse.fourthsubject.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.comverse.fourthsubject.interceptor.AdminRequestInterceptor;
import com.comverse.fourthsubject.interceptor.SettingAdminBoardCtgNameInterceptor;
import com.comverse.fourthsubject.interceptor.UserSettingMenuInterceptor;

@Configuration
@EnableAspectJAutoProxy
public class WebConfig implements WebMvcConfigurer {
	
	@Autowired
	AdminRequestInterceptor ari;
	@Autowired
	SettingAdminBoardCtgNameInterceptor bcni;
	@Autowired
	UserSettingMenuInterceptor usmi;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(ari)
				.addPathPatterns("/admin/**");
		registry.addInterceptor(bcni)
				.addPathPatterns("/admin/board/manage/**");
		registry.addInterceptor(usmi)
				.excludePathPatterns("/admin/**")
				.excludePathPatterns("/resources/**");
	}
}
