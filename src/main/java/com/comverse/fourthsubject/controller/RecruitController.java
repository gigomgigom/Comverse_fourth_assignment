package com.comverse.fourthsubject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recruit")
public class RecruitController {
	
	//홈런 선생님 소개
	@GetMapping("/teacher")
	public String teacher() {
		return "user/recruit/recruit_teacher";
	}
	
	//지원자격 및 절차
	@GetMapping("/process")
	public String process() {
		return "user/recruit/recruit_process";
	}
	
	//모집 관련 FAQ
	@GetMapping("/faq")
	public String faq() {
		return "user/recruit/recruit_faq";
	}
	
	//사업설명회 안내
	@GetMapping("/business")
	public String business() {
		return "user/recruit/recruit_business";
	}
	
	//학습센터 개설
	@GetMapping("/center-setup")
	public String centerSetup() {
		return "user/recruit/recruit_center_setup";
	}
}
