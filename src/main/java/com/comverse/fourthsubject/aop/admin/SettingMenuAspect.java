package com.comverse.fourthsubject.aop.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dto.AdminMenuDto;
import com.comverse.fourthsubject.dto.BoardCtgDto;
import com.comverse.fourthsubject.dto.nondb.SideBarModel;
import com.comverse.fourthsubject.service.admin.AuthService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Aspect
@Slf4j
@Component
@Order(1)
public class SettingMenuAspect {
	
	@Autowired
	AuthService authService;
	
	@Before("execution(public String com.comverse.fourthsubject.controller.AdminController.*(..))")
	public void addMenuDataToModel(JoinPoint joinPoint) throws Throwable {
		//적용 대상 메소드의 매개변수의 배열
		Object[] args = joinPoint.getArgs();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		Model model;
		HttpServletRequest request;
		
		//모델에 추가해야할 데이터
		List<Map<String, Object>> menuList = new ArrayList<>();;
		SideBarModel sideBarModel = new SideBarModel(0, 0, 0);
		
		if(auth != null) {
			
			//관리자에게 허용된 메뉴 리스트 조회
			menuList = authService.getManagerAllowedMenuList(auth.getName());
			
			//대상 메소드의 매개변수에서 request찾기
			//요청 경로에 맞춰 좌측 사이드바 특정 메뉴탭 활성화
			for(Object arg : args) {
				if(arg instanceof HttpServletRequest) {						
					request = (HttpServletRequest) arg;
					String uri = request.getRequestURI();
					//메뉴리스트가 비어있지 않다면
					if(!menuList.isEmpty()) {
						
						for(Map<String, Object> map : menuList) {
							
							//부모메뉴 탭 정보
							AdminMenuDto parentMenu = (AdminMenuDto) map.get("parent");
							//현재 경로가 부모메뉴 탭의 경로라면
							if(uri.contains(parentMenu.getUrl())) {
								//게시판 관리 경로가 아니라면
								if(parentMenu.getMenuId() != 2) {
									//자식메뉴목록 - 타입 체크 생략함
									@SuppressWarnings("unchecked")
									List<AdminMenuDto> children = (List<AdminMenuDto>) map.get("children");
									
									//자식메뉴의 URI 비교
									for(AdminMenuDto childMenu : children) {
										//만약 자식메뉴탭에 해당하는 요청 경로라면
										if(uri.contains(childMenu.getUrl())) {
											sideBarModel = new SideBarModel(parentMenu.getMenuId(), childMenu.getMenuId(), 0);
										}							
									}	
								//게시판 관리 경로라면
								} else {
									//자식메뉴목록 - 타입 체크 생략함
									@SuppressWarnings("unchecked")
									List<BoardCtgDto> children = (List<BoardCtgDto>) map.get("children");
									
									//자식 메뉴(게시판)의 번호를 비교
									for(BoardCtgDto childBoard : children) {
										//만약 게시판 번호에 해당하는 요청 경로라면
										if(uri.contains(childBoard.getCtgId()+"")) {
											sideBarModel = new SideBarModel(parentMenu.getMenuId(), 0, childBoard.getCtgId());
										}
									}
								}
							}
						}
					}
				}
			}
			//대상 메소드의 매개변수에서 Model찾기
			//권한별 접근가능 메뉴탭 리스트와 요청 경로에 대한 메뉴탭 정보를 세팅해주기
			for(Object arg : args) {
				if(arg instanceof Model) {
					model = (Model) arg;
					model.addAttribute("allowedMenuList", menuList);
					model.addAttribute("chNum", sideBarModel);
					break;
				}
			}
		}
	}
}
