package com.comverse.fourthsubject.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dao.AuthDao;
import com.comverse.fourthsubject.dao.BoardCtgDao;
import com.comverse.fourthsubject.dto.AdminDto;
import com.comverse.fourthsubject.dto.AdminMenuDto;
import com.comverse.fourthsubject.dto.BoardCtgDto;
import com.comverse.fourthsubject.dto.RoleDto;
import com.comverse.fourthsubject.dto.TeamDto;
import com.comverse.fourthsubject.dto.nondb.AdminRequest;
import com.comverse.fourthsubject.dto.nondb.Pager;
import com.comverse.fourthsubject.dto.nondb.RoleRequest;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AuthService {
	
	@Autowired
	private BoardCtgDao boardCtgDao;
	@Autowired
	private AuthDao authDao;
	
	//요청한 경로가 로그인한 관리자에게 허용되어있는지 체크
	public boolean checkRequestUriAllowedToAdmin(String adminId, String requestUri) {
		//메뉴 || 게시판 번호
		int menuId = 0;
		//게시판관리의 경로인지 여부 체크
		boolean isRequestUriForBoard = false;
		//결과
		boolean result = false;
		
		//아이디에 설정된 권한 번호의 목록 가져오기
		int admNo = authDao.selectAdminByAdminId(adminId).getAdmNo();
		List<Integer> roleIdList = authDao.selectRoleListByAdminId(admNo);
		
		//경로에 해당하는 메뉴정보 가져오기
		List<AdminMenuDto> menuList = authDao.selectMenuIdListByUri(requestUri);
		for(AdminMenuDto menu : menuList) {
			//부모 계층 찾기
			if(menu.getDpth() == 1) {
				//만약 부모계층이 게시판 관리라면
				if(menu.getMenuId() == 2) {
					isRequestUriForBoard = true;
					//게시판 번호 찾기
					StringTokenizer st = new StringTokenizer(requestUri, "/");
					while(st.hasMoreElements()) {
						try {
							//게시판 번호 세팅
							menuId = Integer.parseInt(st.nextToken());
						} catch (NumberFormatException e) {
							//예외 처리
						}						
					}
				} else {
					menuList.remove(menu);
					//메뉴 번호 세팅
					menuId = menuList.get(0).getMenuId();
				}
			}
		}
		
		//관리자의 권한이 접근할 수 있는 메뉴인지 여부
		int rowCnt = 0;
		
		if(isRequestUriForBoard) { //요청경로가 게시판 관리일경우
			rowCnt = authDao.selectRowCntOfBoardWhereRoleId(menuId, roleIdList);
		} else { //요청 경로가 게시판 관리 이외의 메뉴 경로일 경우
			rowCnt = authDao.selectRowCntOfMenuWhereRoleId(menuId, roleIdList);
		}
		
		//관리자의 권한이 접근할 수 있는 메뉴라면
		if(rowCnt > 0) {
			result = true;
		} else if(requestUri.equals("/admin/main")) {
			result = true;
		}
		
		return result;
	}	
	//-----------------------------------------------------------
	//로그인한 관리자에게 허용된 메뉴 리스트 찾아주기
	public List<Map<String, Object>> getManagerAllowedMenuList(String admId) {
		List<Map<String, Object>> result = new ArrayList<>();
		
		List<AdminMenuDto> adminMenu = authDao.selectMenuListByAdmId(admId);
		
		for(int i=0; i<adminMenu.size(); i++) {
			//부모 메뉴를 찾았다면
			if(adminMenu.get(i).getDpth() == 1) {
				int groupNo = adminMenu.get(i).getGrp();
				//그룹 객체 생성
				Map<String, Object> group = new HashMap<>();
				//그룹 산하 자식 메뉴 리스트
				List<Object> children = new ArrayList<>();
				group.put("parent", adminMenu.get(i));
				
				//게시판 관리일 경우
				if(adminMenu.get(i).getMenuId() == 2) {
					List<BoardCtgDto> boardList = authDao.selectBoardListByAdmId(admId);
					for(BoardCtgDto boardCtg : boardList) {
						children.add(boardCtg);
					}
				} else {
					//자식 찾기
					for(int j=i+1; j<adminMenu.size(); j++) {
						if(adminMenu.get(j).getGrp() == groupNo) {
							children.add(adminMenu.get(j));
							i++;
						} else {
							break;
						}
					}
				}
				
				group.put("children", children);
				result.add(group);
			}
		}
		return result;
	}
	
	//권한 관리 - 메뉴 구조 가져오기
	public void getMenuList(Model model) {
		List<Map<String,Object>> result = new ArrayList<>();
		
		List<AdminMenuDto> adminMenu = authDao.selectMenuList();
		for(int i=0; i<adminMenu.size(); i++) {
			//부모 메뉴를 찾았다면
			if(adminMenu.get(i).getDpth() == 1) {
				int groupNo = adminMenu.get(i).getGrp();
				//그룹 객체 생성
				Map<String, Object> group = new HashMap<>();
				//그룹 산하 자식 리스트
				List<Object> children = new ArrayList<>();
				//부모 메뉴 삽입
				group.put("parent", adminMenu.get(i));
				//자식 찾기
				for(int j=i+1; j<adminMenu.size(); j++) {
					if(adminMenu.get(j).getGrp() == groupNo) {
						children.add(adminMenu.get(j));
						i++;
					} else {
						break;
					}
				}
				group.put("children", children);
				result.add(group);
			}
		}
		//게시판 목록 추가해주기
		List<BoardCtgDto> boardList = boardCtgDao.selectBoardCtgList();
		result.get(1).put("children", boardList);
		
		model.addAttribute("menuList", result);
	}
	//권한 생성
	@Transactional
	public boolean createRole(RoleRequest crr) {
		RoleDto role = new RoleDto(0, crr.getRoleName(), crr.isRoleEnabled(), crr.isRoleRemovable());
		//권한 생성 (생성된 권한의 식별자를 반환 받음)
		authDao.insertRole(role);
		
		insertRoleMenuAuth(role.getRoleId(), crr.getMenuList());
		insertRoleBoardAuth(role.getRoleId(), crr.getBoardList());
		
		return true;
	}
	//메뉴 권한 정보 추가
	public void insertRoleMenuAuth(int roleId, List<Integer> menuList) {
		for(int menuId : menuList) {
			authDao.insertRoleMenuAuth(roleId, menuId);
		}
	}
	//게시판 권한 정보 추가
	public void insertRoleBoardAuth(int roleId, List<Integer> boardList) {
		for(int ctgId : boardList) {
			authDao.insertRoleBoardAuth(roleId, ctgId);
		}
	}
	//권한 목록 가져오기
	public void getRoleList(SearchIndex searchIndex, Model model) {
		//검색 결과의 총 갯수 가져오기
		int totalRows = authDao.selectRoleCnt(searchIndex);
		//페이저 객체 생성
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		searchIndex.setPager(pager);
		//현재 페이지에 보여질 권한 목록 가져오기
		List<RoleDto> roleList = authDao.selectRoleList(searchIndex);
		//모델 속성 추가
		model.addAttribute("roleList", roleList);
		model.addAttribute("searchIndex", searchIndex);
	}
	//권한 상세 보기(권한 수정 화면)
	public void getRoleDetail(String detailId, Model model) {
		//메뉴 목록 가져오기
		getMenuList(model);
		//권한 정보 가져오기
		RoleDto role = authDao.selectRoleDetailById(detailId);
		//설정된 메뉴 및 게시판 정보 가져오기
		//메뉴
		List<Integer> authMenuList = authDao.selectMenuListByRoleId(detailId);
		//게시판
		List<Integer> authBoardList = authDao.selectBoardListByRoleId(detailId);
		model.addAttribute("role", role);
		model.addAttribute("authMenuList", authMenuList);
		model.addAttribute("authBoardList", authBoardList);
	}
	//권한 수정
	@Transactional
	public boolean editRole(RoleRequest crr) {
		RoleDto roleDto = new RoleDto(crr.getRoleId(), crr.getRoleName(), crr.isRoleEnabled(), crr.isRoleRemovable());
		//권한 정보 수정하기
		authDao.updateRoleDetail(roleDto);
		//권한에 해당하는 메뉴, 게시물 정보 삭제하기
		authDao.deleteRoleBoardList(roleDto.getRoleId());
		authDao.deleteRoleMenuList(roleDto.getRoleId());
		//새로운 권한 및 게시물 정보 넣어주기
		insertRoleMenuAuth(roleDto.getRoleId(), crr.getMenuList());
		insertRoleBoardAuth(roleDto.getRoleId(), crr.getBoardList());
		return true;
	}
	//=============================================================================
	//관리자 관리
	
	//최종 접속일 업데이트
	public void updateLoginDate(String name) {
		authDao.updateLoginDate(name);
	}
	//권한/팀 목록 가져오기
	public List<RoleDto> getExistingRole() {
		List<RoleDto> roleList = authDao.selectRoleListForManager();
		return roleList;
	}
	public List<TeamDto> getTeamList() {
		List<TeamDto> teamList = authDao.selectTeamListForManager();
		return teamList;
	}
	//Id, Email 존재 여부파악
	public Boolean isThisLineExistInDb(int ctg, String line) {
		int selectedRow = authDao.selectIsLineExist(ctg, line);
		if(selectedRow > 0) {
			return true;
		} else {
			return false;
		}
	}
	//------------------생성
	//관리자 생성하기
	@Transactional
	public void createManager(AdminRequest ar) {
		Map<String, Object> data = handlingAdminRequestData(ar);
		AdminDto admin = (AdminDto) data.get("admin");
		authDao.insertAdmin(admin);
		
		@SuppressWarnings("unchecked")
		List<Integer> roleList = (List<Integer>) data.get("roleList");
		
		if(!roleList.isEmpty()) {
			for(int roleId : roleList) {
				authDao.insertAdminRole(admin.getAdmNo(), roleId);
			}
		}
	}
	//요청 데이터 가공하는 메소드
	public Map<String, Object> handlingAdminRequestData(AdminRequest ar) {
		//관리자 정보 세팅
		Map<String, Object> result = new HashMap<>();
		AdminDto admin = new AdminDto();
		admin.setAdmNo(ar.getAdmNo());
		admin.setAdmName(ar.getAdmName());
		admin.setAdmId(ar.getAdmId());
		admin.setAdmTel(ar.getAdmTel());
		admin.setAdmEmail(ar.getAdmEmail());
		admin.setAdmTeam(ar.getAdmTeam());
		//비밀번호 암호화
		PasswordEncoder pe = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(ar.getAdmPw() != null && !ar.getAdmPw().equals("")) {
			admin.setAdmPw(pe.encode(ar.getAdmPw()));
		} else {
			admin.setAdmPw(null);
		}
		
		if(!ar.getAdmStts().equals("")) {
			admin.setAdmStts(ar.getAdmStts());
			String stts = admin.getAdmStts();
			switch(stts) {
				case "승인완료":
					admin.setAdmEnabled(true);
					break;
				case "승인중":
				case "접근불가":
				case "휴면":
					admin.setAdmEnabled(false);
					break;
			}
		}
		
		//관리자의 권한 목록 세팅
		List<Integer> roleList = ar.getRoleList();
		roleList.removeIf(roleId -> roleId == 0);
		
		result.put("admin", admin);
		result.put("roleList", roleList);
		
		return result;
	}
	//---------------목록
	public void getManagerList(Model model, SearchIndex searchIndex) {
		List<TeamDto> teamList = getTeamList();
		model.addAttribute("teamList", teamList);
		
		//목록 조회
		int totalRows = authDao.selectManagerCnt(searchIndex);
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		searchIndex.setPager(pager);
		model.addAttribute("searchIndex", searchIndex);
		
		List<AdminDto> admList = authDao.selectAdminList(searchIndex);
		for(AdminDto adm : admList) {
			TeamDto team = authDao.selectTeamByTeamId(adm.getAdmTeam());
			adm.setTeam(team);
		}
		model.addAttribute("admList", admList);
	}
	//---------------상세 조회
	public void getManagerDetail(Model model, String detailId) {
		AdminDto admin = authDao.selectManagerDetail(Integer.parseInt(detailId));
		List<RoleDto> roleList = getExistingRole();
		List<TeamDto> teamList = getTeamList();
		
		List<Integer> manageRole = authDao.selectRoleListByAdminId(Integer.parseInt(detailId));
		
		model.addAttribute("manageRole", manageRole);
		model.addAttribute("roleList", roleList);
		model.addAttribute("teamList", teamList);
		model.addAttribute("admin", admin);
	}
	//---------------관리자 정보 수정
	@Transactional
	public void editManager(AdminRequest ar) {
		Map<String, Object> data = handlingAdminRequestData(ar);
		AdminDto admin = (AdminDto) data.get("admin");
		authDao.updateManagerDetail(admin);
		
		@SuppressWarnings("unchecked")
		List<Integer> roleList = (List<Integer>) data.get("roleList");
		
		authDao.deleteManagerRole(admin.getAdmNo());
		
		
		if(!roleList.isEmpty()) {
			for(int roleId : roleList) {
				//관리자 별 권한 목록 추가
				authDao.insertAdminRole(admin.getAdmNo(), roleId);
			}
		}
		
	}
}
