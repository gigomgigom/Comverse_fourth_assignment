package com.comverse.fourthsubject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comverse.fourthsubject.dto.SideBarModel;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	// 관리자 홈
	@GetMapping("/main")
	public String main(Model model) {
		return "/admin/home";
	}

	// -------------------------------------------------------
	// -------------------------------------------------------
	// 게시판 설정
	@GetMapping("/board/setting")
	public String boardSetting(Model model) {
		model.addAttribute("chNum", new SideBarModel(0, 0));

		return "/admin/board/setting/board_setting";
	}

	// -------------------------------------------------------
	// -------------------------------------------------------
	
	// 게시판 관리 - 우주학습센터 소개 - 목록
	@GetMapping("/board/manage/intro-learning-center/list")
	public String boardIntroLearningCenterList(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 0));

		return "/admin/board/intro_learning_center/list";
	}

	// 게시판 관리 - 우주학습센터 소개 - 상세
	@GetMapping("/board/manage/intro-learning-center/detail")
	public String boardIntroLearningCenterDetail(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 0));

		return "/admin/board/intro_learning_center/detail";
	}

	// 게시판 관리 - 우주학습센터 소개 - 수정
	@GetMapping("/board/manage/intro-learning-center/edit")
	public String boardIntroLearningCenterEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 0));

		return "/admin/board/intro_learning_center/edit";
	}

	// 게시판 관리 - 우주학습센터 소개 - 생성
	@GetMapping("/board/manage/intro-learning-center/create")
	public String boardIntroLearningCenterCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 0));

		return "/admin/board/intro_learning_center/create";
	}

	// -------------------------------------------------------
	// 게시판 관리 - 홈런학습센터 학습 후기 - 목록
	@GetMapping("/board/manage/study-review/list")
	public String boardStudyReviewList(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 1));

		return "/admin/board/study_review/list";
	}

	// 게시판 관리 - 홈런학습센터 학습 후기 - 상세
	@GetMapping("/board/manage/study-review/detail")
	public String boardStudyReviewDetail(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 1));

		return "/admin/board/study_review/detail";
	}

	// 게시판 관리 - 홈런학습센터 학습 후기 - 수정
	@GetMapping("/board/manage/study-review/edit")
	public String boardStudyReviewEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 1));

		return "/admin/board/study_review/edit";
	}

	// 게시판 관리 - 홈런학습센터 학습 후기 - 생성
	@GetMapping("/board/manage/study-review/create")
	public String boardStudyReviewCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 1));

		return "/admin/board/study_review/create";
	}

	// -------------------------------------------------------
	// 게시판 관리 - 홈런학습센터 교사 후기 - 목록
	@GetMapping("/board/manage/teacher-review/list")
	public String boardTeacherReviewList(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 2));

		return "/admin/board/teacher_review/list";
	}

	// 게시판 관리 - 홈런학습센터 교사 후기 - 상세
	@GetMapping("/board/manage/teacher-review/detail")
	public String boardTeacherReviewDetail(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 2));

		return "/admin/board/teacher_review/detail";
	}

	// 게시판 관리 - 홈런학습센터 교사 후기 - 수정
	@GetMapping("/board/manage/teacher-review/edit")
	public String boardTeacherReviewEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 2));

		return "/admin/board/teacher_review/edit";
	}

	// 게시판 관리 - 홈런학습센터 교사 후기 - 생성
	@GetMapping("/board/manage/teacher-review/create")
	public String boardTeacherReviewCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 2));

		return "/admin/board/teacher_review/create";
	}

	// -------------------------------------------------------
	// 게시판 관리 - 알려드립니다 - 목록
	@GetMapping("/board/manage/notice/list")
	public String noticeList(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 3));

		return "/admin/board/notice/list";
	}

	// 게시판 관리 - 알려드립니다 - 상세
	@GetMapping("/board/manage/notice/detail")
	public String noticeDetail(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 3));

		return "/admin/board/notice/detail";
	}

	// 게시판 관리 - 알려드립니다 - 수정
	@GetMapping("/board/manage/notice/edit")
	public String noticeEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 3));

		return "/admin/board/notice/edit";
	}

	// 게시판 관리 - 알려드립니다 - 생성
	@GetMapping("/board/manage/notice/create")
	public String noticeCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(1, 3));

		return "/admin/board/notice/create";
	}

	// -------------------------------------------------------
	// -------------------------------------------------------
	// 설정 - 지국위치 안내 - 목록
	@GetMapping("/manage/location/list")
	public String locationList(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 0));

		return "/admin/general/location/list";
	}

	// 설정 - 지국위치 안내 - 상세
	@GetMapping("/manage/location/detail")
	public String locationDetail(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 0));

		return "/admin/general/location/detail";
	}

	// 설정 - 지국위치 안내 - 수정
	@GetMapping("/manage/location/edit")
	public String locationEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 0));

		return "/admin/general/location/edit";
	}

	// 설정 - 지국위치 안내 - 생성
	@GetMapping("/manage/location/create")
	public String locationCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 0));

		return "/admin/general/location/create";
	}

	// -------------------------------------------------------
	// 설정 - 사업설명회 관리 - 목록
	@GetMapping("/manage/biz/list")
	public String businessList(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 1));

		return "/admin/general/biz_mng/list";
	}

	// 설정 - 사업설명회 관리 - 상세
	@GetMapping("/manage/biz/detail")
	public String businessDetail(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 1));

		return "/admin/general/biz_mng/detail";
	}

	// 설정 - 사업설명회 관리 - 수정
	@GetMapping("/manage/biz/edit")
	public String businessEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 1));

		return "/admin/general/biz_mng/edit";
	}

	// 설정 - 사업설명회 관리 - 생성
	@GetMapping("/manage/biz/create")
	public String businessCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 1));

		return "/admin/general/biz_mng/create";
	}

	// -------------------------------------------------------
	// 설정 - 사업설명회 신청 - 목록
	@GetMapping("/manage/biz-apply/list")
	public String applyBizList(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 2));

		return "/admin/general/biz_apply/list";
	}

	// 설정 - 사업설명회 신청 - 상세
	@GetMapping("/manage/biz-apply/detail")
	public String applyBizDetail(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 2));

		return "/admin/general/biz_apply/detail";
	}

	// 설정 - 사업설명회 신청 - 수정
	@GetMapping("/manage/biz-apply/edit")
	public String applyBizEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 2));

		return "/admin/general/biz_apply/edit";
	}

	// 설정 - 사업설명회 신청 - 생성
	@GetMapping("/manage/biz-apply/create")
	public String applyBizCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 2));

		return "/admin/general/biz_apply/create";
	}

	// -------------------------------------------------------
	// 설정 - 학습센터 개설 - 목록
	@GetMapping("/manage/join-center/list")
	public String joinCenterList(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 3));

		return "/admin/general/join-center/list";
	}

	// 설정 - 학습센터 개설 - 상세
	@GetMapping("/manage/join-center/detail")
	public String joinCenterDetail(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 3));

		return "/admin/general/join-center/detail";
	}

	// 설정 - 학습센터 개설 - 수정
	@GetMapping("/manage/join-center/edit")
	public String joinCenterEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 3));

		return "/admin/general/join-center/edit";
	}

	// 설정 - 학습센터 개설 - 생성
	@GetMapping("/manage/join-center/create")
	public String joinCenterCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 3));

		return "/admin/general/join-center/create";
	}

	// -------------------------------------------------------
	// 설정 - 문의 관리 - 목록
	@GetMapping("/manage/one-to-one/list")
	public String oneToOneList(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 4));

		return "/admin/general/onetoone/list";
	}

	// 설정 - 문의 관리 - 상세
	@GetMapping("/manage/one-to-one/detail")
	public String oneToOneDetail(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 4));

		return "/admin/general/onetoone/detail";
	}

	// 설정 - 문의 관리 - 생성
	@GetMapping("/manage/one-to-one/create")
	public String oneToOneCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 4));

		return "/admin/general/onetoone/create";
	}

	// -------------------------------------------------------
	// 게시판 관리 - FAQ - 목록
	@GetMapping("/manage/faq/list")
	public String boardFaqList(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 5));

		return "/admin/board/faq/list";
	}

	// 게시판 관리 - FAQ - 상세
	@GetMapping("/manage/faq/detail")
	public String boardFaqDetail(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 5));

		return "/admin/board/faq/detail";
	}

	// 게시판 관리 - FAQ - 수정
	@GetMapping("/manage/faq/edit")
	public String boardFaqEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 5));

		return "/admin/board/faq/edit";
	}

	// 게시판 관리 - FAQ - 생성
	@GetMapping("/manage/faq/create")
	public String boardFaqCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(2, 5));

		return "/admin/board/faq/create";
	}
	// -------------------------------------------------------
	// -------------------------------------------------------
	// 관리자 관리 - 목록
	@GetMapping("/manage/manager/list")
	public String managerList(Model model) {
		model.addAttribute("chNum", new SideBarModel(3, 0));

		return "/admin/manager/list";
	}

	// 관리자 관리 - 생성
	@GetMapping("/manage/manager/create")
	public String managerCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(3, 0));

		return "/admin/manager/create";
	}

	// 관리자 관리 - 수정
	@GetMapping("/manage/manager/edit")
	public String managerEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(3, 0));

		return "/admin/manager/edit";
	}

	// -------------------------------------------------------
	// 권한 관리 - 목록
	@GetMapping("/manage/auth/list")
	public String authList(Model model) {
		model.addAttribute("chNum", new SideBarModel(3, 1));

		return "/admin/auth/list";
	}

	// 권한 관리 - 생성
	@GetMapping("/manage/auth/create")
	public String authCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(3, 1));

		return "/admin/auth/create";
	}

	// 권한 관리 - 수정
	@GetMapping("/manage/auth/edit")
	public String authEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(3, 1));

		return "/admin/auth/edit";
	}

}
