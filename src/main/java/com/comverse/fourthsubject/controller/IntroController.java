package com.comverse.fourthsubject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/intro")
public class IntroController {
	
	//학습센터란?
	@GetMapping("/learning-center")
	public String learningCenter() {
		return "/user/intro/intro_learning_center";
	}
	
	//우수센터 소개 - 목록
	@GetMapping("/bestcenter-list")
	public String bestCenterList() {
		return "/user/intro/intro_bestcenter_list";
	}
	
	//우수센터 소개 - 상세
	@GetMapping("/bestcenter-detail")
	public String bestCenterDetail() {
		return "/user/intro/intro_bestcenter_detail";
	}
	
	//교사 후기 목록
	@GetMapping("/teacher-review-list")
	public String teacherReviewList() {
		return "/user/intro/intro_teacher_review_list";
	}
	
	//교사 후기 상세
	@GetMapping("/teacher-review-detail")
	public String teacherReviewDetail() {
		return "/user/intro/intro_teacher_review_detail";
	}
	
	//회원 후기 목록
	@GetMapping("/review-list")
	public String reviewList() {
		return "/user/intro/intro_review_list";
	}
	
	//회원 후기 상세
	@GetMapping("/review-detail")
	public String reviewDetail() {
		return "/user/intro/intro_review_detail";
	}
}
