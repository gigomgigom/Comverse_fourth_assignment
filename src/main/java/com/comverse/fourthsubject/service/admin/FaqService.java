package com.comverse.fourthsubject.service.admin;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dao.AuthDao;
import com.comverse.fourthsubject.dao.FaqDao;
import com.comverse.fourthsubject.dto.AdminDto;
import com.comverse.fourthsubject.dto.FaqDto;
import com.comverse.fourthsubject.dto.nondb.FaqRequest;
import com.comverse.fourthsubject.dto.nondb.Pager;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FaqService {
	
	@Autowired
	FaqDao faqDao;
	
	@Autowired
	AuthDao authDao;
	
	//목록
	public void getFaqList(Model model, SearchIndex searchIndex) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		
		int totalRows = faqDao.selectTotalRowCnt(searchIndex);
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		searchIndex.setPager(pager);
		
		List<FaqDto> faqList = faqDao.selectFaqList(searchIndex);
		
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("faqList", faqList);
	}
	//상세
	public void getFaqDetail(Model model, SearchIndex searchIndex) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		
		FaqDto faq = faqDao.selectFaqDetail(Integer.parseInt(searchIndex.getDetailId()));
		
		if(faq.getExposeStart() != null) {
			faq.setExposeStartSdf(sdf.format(faq.getExposeStart()));
		}
		if(faq.getExposeEnd() != null) {
			faq.setExposeEndSdf(sdf.format(faq.getExposeEnd()));
		}
		
		AdminDto admin = authDao.selectManagerDetail(faq.getFaqWriter());
		
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("faq", faq);
		model.addAttribute("writer", admin.getAdmId());		
	}
	//생성
	public ResponseEntity<?> createFaq(FaqRequest fr, Authentication auth) {
		FaqDto faq = convertRequestToDto(fr, auth);
		
		faqDao.insertFaq(faq);
		
		return ResponseEntity.ok(null);
	}
	//응답 객체의 값을 이용하여 FaqDto객체 생성 후 반환
	public FaqDto convertRequestToDto(FaqRequest fr, Authentication auth) {
		
		FaqDto faq = new FaqDto();
		faq.setFaqId(fr.getFaqId());
		
		if(auth != null) {
			faq.setFaqWriter(authDao.selectAdminByAdminId(auth.getName()).getAdmNo());
		}
		
		faq.setTitle(fr.getTitle());
		faq.setFaqPinned(fr.getPinned() == 1);
		faq.setFaqWriting(fr.getStts() == 1);
		faq.setExposeStart(fr.getExposeStart());
		faq.setExposeEnd(fr.getExposeEnd());
		faq.setContent(fr.getContent());
		
		return faq;
	}
	//수정
	public ResponseEntity<?> editFaq(FaqRequest fr) {
		FaqDto faq = convertRequestToDto(fr, null);
		
		faqDao.updateFaq(faq);
		
		return ResponseEntity.ok(null);
	}
	
	
	
}
