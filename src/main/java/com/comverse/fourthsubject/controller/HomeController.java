package com.comverse.fourthsubject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class HomeController {
	
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
}
