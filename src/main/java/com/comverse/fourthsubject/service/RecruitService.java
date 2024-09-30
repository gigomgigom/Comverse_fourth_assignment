package com.comverse.fourthsubject.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dao.RecruitDao;
import com.comverse.fourthsubject.dto.RecruitDto;
import com.comverse.fourthsubject.dto.nondb.Pager;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RecruitService {
	
	@Autowired
	RecruitDao rcrtDao;
	
	//생성
	public ResponseEntity<?> createJoinCenter(RecruitDto rcrt) {
		rcrtDao.insertJoinCenter(rcrt);
		return ResponseEntity.ok(null);
	}
	//목록
	public void getJoinCenterList(SearchIndex searchIndex, Model model) {
		
		int totalRows = rcrtDao.selectJoinCenterTotalRows(searchIndex);
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		
		searchIndex.setPager(pager);
		
		List<RecruitDto> rcrtList = rcrtDao.selectJoinCenterList(searchIndex);
		
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("rcrtList", rcrtList);
	}
	//상세
	public void getJoinCenterDetail(SearchIndex searchIndex, Model model) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		
		RecruitDto rcrt = rcrtDao.selectJoinCenterDetail(Integer.parseInt(searchIndex.getDetailId()));
		
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("rcrt", rcrt);
	}
	//수정
	public ResponseEntity<?> editJoinCenter(RecruitDto rcrt) {
		rcrtDao.updateJoinCenter(rcrt);
		return ResponseEntity.ok(null);
	}

}
