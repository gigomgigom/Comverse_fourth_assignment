package com.comverse.fourthsubject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	//관리자 홈
	@GetMapping("/main")
	public String main() {
		return "/admin/home";
	}
	//-------------------------------------------------------
	//-------------------------------------------------------
	//게시판 설정
	@GetMapping("/board/setting")
	public String boardSetting() {
		return "/admin/board/setting/board_setting";
	}
	//-------------------------------------------------------
	//-------------------------------------------------------
	//게시판 관리 - 우주학습센터 소개 - 목록
	@GetMapping("/board/manage/intro-learning-center/list")
	public String boardIntroLearningCenterList() {
		return "/admin/board/intro_learning_center/list";
	}
	//게시판 관리 - 우주학습센터 소개 - 상세
	@GetMapping("/board/manage/intro-learning-center/detail")
	public String boardIntroLearningCenterDetail() {
		return "/admin/board/intro_learning_center/detail";
	}
	//게시판 관리 - 우주학습센터 소개 - 수정
	@GetMapping("/board/manage/intro-learning-center/edit")
	public String boardIntroLearningCenterEdit() {
		return "/admin/board/intro_learning_center/edit";
	}
	//게시판 관리 - 우주학습센터 소개 - 생성
	@GetMapping("/board/manage/intro-learning-center/create")
	public String boardIntroLearningCenterCreate() {
		return "/admin/board/intro_learning_center/create";
	}
	//-------------------------------------------------------
	//게시판 관리 - 홈런학습센터 학습 후기 - 목록
	@GetMapping("/board/manage/study-review/list")
	public String boardStudyReviewList() {
		return "/admin/board/study_review/list";
	}
	//게시판 관리 - 홈런학습센터 학습 후기 - 상세
	@GetMapping("/board/manage/study-review/detail")
	public String boardStudyReviewDetail() {
		return "/admin/board/study_review/detail";
	}
	//게시판 관리 - 홈런학습센터 학습 후기 - 수정
	@GetMapping("/board/manage/study-review/edit")
	public String boardStudyReviewEdit() {
		return "/admin/board/study_review/edit";
	}
	//게시판 관리 - 홈런학습센터 학습 후기 - 생성
	@GetMapping("/board/manage/study-review/create")
	public String boardStudyReviewCreate() {
		return "/admin/board/study_review/create";
	}
	//-------------------------------------------------------
	//게시판 관리 - 홈런학습센터 교사 후기 - 목록
	@GetMapping("/board/manage/teacher-review/list")
	public String boardTeacherReviewList() {
		return "/admin/board/teacher_review/list";
	}
	//게시판 관리 - 홈런학습센터 교사 후기 - 상세
	@GetMapping("/board/manage/teacher-review/detail")
	public String boardTeacherReviewDetail() {
		return "/admin/board/teacher_review/detail";
	}
	//게시판 관리 - 홈런학습센터 교사 후기 - 수정
	@GetMapping("/board/manage/teacher-review/edit")
	public String boardTeacherReviewEdit() {
		return "/admin/board/teacher_review/edit";
	}
	//게시판 관리 - 홈런학습센터 교사 후기 - 생성
	@GetMapping("/board/manage/teacher-review/create")
	public String boardTeacherReviewCreate() {
		return "/admin/board/teacher_review/create";
	}
	//-------------------------------------------------------
	//게시판 관리 - FAQ
	@GetMapping("/board/manage/faq")
	public String boardFaq() {
		return "";
	}
	//게시판 관리 - 알려드립니다
	@GetMapping("/board/manage/notice")
	public String notice() {
		return "";
	}
	//-------------------------------------------------------
	//-------------------------------------------------------
	//설정 - 지국위치 안내
	@GetMapping("/manage/location")
	public String location() {
		return "";
	}
	//설정 - 사업설명회 관리
	@GetMapping("/manage/business")
	public String business() {
		return "";
	}
	//설정 - 사업설명회 신청
	@GetMapping("/manage/apply-biz")
	public String applyBiz() {
		return "";
	}
	//설정 - 학습센터 개설(교사가 학습센터에 참여희망하는것을 뜻한다는데...)
	@GetMapping("/manage/join-center")
	public String joinCenter() {
		return "";
	}
	//설정 - 문의 관리
	@GetMapping("/manage/one-to-one")
	public String oneToOne() {
		return "";
	}
	//-------------------------------------------------------
	//-------------------------------------------------------
	//관리자 관리
	@GetMapping("/manage/manager")
	public String manager() {
		return "";
	}
	//권한 관리
	@GetMapping("/manage/auth") 
	public String auth() {
		return "";
	}
	
}
