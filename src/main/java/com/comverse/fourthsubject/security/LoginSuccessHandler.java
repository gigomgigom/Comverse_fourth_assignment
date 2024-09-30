package com.comverse.fourthsubject.security;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.comverse.fourthsubject.service.AuthService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Component("loginSuccessHandler")
@Slf4j
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{

	@Autowired
	private AuthService authService;
	
	
	public void onAuthenticationSuccess(HttpServletRequest rq, HttpServletResponse rs, Authentication auth) throws ServletException, IOException {
		
		authService.updateLoginDate(auth.getName());
		
		log.info("로그인 성공 : " + auth.getName());
		setDefaultTargetUrl("/admin/main");
		super.onAuthenticationSuccess(rq, rs, auth);
	}
}
