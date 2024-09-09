package com.comverse.fourthsubject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comverse.fourthsubject.dto.BoardCtgDto;
import com.comverse.fourthsubject.dto.SideBarModel;
import com.comverse.fourthsubject.service.admin.AuthService;
import com.comverse.fourthsubject.service.admin.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private BoardService boardService;
	
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
		List<BoardCtgDto> ctgList = boardService.getBoardCtgList();
		model.addAttribute("ctgList", ctgList);
		return "/admin/board/setting/board_setting";
	}
	// 게시판 선택(상세 조회)
	@ResponseBody
	@GetMapping("/board/setting/show")
	public ResponseEntity<?> getBoardCtgDetail(int ctgId) {
		BoardCtgDto result = boardService.getBoardCtgDetail(ctgId);
		if(result == null) {
			return ResponseEntity.noContent().build();
		} else {
			return ResponseEntity.ok(result);
		}
	}
	// 게시판 생성
	@ResponseBody
	@GetMapping("/board/setting/create")
	public ResponseEntity<?> createBoardCtg() {
		int createdRow = boardService.createBoardCtg();
		if(createdRow > 0) {
			return ResponseEntity.ok().build();
		} else {
			return ResponseEntity.notFound().build();
		}
	}
	// 게시판 수정
	@ResponseBody
	@PostMapping("/board/setting/edit")
	public ResponseEntity<?> editBoardCtg(BoardCtgDto boardCtgDto) {
		int changedRow = boardService.editBoardCtg(boardCtgDto);
		if(changedRow > 0) {
			return ResponseEntity.ok().build();
		} else {
			return ResponseEntity.notFound().build();
		}
	}
	// 게시판 삭제
	@ResponseBody
	@GetMapping("/board/setting/delete")
	public ResponseEntity<?> deleteBoardCtg(int ctgId) {
		int changedRow = boardService.removeBoardCtg(ctgId);
		if(changedRow > 0) {
			return ResponseEntity.ok().build();
		} else {
			return ResponseEntity.notFound().build();
		}
	}
	// -------------------------------------------------------
	// -------------------------------------------------------
	
	// 게시판 관리 - 목록
	@GetMapping("/board/manage/{boCtg}/list")
	public String boardIntroLearningCenterList(@PathVariable int boCtg, Model model) {
		model.addAttribute("chNum", new SideBarModel(1, boCtg));

		return "/admin/board/manage/list";
	}

	// 게시판 관리 - 상세
	@GetMapping("/board/manage/{boCtg}/detail")
	public String boardIntroLearningCenterDetail(@PathVariable int boCtg, Model model) {
		model.addAttribute("chNum", new SideBarModel(1, boCtg));

		return "/admin/board/manage/detail";
	}

	// 게시판 관리 - 수정
	@GetMapping("/board/manage/{boCtg}/edit")
	public String boardIntroLearningCenterEdit(@PathVariable int boCtg, Model model) {
		model.addAttribute("chNum", new SideBarModel(1, boCtg));

		return "/admin/board/manage/edit";
	}

	// 게시판 관리 - 생성
	@GetMapping("/board/manage/{boCtg}/create")
	public String boardIntroLearningCenterCreate(@PathVariable int boCtg, Model model) {
		model.addAttribute("chNum", new SideBarModel(1, boCtg));

		return "/admin/board/manage/create";
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
	
	@Autowired
	private AuthService authService;
	
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

	// 권한 관리 - 생성 페이지 이동
	@GetMapping("/manage/auth/create")
	public String authCreate(Model model) {
		model.addAttribute("chNum", new SideBarModel(3, 1));
		authService.getMenuList(model);
		
		return "/admin/auth/create";
	}

	// 권한 관리 - 수정 페이지 이동
	@GetMapping("/manage/auth/edit")
	public String authEdit(Model model) {
		model.addAttribute("chNum", new SideBarModel(3, 1));

		return "/admin/auth/edit";
	}

}
