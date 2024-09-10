package com.comverse.fourthsubject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.RoleDto;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

@Mapper
public interface RoleDao {
	
	//권한 생성
	public void insertRole(RoleDto role);
	//메뉴/게시판 권한 정보 생성
	public void insertRoleMenuAuth(int roleId, int menuId);
	public void insertRoleBoardAuth(int roleId, int ctgId);
	//권한 검색 결과의 총 갯수
	public int selectRoleCnt(SearchIndex searchIndex);
	//권한 목록 조회
	public List<RoleDto> selectRoleList(SearchIndex searchIndex);
	//권한 상세 정보 조회
	public RoleDto selectRoleDetailById(String detailId);
	//권한 아이디에 허용된 메뉴/게시판 번호 가져오기
	public List<Integer> selectMenuListByRoleId(String detailId);
	public List<Integer> selectBoardListByRoleId(String detailId);
	//권한 정보 수정
	public void updateRoleDetail(RoleDto roleDto);
	//메뉴/게시판 권한 정보 삭제
	public void deleteRoleBoardList(int roleId);
	public void deleteRoleMenuList(int roleId);

}
