package com.comverse.fourthsubject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.FaqDto;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

@Mapper
public interface FaqDao {
	
	//생성
	void insertFaq(FaqDto faq);
	//목록 조회
	int selectTotalRowCnt(SearchIndex searchIndex);
	List<FaqDto> selectFaqList(SearchIndex searchIndex);

}
