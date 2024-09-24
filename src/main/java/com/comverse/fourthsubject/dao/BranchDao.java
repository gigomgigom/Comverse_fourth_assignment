package com.comverse.fourthsubject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.BranchDto;
import com.comverse.fourthsubject.dto.SubBranchDto;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

@Mapper
public interface BranchDao {
	//지국 목록 조회
	int selectRowCnt(SearchIndex searchIndex);
	List<BranchDto> selectBranchList(SearchIndex searchIndex);
	//지국 생성
	void insertBranch(BranchDto branch);
	void insertSubBranch(SubBranchDto subBranch);
	//지국 상세 조회
	BranchDto selectBranchDetail(int brId);
	List<SubBranchDto> selectSubBranchList(int brId);
	//지국 정보 수정
	void updateBranch(BranchDto branch);
	void deleteSubBranch(int brId);
	
	//사업설명회 검색을 위한 지부 목록 가져오기
	List<BranchDto> selectBranchListForSearch();

}
