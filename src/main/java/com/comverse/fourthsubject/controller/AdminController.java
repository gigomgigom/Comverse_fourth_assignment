package com.comverse.fourthsubject.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.comverse.fourthsubject.dto.BoardCtgDto;
import com.comverse.fourthsubject.dto.BranchDto;
import com.comverse.fourthsubject.dto.RoleDto;
import com.comverse.fourthsubject.dto.TeamDto;
import com.comverse.fourthsubject.dto.nondb.AdminRequest;
import com.comverse.fourthsubject.dto.nondb.BoardFormRequest;
import com.comverse.fourthsubject.dto.nondb.RoleRequest;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;
import com.comverse.fourthsubject.service.admin.AuthService;
import com.comverse.fourthsubject.service.admin.BoardService;
import com.comverse.fourthsubject.service.admin.BranchService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private BoardService boardService;
	
	// 관리자 홈
	@GetMapping("/main")
	public String main(Model model, HttpServletRequest rq) {
		return "/admin/home";
	}

	// -------------------------------------------------------
	// -------------------------------------------------------
	// 게시판 설정
	@GetMapping("/board/setting")
	public String boardSetting(Model model, HttpServletRequest rq) {
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
	public String boardList(@PathVariable int boCtg, SearchIndex searchIndex, Model model, HttpServletRequest rq) {
		if(searchIndex.getPageNo() == null) {
			searchIndex.setPageNo("1");
		}
		if(searchIndex.getRowsPerPage() == 0) {
			searchIndex.setRowsPerPage(10);
		}
		boardService.getBoardList(boCtg, searchIndex, model);
		
		return "/admin/board/manage/list";
	}

	// 게시판 관리 - 상세 화면 이동
	@GetMapping("/board/manage/{boCtg}/detail")
	public String boardDetail(@PathVariable int boCtg, SearchIndex searchIndex, Model model, HttpServletRequest rq) {
		boardService.getBoardDetail(boCtg, searchIndex, model);
		return "/admin/board/manage/detail";
	}

	// 게시판 관리 - 수정 화면 이동
	@GetMapping("/board/manage/{boCtg}/edit")
	public String boardEdit(@PathVariable int boCtg, SearchIndex searchIndex, Model model, HttpServletRequest rq) {
		boardService.getBoardDetail(boCtg, searchIndex, model);
		return "/admin/board/manage/edit";
	}
	
	//게시판 관리 - 수정.1 게시글 내용 전달
	@ResponseBody
	@GetMapping("/board/manage/{boCtg}/get-board-content")
	public ResponseEntity<?> sendBoardContent(@PathVariable int boCtg, int boId, HttpServletRequest rq) {
		return boardService.getBoardContent(boId);
	}
	
	// 게시판 관리 - 수정하기
	@ResponseBody
	@PostMapping("/board/manage/{boCtg}/edit-board-detail")
	public ResponseEntity<?> editBoardDetail(@PathVariable int boCtg, BoardFormRequest boardForm) {
		try {			
			boardService.editBoardDetail(boardForm);
			return ResponseEntity.ok(null);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}
	
	// 게시판 관리 - 생성페이지 이동
	@GetMapping("/board/manage/{boCtg}/create")
	public String boardCreate(@PathVariable int boCtg, SearchIndex searchIndex, Model model, HttpServletRequest rq) {
		model.addAttribute("boCtg", boCtg);
		model.addAttribute("searchIndex", searchIndex);
		return "/admin/board/manage/create";
	}
	// 게시판 관리 - 게시글 생성하기
	@ResponseBody
	@PostMapping("/board/manage/{boCtg}/create-board")
	public ResponseEntity<?> createBoard(@PathVariable int boCtg, BoardFormRequest boardForm) {
		try {
			boardService.createBoard(boCtg, boardForm);
			return ResponseEntity.ok(null);
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}
	
	// 게시판 관리 - 생성, 수정시 업로드되는 이미지파일 서버로컬에 저장
	@ResponseBody
	@PostMapping("/board/manage/{boCtg}/upload-image")
	public ResponseEntity<?> boardUploadImage(@PathVariable int boCtg, @RequestParam("file") MultipartFile mf) {
		if(mf.isEmpty()) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("File is Empty");
		}
		try {
			String imageDownloadUrl = boardService.uploadImageFile(mf, boCtg);
			return ResponseEntity.ok(imageDownloadUrl);
		} catch(IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Could not upload file");
		}
	}
	// 게시판 관리 - 게시글 내 이미지파일 삭제
	@ResponseBody
	@GetMapping("/board/manage/{boCtg}/delete-image/{date}/{fileName}")
	public ResponseEntity<?> boardDeleteImage(@PathVariable String date, @PathVariable String fileName) {
		try {
			return boardService.boardDeleteImage(date, fileName);
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}	
	// -------------------------------------------------------
	
	@Autowired
	BranchService branchService;
	
	// -------------------------------------------------------
	// 설정 - 지국위치 안내 - 목록
	@GetMapping("/manage/general/location/list")
	public String locationList(Model model, SearchIndex searchIndex, HttpServletRequest rq) {
		if(searchIndex.getPageNo() == null || searchIndex.getPageNo().isEmpty()) {
			searchIndex.setPageNo("1");
		}
		if(searchIndex.getRowsPerPage() == 0) {
			searchIndex.setRowsPerPage(10);
		}
		branchService.getBranchList(model, searchIndex);
		return "/admin/general/location/list";
	}

	// 설정 - 지국위치 안내 - 상세
	@GetMapping("/manage/general/location/detail")
	public String locationDetail(Model model, SearchIndex searchIndex, HttpServletRequest rq) {
		branchService.getBranchDetail(model, searchIndex);
		return "/admin/general/location/detail";
	}

	// 설정 - 지국위치 안내 - 수정
	@GetMapping("/manage/general/location/edit")
	public String locationEdit(Model model, SearchIndex searchIndex, HttpServletRequest rq) {
		branchService.getBranchDetail(model, searchIndex);		
		return "/admin/general/location/edit";
	}
	
	// 설정 - 지국위치 안내 - 수정하기
	@ResponseBody
	@PostMapping("/manage/general/location/edit-branch")
	public ResponseEntity<?> editBranch(BranchDto branch) {
		return branchService.editBranch(branch);
	}

	// 설정 - 지국위치 안내 - 생성
	@GetMapping("/manage/general/location/create")
	public String locationCreate(Model model, SearchIndex searchIndex, HttpServletRequest rq) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		
		model.addAttribute("searchIndex", searchIndex);
		return "/admin/general/location/create";
	}

	// 설정 - 지국위치 안내 - 생성하기
	@ResponseBody
	@PostMapping("/manage/general/location/create-branch")
	public ResponseEntity<?> createBranch(BranchDto branch) {
		return branchService.createBranch(branch);
	}
	// -------------------------------------------------------
	// 설정 - 사업설명회 관리 - 목록
	@GetMapping("/manage/general/biz/list")
	public String businessList(Model model, HttpServletRequest rq) {

		return "/admin/general/biz_mng/list";
	}

	// 설정 - 사업설명회 관리 - 상세
	@GetMapping("/manage/general/biz/detail")
	public String businessDetail(Model model, HttpServletRequest rq) {

		return "/admin/general/biz_mng/detail";
	}

	// 설정 - 사업설명회 관리 - 수정
	@GetMapping("/manage/general/biz/edit")
	public String businessEdit(Model model, HttpServletRequest rq) {

		return "/admin/general/biz_mng/edit";
	}

	// 설정 - 사업설명회 관리 - 생성
	@GetMapping("/manage/general/biz/create")
	public String businessCreate(Model model, HttpServletRequest rq) {

		return "/admin/general/biz_mng/create";
	}

	// -------------------------------------------------------
	// 설정 - 사업설명회 신청 - 목록
	@GetMapping("/manage/general/biz-apply/list")
	public String applyBizList(Model model, HttpServletRequest rq) {

		return "/admin/general/biz_apply/list";
	}

	// 설정 - 사업설명회 신청 - 상세
	@GetMapping("/manage/general/biz-apply/detail")
	public String applyBizDetail(Model model, HttpServletRequest rq) {

		return "/admin/general/biz_apply/detail";
	}

	// 설정 - 사업설명회 신청 - 수정
	@GetMapping("/manage/general/biz-apply/edit")
	public String applyBizEdit(Model model, HttpServletRequest rq) {

		return "/admin/general/biz_apply/edit";
	}

	// 설정 - 사업설명회 신청 - 생성
	@GetMapping("/manage/general/biz-apply/create")
	public String applyBizCreate(Model model, HttpServletRequest rq) {

		return "/admin/general/biz_apply/create";
	}

	// -------------------------------------------------------
	// 설정 - 학습센터 개설 - 목록
	@GetMapping("/manage/general/join-center/list")
	public String joinCenterList(Model model, HttpServletRequest rq) {

		return "/admin/general/join-center/list";
	}

	// 설정 - 학습센터 개설 - 상세
	@GetMapping("/manage/general/join-center/detail")
	public String joinCenterDetail(Model model, HttpServletRequest rq) {

		return "/admin/general/join-center/detail";
	}

	// 설정 - 학습센터 개설 - 수정
	@GetMapping("/manage/general/join-center/edit")
	public String joinCenterEdit(Model model, HttpServletRequest rq) {

		return "/admin/general/join-center/edit";
	}

	// 설정 - 학습센터 개설 - 생성
	@GetMapping("/manage/general/join-center/create")
	public String joinCenterCreate(Model model, HttpServletRequest rq) {

		return "/admin/general/join-center/create";
	}

	// -------------------------------------------------------
	// 설정 - 문의 관리 - 목록
	@GetMapping("/manage/general/one-to-one/list")
	public String oneToOneList(Model model, HttpServletRequest rq) {

		return "/admin/general/onetoone/list";
	}

	// 설정 - 문의 관리 - 상세
	@GetMapping("/manage/general/one-to-one/detail")
	public String oneToOneDetail(Model model, HttpServletRequest rq) {

		return "/admin/general/onetoone/detail";
	}

	// 설정 - 문의 관리 - 생성
	@GetMapping("/manage/general/one-to-one/create")
	public String oneToOneCreate(Model model, HttpServletRequest rq) {

		return "/admin/general/onetoone/create";
	}

	// -------------------------------------------------------
	// 게시판 관리 - FAQ - 목록
	@GetMapping("/manage/general/faq/list")
	public String boardFaqList(Model model, HttpServletRequest rq) {

		return "/admin/board/faq/list";
	}

	// 게시판 관리 - FAQ - 상세
	@GetMapping("/manage/general/faq/detail")
	public String boardFaqDetail(Model model, HttpServletRequest rq) {

		return "/admin/board/faq/detail";
	}

	// 게시판 관리 - FAQ - 수정
	@GetMapping("/manage/general/faq/edit")
	public String boardFaqEdit(Model model, HttpServletRequest rq) {

		return "/admin/board/faq/edit";
	}

	// 게시판 관리 - FAQ - 생성
	@GetMapping("/manage/general/faq/create")
	public String boardFaqCreate(Model model, HttpServletRequest rq) {

		return "/admin/board/faq/create";
	}
	// -------------------------------------------------------
	
	@Autowired
	private AuthService authService;
	
	// -------------------------------------------------------
	// 관리자 관리 - 목록
	@GetMapping("/manage/role/manager/list")
	public String managerList(Model model, HttpServletRequest rq, SearchIndex searchIndex) {
		if(searchIndex.getPageNo() == null) {
			searchIndex.setPageNo("1");
		}
		if(searchIndex.getRowsPerPage() == 0) {
			searchIndex.setRowsPerPage(10);
		}
		if(searchIndex.getKeyword() == null && searchIndex.getTeam() == 0) {
			searchIndex.setTeam(-1);
		}
		authService.getManagerList(model, searchIndex);
		
		return "/admin/manager/list";
	}

	// 관리자 관리 - 생성 페이지 이동
	@GetMapping("/manage/role/manager/create")
	public String managerCreate(Model model, HttpServletRequest rq) {
		//팀 목록 가져오기
		List<TeamDto> teamList = authService.getTeamList();
		//현재 DB에 존재하고 있는 권한 목록을 모델에 세팅
		List<RoleDto> roleList = authService.getExistingRole();
		model.addAttribute("teamList", teamList);
		model.addAttribute("roleList", roleList);
		return "/admin/manager/create";
	}
	
	//	관리자 관리 - 생성 페이지 내 중복 체크
	@ResponseBody
	@GetMapping("/manage/role/manager/is-exist")
	public ResponseEntity<?> managerIsExist(int ctg, String line) {
		Boolean result = authService.isThisLineExistInDb(ctg, line);
		return ResponseEntity.ok(result);
	}

	// 관리자 관리 - 관리자 생성하기
	@ResponseBody
	@PostMapping("/manage/role/manager/create-manager")
	public ResponseEntity<?> createManager(@RequestBody AdminRequest ar) {
		authService.createManager(ar);
		return ResponseEntity.ok(null);
	}
	// 관리자 관리 - 수정
	@GetMapping("/manage/role/manager/edit")
	public String managerEdit(Model model, HttpServletRequest rq, SearchIndex searchIndex) {
		model.addAttribute("searchIndex", searchIndex);
		authService.getManagerDetail(model, searchIndex.getDetailId());
		return "/admin/manager/edit";
	}
	@ResponseBody
	@PostMapping("/manage/role/manager/edit-manager")
	public ResponseEntity<?> editManager(@RequestBody AdminRequest ar) {
		authService.editManager(ar);
		return ResponseEntity.ok(null);
	}
	// -------------------------------------------------------
	// 권한 관리 - 목록
	@GetMapping("/manage/role/auth/list")
	public String authList(Model model, HttpServletRequest rq, SearchIndex searchIndex) {
		if(searchIndex.getPageNo() == null || searchIndex.getPageNo().equals("")) {
			searchIndex.setPageNo("1");
		}
		if(searchIndex.getRowsPerPage() == 0) {
			searchIndex.setRowsPerPage(10);
		}
		authService.getRoleList(searchIndex, model);
		return "/admin/auth/list";
	}

	// 권한 관리 - 생성 페이지 이동
	@GetMapping("/manage/role/auth/create")
	public String authCreate(Model model, HttpServletRequest rq, SearchIndex searchIndex) {
		model.addAttribute("searchIndex", searchIndex);
		authService.getMenuList(model);
		return "/admin/auth/create";
	}
	
	// 권한 관리 - 권한 생성하기
	@ResponseBody
	@PostMapping("/manage/role/auth/create-role")
	public ResponseEntity<?> createRole(@RequestBody RoleRequest crr) {
		boolean result = authService.createRole(crr);
		return ResponseEntity.ok(result);
		
	}
	
	// 권한 관리 - 수정 페이지 이동
	@GetMapping("/manage/role/auth/edit")
	public String authEdit(Model model, HttpServletRequest rq, SearchIndex searchIndex) {
		model.addAttribute("searchIndex", searchIndex);
		authService.getRoleDetail(searchIndex.getDetailId(), model);
		return "/admin/auth/edit";
	}
	
	// 권한 관리 - 권한 수정하기
	@ResponseBody
	@PostMapping("/manage/role/auth/edit-role")
	public ResponseEntity<?> editRole(@RequestBody RoleRequest crr) {
		boolean result = authService.editRole(crr);
		return ResponseEntity.ok(result);
	}

}
