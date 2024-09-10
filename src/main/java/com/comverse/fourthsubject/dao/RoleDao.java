package com.comverse.fourthsubject.dao;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.RoleDto;

@Mapper
public interface RoleDao {
	
	//권한 생성
	public void insertRole(RoleDto role);
	//메뉴/게시판 권한 정보 생성
	public void insertRoleMenuAuth(int roleId, int menuId);
	public void insertRoleBoardAuth(int roleId, int ctgId);

}
