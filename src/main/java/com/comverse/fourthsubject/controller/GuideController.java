package com.comverse.fourthsubject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/guide")
public class GuideController {
	
	//학습 서비스 안내
	@GetMapping("/product")
	public String product() {
		return "/user/guide/guide_product";
	}
	
	//학습 프로세스
	@GetMapping("/learning-process")
	public String learningProcess() {
		return "/user/guide/guide_learning_process";
	}
	
	//학습 문의
	@GetMapping("/query")
	public String query() {
		return "/user/guide/guide_query";
	}
	
}
