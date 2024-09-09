package com.comverse.fourthsubject.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.expression.method.DefaultMethodSecurityExpressionHandler;
import org.springframework.security.access.expression.method.MethodSecurityExpressionHandler;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class WebSecurityConfig {
	
	@Autowired
	private LoginSuccessHandler loginSuccessHandler;
	@Autowired
	private LoginFailureHandler loginFailureHandler;
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.formLogin(formLogin -> formLogin
				.loginPage("/icecream/login")
				.usernameParameter("admId")
				.passwordParameter("admPw")
				.loginProcessingUrl("/login")
				.successHandler(loginSuccessHandler)
				.failureHandler(loginFailureHandler)
		);
		http.logout(logout -> logout
				.logoutUrl("/logout")
				.logoutSuccessUrl("/icecream/login")
		);
		http.authorizeHttpRequests((requests) ->
			requests.requestMatchers("/admin/**").authenticated()
					.anyRequest().permitAll()
		);
		return http.build();
	}
	//유저 권한 설정
	@Bean
	public RoleHierarchy roleHierarchy() {
		String role = "ROLE_ADMIN > ROLE_USER";
		RoleHierarchyImpl hierarchy = RoleHierarchyImpl.fromHierarchy(role);
		return hierarchy;
	}
	//권한 설정 어노테이션 사용을 위한 설정
	@Bean
	public MethodSecurityExpressionHandler createExpressionHandler() {
		DefaultMethodSecurityExpressionHandler handler = new DefaultMethodSecurityExpressionHandler();
        handler.setRoleHierarchy(roleHierarchy());
        return handler;
	}
	
	@Bean
	public HttpFirewall defaultHttpFirewall() {
		return new DefaultHttpFirewall();
	}
}
