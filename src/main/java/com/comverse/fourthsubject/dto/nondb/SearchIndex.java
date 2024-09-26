package com.comverse.fourthsubject.dto.nondb;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SearchIndex {
	
	private String detailId;
	
	//노출 여부(노출, 비노출) 0, 1, 2
	private int isExpose;
	//검색 분류 0, 1, 2...
	private int keywordCtg;
	//검색 키워드
	private String keyword;
	//일자 분류 0, 1, 2...
	private int dateCtg;
	//시작 일자
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	
	private String startDateSdf;
	//종료 일자
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;
	
	private String endDateSdf;
	//지역(지부)
	private int location;
	//지역(문자열)
	private String locationStr;
	//상태
	private int stts;
	//분야, 구분
	private int division;
	
	//한 페이지의 행수
	private int rowsPerPage;
	//페이지 번호
	private String pageNo;
	//페이저 객체
	private Pager pager;
	
	//게시판 전용---기타 조건
	private List<Integer> others;
	//설명회 전용---모집 완료 여부
	private int isRecruited;
	//관리자 관리 여부
	private int team;
	
	
}
