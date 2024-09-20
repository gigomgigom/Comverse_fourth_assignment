package com.comverse.fourthsubject.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.comverse.fourthsubject.dto.BoardCtgDto;
import com.comverse.fourthsubject.service.admin.BoardService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SettingAdminBoardCtgNameInterceptor implements HandlerInterceptor{
	
	@Autowired
	BoardService boardService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		String requestUri = request.getRequestURI();
		//PathVariable로 전달받은 파라미터값(게시판 분)를 받아온다.
		int boCtg = Integer.parseInt(requestUri.split("/")[4]);
		
		BoardCtgDto boardCtg = boardService.getBoardCtgDetail(boCtg);
		
		//Model과 ModelAndView는 서로 다른 타입이지만 결국에 세팅되는 ModelMap은 동일하게 참조되어있다.
		//물론 원하던 바대로 작동이 되어서 상관은 없어보이나 이렇게 두 개를 같이 사용하는 것이 맞는것인가 생각을 해보자
		if(modelAndView != null)
		modelAndView.addObject("boardCtg", boardCtg);
	}
}
