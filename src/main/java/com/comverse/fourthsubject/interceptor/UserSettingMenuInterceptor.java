package com.comverse.fourthsubject.interceptor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.comverse.fourthsubject.dto.BoardCtgDto;
import com.comverse.fourthsubject.service.BoardService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class UserSettingMenuInterceptor implements HandlerInterceptor{
	
	@Autowired
	BoardService boardService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		List<BoardCtgDto> boardList = boardService.getBoardCtgList();
		for(int i=0; i<boardList.size(); i++) {
			
			BoardCtgDto ctg = boardList.get(i);
			if(!ctg.isCtgInUse() || ctg.getCtgMenu() < 1) {
				boardList.remove(ctg);
				i--;
			}
		}
		
		
		List<Map<String, Object>> result = new ArrayList<>();
		
		for(int i=1; i<=4; i++) {
			Map<String, Object> map = new HashMap<>();
			
			List<BoardCtgDto> boardCtg = new ArrayList<>();
			
			for(BoardCtgDto ctg : boardList) {
				if(ctg.getCtgMenu() == i) {
					boardCtg.add(ctg);
				}
			}
			
			map.put("index", i);
			map.put("ctgList", boardCtg);
			
			result.add(map);
		}
		
		//Model과 ModelAndView는 서로 다른 타입이지만 결국에 세팅되는 ModelMap은 동일하게 참조되어있다.
		//물론 원하던 바대로 작동이 되어서 상관은 없어보이나 이렇게 두 개를 같이 사용하는 것이 맞는것인가 생각을 해보자
		if(modelAndView != null)
		modelAndView.addObject("boardInfo", result);
	}
}
