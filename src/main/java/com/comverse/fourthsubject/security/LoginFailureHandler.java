package com.comverse.fourthsubject.security;

import java.io.IOException;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Component("loginFailureHandler")
@Slf4j
public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest rq, HttpServletResponse rs, AuthenticationException e) throws IOException, ServletException {
		log.info("로그인 안됌");
		//로그인 실패 메시지 모델을 통해 로그인창에 출력해줘야함
		super.onAuthenticationFailure(rq, rs, e);
	}
}
