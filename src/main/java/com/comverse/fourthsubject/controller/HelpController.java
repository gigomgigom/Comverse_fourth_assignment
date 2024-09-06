package com.comverse.fourthsubject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/help")
public class HelpController {
	
	//지국위치 안내
	@GetMapping("/location")
	public String location() {
		return "/user/help/help_location";
	}
	
	//알려드립니다. 목록
	@GetMapping("/notice-list")
	public String noticeList() {
		return "/user/help/help_notice_list";
	}
	
	//알려드립니다. 상세
	@GetMapping("/notice-detail")
	public String noticeDetail() {
		return "/user/help/help_notice_detail";
	}
	
	//1대1
	@GetMapping("/one-to-one")
	public String oneToOne() {
		return "/user/help/help_onetoone";
	}
}
 