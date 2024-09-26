package com.comverse.fourthsubject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.InqProgDto;
import com.comverse.fourthsubject.dto.InquiryDto;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

@Mapper
public interface InquiryDao {
	
	//생성
	void insertInquiry(InquiryDto inqDto);
	//목록 조회
	int selectRowCnt(SearchIndex searchIndex);
	List<InquiryDto> selectInqList(SearchIndex searchIndex);
	//상세 조회
	InquiryDto selectInqDetailByInqId(int inqId);
	List<InqProgDto> selectInqProgListByInqId(int inqId);
	//문의 처리 이력 생성
	void insertInqProg(InqProgDto inqProg);
	void updateInquiryStts(InqProgDto inqProg);

}
