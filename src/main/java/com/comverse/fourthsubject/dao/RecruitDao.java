package com.comverse.fourthsubject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.RecruitDto;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

@Mapper
public interface RecruitDao {
	
	//생성
	void insertJoinCenter(RecruitDto rcrt);
	//목록
	int selectJoinCenterTotalRows(SearchIndex searchIndex);
	List<RecruitDto> selectJoinCenterList(SearchIndex searchIndex);
	//상세
	RecruitDto selectJoinCenterDetail(int rcrtId);
	//수정
	void updateJoinCenter(RecruitDto rcrt);

}
