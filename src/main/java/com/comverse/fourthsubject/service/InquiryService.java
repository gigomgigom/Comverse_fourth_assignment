package com.comverse.fourthsubject.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dao.AuthDao;
import com.comverse.fourthsubject.dao.InquiryDao;
import com.comverse.fourthsubject.dto.AdminDto;
import com.comverse.fourthsubject.dto.InqProgDto;
import com.comverse.fourthsubject.dto.InquiryDto;
import com.comverse.fourthsubject.dto.nondb.Pager;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class InquiryService {
	
	@Autowired
	InquiryDao inqDao;
	@Autowired
	AuthDao authDao;

	//문의 생성
	public ResponseEntity<?> createInquiry(InquiryDto inqDto) {
		
		inqDao.insertInquiry(inqDto);
		return ResponseEntity.ok(null);
	}
	//목록 조회
	public void getInquiryList(SearchIndex searchIndex, Model model) {
		int totalRows = inqDao.selectRowCnt(searchIndex);
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		searchIndex.setPager(pager);
		List<InquiryDto> inqList = inqDao.selectInqList(searchIndex);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("inqList", inqList);
	}
	//상세 조회
	public void getInquiryDetail(Model model, SearchIndex searchIndex) {
		InquiryDto inq = inqDao.selectInqDetailByInqId(Integer.parseInt(searchIndex.getDetailId()));
		List<InqProgDto> inqProgList = inqDao.selectInqProgListByInqId(Integer.parseInt(searchIndex.getDetailId()));
		
		for(InqProgDto inqProg : inqProgList) {
			AdminDto admin = authDao.selectManagerDetail(inqProg.getAdmId());
			inqProg.setAdmName(admin.getAdmName());
			inqProg.setAdmUserName(admin.getAdmId());
		}
		
		model.addAttribute("inquiry", inq);
		model.addAttribute("inqProgList", inqProgList);
	}
	
	//문의처리 이력 생성
	@Transactional
	public ResponseEntity<?> createInqProg(InqProgDto inqProg) {
		AdminDto admin = authDao.selectAdminByAdminId(inqProg.getAdmUserName());
		inqProg.setAdmId(admin.getAdmNo());
		
		inqDao.insertInqProg(inqProg);
		inqDao.updateInquiryStts(inqProg);
		return ResponseEntity.ok(null);
	}
	
	
}
