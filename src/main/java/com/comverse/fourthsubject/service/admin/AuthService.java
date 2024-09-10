package com.comverse.fourthsubject.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dao.AdminMenuDao;
import com.comverse.fourthsubject.dao.BoardCtgDao;
import com.comverse.fourthsubject.dao.RoleDao;
import com.comverse.fourthsubject.dto.AdminMenuDto;
import com.comverse.fourthsubject.dto.BoardCtgDto;
import com.comverse.fourthsubject.dto.RoleDto;
import com.comverse.fourthsubject.dto.nondb.CreateRoleRequest;

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
	public boolean createRole(CreateRoleRequest crr) {
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
	
}
