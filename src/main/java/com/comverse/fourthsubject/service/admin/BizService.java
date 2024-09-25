package com.comverse.fourthsubject.service.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dao.BizDao;
import com.comverse.fourthsubject.dao.BranchDao;
import com.comverse.fourthsubject.dto.BizAplDto;
import com.comverse.fourthsubject.dto.BizDto;
import com.comverse.fourthsubject.dto.BizSchDto;
import com.comverse.fourthsubject.dto.BranchDto;
import com.comverse.fourthsubject.dto.nondb.Pager;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BizService {
	
	@Autowired
	BranchService branchService;
	@Autowired
	BizDao bizDao;
	@Autowired
	BranchDao branchDao;
	
	//사업설명회 목록 조회
	public void getBusinessList(SearchIndex searchIndex, Model model) {
		//검색을 위한 지부 목록들을 가져와야함
		List<BranchDto> branchList = branchService.getBranchListForOther();
		int totalRows = bizDao.selectTotalRows(searchIndex);
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		searchIndex.setPager(pager);
		
		List<BizDto> bizList = bizDao.selectBizList(searchIndex);
		for(BizDto biz : bizList) {
			List<BizSchDto> bizSchList = bizDao.selectBizScheduleByPrId(biz.getPrId());
			biz.setBizSchList(bizSchList);
		}
		log.info(bizList.toString());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("bizList", bizList);
		model.addAttribute("branchList", branchList);
	}
	//사업설명회 상세 정보 조회
	public void getBusinessDetail(Model model, SearchIndex searchIndex) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<BranchDto> branchList = branchService.getBranchListForOther();
		
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		
		BizDto biz = bizDao.selectBizDetailByPrId(Integer.parseInt(searchIndex.getDetailId()));
		biz.setBizSchList(bizDao.selectBizScheduleByPrId(Integer.parseInt(searchIndex.getDetailId())));
		
		List<Date> dateList = new ArrayList<>();
		for(BizSchDto bizSch : biz.getBizSchList()) {
			Date date = Date.from(bizSch.getPrDate().atZone(ZoneId.systemDefault()).toInstant());
			dateList.add(date);
		}
		
		BranchDto branch = branchDao.selectBranchDetail(biz.getBrId());
		
		model.addAttribute("dateList", dateList);
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("biz", biz);
		model.addAttribute("branch", branch);
		model.addAttribute("branchList", branchList);
	}
	//사업설명회 생성
	@Transactional
	public ResponseEntity<?> createBizPr(BizDto biz) throws ParseException {
		if(biz.getWritingCheck() == 1) {
			biz.setWriting(true);
		}
		bizDao.insertBizPr(biz);
		createBizSch(biz);
		return ResponseEntity.ok(null);
	}
	//사업설명회 일정 생성
	public void createBizSch(BizDto biz) throws ParseException {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		for(String sch : biz.getDateList()) {
			
			BizSchDto bizSch = new BizSchDto();
			bizSch.setPrId(biz.getPrId());
			bizSch.setPrDate(LocalDateTime.parse(sch, formatter));
			
			bizDao.insertBizSchedule(bizSch);
		}
	}
	//사업설명회 수정
	@Transactional
	public ResponseEntity<?> editBiz(BizDto biz) throws ParseException {
		if(biz.getWritingCheck() == 1) {
			biz.setWriting(true);
		}
		bizDao.updateBizPr(biz);
		bizDao.deleteBizSch(biz.getPrId());
		createBizSch(biz);
		return ResponseEntity.ok(null);
	}
	//---------------------------------------------------------------------------------
	//사업설명회신청 생성 데이터 조회
	public void getBusinessListForApply(Model model) {
		List<BizDto> bizList = bizDao.selectBizListForApply();
		List<Map<String, Object>> bizModelList = new ArrayList<>();
		for(BizDto biz : bizList) {
			Map<String, Object> bizModel = new HashMap<>();
			BranchDto branch = branchDao.selectBranchDetail(biz.getBrId());
			bizModel.put("branch", branch.getLocation());
			bizModel.put("location", biz.getLocation());
			bizModel.put("bizId", biz.getPrId());
			
			bizModelList.add(bizModel);
		}
		model.addAttribute("bizModelList", bizModelList);
	}
	//사업설명회 별 일정 조회
	public ResponseEntity<?> getBizSchForApply(int prId) {
		List<BizSchDto> bizSchList = bizDao.selectBizScheduleByPrId(prId);
		return ResponseEntity.ok(bizSchList);
	}
	//사업설명회신청 생성
	public ResponseEntity<?> createBizApply(BizAplDto bizApl) {
		bizDao.insertBizApply(bizApl);
		return ResponseEntity.ok(null);
	}
}
