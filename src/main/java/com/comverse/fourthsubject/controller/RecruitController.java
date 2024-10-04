package com.comverse.fourthsubject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comverse.fourthsubject.dto.BizAplDto;
import com.comverse.fourthsubject.dto.RecruitDto;
import com.comverse.fourthsubject.service.BizService;
import com.comverse.fourthsubject.service.FaqService;
import com.comverse.fourthsubject.service.RecruitService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recruit")
public class RecruitController {
	
	@Autowired
	FaqService faqService;
	
	@Autowired
	BizService bizService;
	
	@Autowired
	RecruitService recruitService;
	
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
	
	//사업설명회 정보 가져오기
	@ResponseBody
	@GetMapping("/get_biz_detail")
	public ResponseEntity<?> getBizDetail(int prId) {
		return bizService.getBizDetailForUser(prId);
	}
	
	// 설정 - 사업설명회 신청 - 생성하기
	@ResponseBody
	@PostMapping("/create-biz-apply")
	public ResponseEntity<?> createBizApply(BizAplDto bizApl) {
		return bizService.createBizApply(bizApl);
	}
	
	//학습센터 개설
	@GetMapping("/center-setup")
	public String centerSetup() {
		return "user/recruit/recruit_center_setup";
	}
	
	//학습센터 개설신청
	@ResponseBody
	@PostMapping("/create-center-setup")
	public ResponseEntity<?> createCenterSetup(RecruitDto rcrt) {
		log.info(rcrt.toString());
		return recruitService.createJoinCenter(rcrt);
	}
}
