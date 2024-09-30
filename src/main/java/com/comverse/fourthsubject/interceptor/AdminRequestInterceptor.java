package com.comverse.fourthsubject.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.comverse.fourthsubject.service.AuthService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AdminRequestInterceptor implements HandlerInterceptor {
	
	@Autowired
	AuthService authService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String url = request.getAttribute(HandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE).toString();
		
		//404에러 발생시키기
		if(url.equals("/**")) {
			throw new NoHandlerFoundException(url, url, null);
		}
		
		
		String userId = request.getUserPrincipal().getName();
		String requestUri = request.getRequestURI();

		boolean isAllowed = authService.checkRequestUriAllowedToAdmin(userId, requestUri);
		if(!isAllowed) {
			throw new AccessDeniedException("Access is denied");
		}
		
		return true;
	}
}
