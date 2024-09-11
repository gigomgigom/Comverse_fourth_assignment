package com.comverse.fourthsubject.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dao.AdminMenuDao;
import com.comverse.fourthsubject.dao.BoardCtgDao;
import com.comverse.fourthsubject.dao.RoleDao;
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
	private AdminMenuDao adminMenuDao;
	@Autowired
	private RoleDao roleDao;
	
	//권한 관리 - 메뉴 구조 가져오기
	public void getMenuList(Model model) {
		List<Map<String,Object>> result = new ArrayList<>();
		
		List<AdminMenuDto> adminMenu = adminMenuDao.selectMenuList();
		for(int i=0; i<adminMenu.size(); i++) {
			//부모 메뉴를 찾았다면
			if(adminMenu.get(i).getDpth() == 1) {
				int groupNo = adminMenu.get(i).getGrp();
				//그룹 객체 생성
				Map<String, Object> group = new HashMap<>();
				//그룹 산하 자식 메뉴 모음
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
		roleDao.insertRole(role);
		
		insertRoleMenuAuth(role.getRoleId(), crr.getMenuList());
		insertRoleBoardAuth(role.getRoleId(), crr.getBoardList());
		
		return true;
	}
	//메뉴 권한 정보 추가
	public void insertRoleMenuAuth(int roleId, List<Integer> menuList) {
		for(int menuId : menuList) {
			roleDao.insertRoleMenuAuth(roleId, menuId);
		}
	}
	//게시판 권한 정보 추가
	public void insertRoleBoardAuth(int roleId, List<Integer> boardList) {
		for(int ctgId : boardList) {
			roleDao.insertRoleBoardAuth(roleId, ctgId);
		}
	}
	//권한 목록 가져오기
	public void getRoleList(SearchIndex searchIndex, Model model) {
		//검색 결과의 총 갯수 가져오기
		int totalRows = roleDao.selectRoleCnt(searchIndex);
		//페이저 객체 생성
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		searchIndex.setPager(pager);
		//현재 페이지에 보여질 권한 목록 가져오기
		List<RoleDto> roleList = roleDao.selectRoleList(searchIndex);
		//모델 속성 추가
		model.addAttribute("roleList", roleList);
		model.addAttribute("searchIndex", searchIndex);
	}
	//권한 상세 보기(권한 수정 화면)
	public void getRoleDetail(String detailId, Model model) {
		//메뉴 목록 가져오기
		getMenuList(model);
		//권한 정보 가져오기
		RoleDto role = roleDao.selectRoleDetailById(detailId);
		//설정된 메뉴 및 게시판 정보 가져오기
		//메뉴
		List<Integer> authMenuList = roleDao.selectMenuListByRoleId(detailId);
		//게시판
		List<Integer> authBoardList = roleDao.selectBoardListByRoleId(detailId);
		model.addAttribute("role", role);
		model.addAttribute("authMenuList", authMenuList);
		model.addAttribute("authBoardList", authBoardList);
	}
	//권한 수정
	@Transactional
	public boolean editRole(RoleRequest crr) {
		RoleDto roleDto = new RoleDto(crr.getRoleId(), crr.getRoleName(), crr.isRoleEnabled(), crr.isRoleRemovable());
		//권한 정보 수정하기
		roleDao.updateRoleDetail(roleDto);
		//권한에 해당하는 메뉴, 게시물 정보 삭제하기
		roleDao.deleteRoleBoardList(roleDto.getRoleId());
		roleDao.deleteRoleMenuList(roleDto.getRoleId());
		//새로운 권한 및 게시물 정보 넣어주기
		insertRoleMenuAuth(roleDto.getRoleId(), crr.getMenuList());
		insertRoleBoardAuth(roleDto.getRoleId(), crr.getBoardList());
		return true;
	}
	//=============================================================================
	//관리자 관리
	
	//최종 접속일 업데이트
	public void updateLoginDate(String name) {
		roleDao.updateLoginDate(name);
	}
	//권한/팀 목록 가져오기
	public List<RoleDto> getExistingRole() {
		List<RoleDto> roleList = roleDao.selectRoleListForManager();
		return roleList;
	}
	public List<TeamDto> getTeamList() {
		List<TeamDto> teamList = roleDao.selectTeamListForManager();
		return teamList;
	}
	//Id, Email 존재 여부파악
	public Boolean isThisLineExistInDb(int ctg, String line) {
		int selectedRow = roleDao.selectIsLineExist(ctg, line);
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
		roleDao.insertAdmin(admin);
		
		@SuppressWarnings("unchecked")
		List<Integer> roleList = (List<Integer>) data.get("roleList");
		
		if(!roleList.isEmpty()) {
			for(int roleId : roleList) {
				roleDao.insertAdminRole(admin.getAdmNo(), roleId);
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
		int totalRows = roleDao.selectManagerCnt(searchIndex);
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		searchIndex.setPager(pager);
		model.addAttribute("searchIndex", searchIndex);
		
		List<AdminDto> admList = roleDao.selectAdminList(searchIndex);
		for(AdminDto adm : admList) {
			TeamDto team = roleDao.selectTeamByTeamId(adm.getAdmTeam());
			adm.setTeam(team);
		}
		model.addAttribute("admList", admList);
	}
	//---------------상세 조회
	public void getManagerDetail(Model model, String detailId) {
		AdminDto admin = roleDao.selectManagerDetail(Integer.parseInt(detailId));
		List<RoleDto> roleList = getExistingRole();
		List<TeamDto> teamList = getTeamList();
		
		List<Integer> manageRole = roleDao.selectRoleListByAdminId(Integer.parseInt(detailId));
		
		model.addAttribute("manageRole", manageRole);
		model.addAttribute("roleList", roleList);
		model.addAttribute("teamList", teamList);
		model.addAttribute("admin", admin);
	}
	//------------------관리자 정보 수정
	@Transactional
	public void editManager(AdminRequest ar) {
		Map<String, Object> data = handlingAdminRequestData(ar);
		AdminDto admin = (AdminDto) data.get("admin");
		roleDao.updateManagerDetail(admin);
		
		@SuppressWarnings("unchecked")
		List<Integer> roleList = (List<Integer>) data.get("roleList");
		
		roleDao.deleteManagerRole(admin.getAdmNo());
		
		if(!roleList.isEmpty()) {
			for(int roleId : roleList) {
				//관리자 별 권한 목록 추가
				roleDao.insertAdminRole(admin.getAdmNo(), roleId);
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
