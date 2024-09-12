package com.comverse.fourthsubject.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AdminRequestInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String userId = request.getUserPrincipal().getName();
		String requestUri = request.getRequestURI();

		log.info(userId + ", " + requestUri);
		if(true) {
			//throw new AccessDeniedException("Access is denied");
		}
		
		return true;
	}
}
