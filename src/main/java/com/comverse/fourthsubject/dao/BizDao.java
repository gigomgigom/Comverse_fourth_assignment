package com.comverse.fourthsubject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.BizDto;
import com.comverse.fourthsubject.dto.BizSchDto;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

@Mapper
public interface BizDao {
	//목록 조회하기
	int selectTotalRows(SearchIndex searchIndex);
	List<BizDto> selectBizList(SearchIndex searchIndex);
	List<BizSchDto> selectBizScheduleByPrId(int prId);
	//생성하기
	void insertBizPr(BizDto biz);
	void insertBizSchedule(BizSchDto bizSch);
	//상세 조회
	BizDto selectBizDetailByPrId(int prId);
	//수정하기
	void updateBizPr(BizDto biz);
	void deleteBizSch(int prId);
}
