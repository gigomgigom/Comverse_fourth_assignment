package com.comverse.fourthsubject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.AdminDto;
import com.comverse.fourthsubject.dto.AdminMenuDto;
import com.comverse.fourthsubject.dto.BoardCtgDto;
import com.comverse.fourthsubject.dto.RoleDto;
import com.comverse.fourthsubject.dto.TeamDto;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

@Mapper
public interface AuthDao {
	
	//아이디에 해당하는 PK 번호값 가져오기
	
	
	//Interceptor - 요청 경로에 해당하는 메뉴정보 찾기
	public List<AdminMenuDto> selectMenuIdListByUri(String requestUri);
	//Interceptor - 권한에 해당하는 메뉴/게시판 정보가 있는지 확인
	public int selectRowCntOfBoardWhereRoleId(int menuId, List<Integer> roleIdList);
	public int selectRowCntOfMenuWhereRoleId(int menuId, List<Integer> roleIdList);
	//AOP - 관리자 아이디가 접근 가능한 메뉴 정보 가져오기
	public List<AdminMenuDto> selectMenuListByAdmId(String admId);
	//AOP - 관리자 아이디가 접근 가능한 게시판 정보 가져오기
	public List<BoardCtgDto> selectBoardListByAdmId(String admId);
	//login
	public AdminDto selectAdminByAdminId(String username);
	//권한 관리 - 생성, 수정 - 메뉴 목록 조회
	public List<AdminMenuDto> selectMenuList();
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
	
	//관리자 - 최종 접속일 업데이트
	public void updateLoginDate(String name);
	//관리자 관리 - 권한/팀 목록 가져오기
	public List<RoleDto> selectRoleListForManager();
	public List<TeamDto> selectTeamListForManager();
	//관리자 관리 - DB에 존재하는 아이디/이메일인지 체크
	public int selectIsLineExist(int ctg, String line);
	//관리자 관리 - 관리자 및 관리자의 권한 삽입
	public void insertAdmin(AdminDto admin);
	public void insertAdminRole(int admNo, int roleId);
	//관리자 관리 - 검색한 관리자의 수를 조회
	public int selectManagerCnt(SearchIndex searchIndex);
	//관리자 관리 - 검색결과(관리자 목록) 조회
	public List<AdminDto> selectAdminList(SearchIndex searchIndex);
	//관리자 관리 - 리스트 요소 별 팀 정보 가져오기
	public TeamDto selectTeamByTeamId(int admTeam);
	//관리자 관리 - 관리자 번호에 해당하는 관리자의 상세 정보 조회
	public AdminDto selectManagerDetail(int admNo);
	//관리자 관리 - 관리자 번호에 해당하는 관리자의 권한 목록 가져오기
	public List<Integer> selectRoleListByAdminId(int admNo);
	//관리자 관리 - 관리자 상세 정보 변경
	public void updateManagerDetail(AdminDto admin);
	//관리자 관리 - 관리자의 권한 목록 일괄 삭제
	public void deleteManagerRole(int admNo);
	
}
