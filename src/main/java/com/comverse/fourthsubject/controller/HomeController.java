package com.comverse.fourthsubject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comverse.fourthsubject.dto.InquiryDto;
import com.comverse.fourthsubject.service.InquiryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class HomeController {
	
	
	@Autowired
	InquiryService inqService;
	
	//관리자 로그인
	@GetMapping("icecream/login")
	public String login(Model model) {
		return "/admin/login";
	}
	
	@GetMapping("")
	public String empty() {
		return "redirect:/main";
	}
	
	@GetMapping("main")
	public String main() {
		return "/user/main";
	}
	
	@GetMapping("policy")
	public String policy() {
		return "/user/policy";
	}
	
	//학습문의 생성
	@ResponseBody
	@PostMapping("create-inquiry")
	public ResponseEntity<?> createQuery(InquiryDto inq) {
		return inqService.createInquiry(inq);
	}
}
