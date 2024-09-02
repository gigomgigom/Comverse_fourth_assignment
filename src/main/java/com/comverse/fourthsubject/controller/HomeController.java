package com.comverse.fourthsubject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class HomeController {
	
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
