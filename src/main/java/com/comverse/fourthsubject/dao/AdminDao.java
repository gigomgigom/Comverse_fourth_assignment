package com.comverse.fourthsubject.dao;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.AdminDto;

@Mapper
public interface AdminDao {

	public AdminDto selectAdminByAdminId(String username);

}
