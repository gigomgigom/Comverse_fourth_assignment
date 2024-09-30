package com.comverse.fourthsubject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comverse.fourthsubject.service.BizService;
import com.comverse.fourthsubject.service.FaqService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recruit")
public class RecruitController {
	
	@Autowired
	FaqService faqService;
	
	@Autowired
	BizService bizService;
	
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
	public String faq(Model model) {
		faqService.getFaqListForUser(model);
		return "user/recruit/recruit_faq";
	}
	
	//사업설명회 안내
	@GetMapping("/business")
	public String business(Model model) {
		bizService.getBizListForUser(model);
		return "user/recruit/recruit_business";
	}
	
	//학습센터 개설
	@GetMapping("/center-setup")
	public String centerSetup() {
		return "user/recruit/recruit_center_setup";
	}
}
