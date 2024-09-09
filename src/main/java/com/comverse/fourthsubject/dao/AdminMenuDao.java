package com.comverse.fourthsubject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.AdminMenuDto;

@Mapper
public interface AdminMenuDao {
	
	//권한 관리 - 생성, 수정 - 메뉴 목록 조회
	public List<AdminMenuDto> selectMenuList();
	
}
