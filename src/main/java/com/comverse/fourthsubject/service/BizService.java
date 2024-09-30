package com.comverse.fourthsubject.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
	//사업설명회 신청 목록조회
	public void getBizAplList(Model model, SearchIndex searchIndex) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		
		List<BranchDto> branchList = branchDao.selectBranchListForSearch();
		
		int totalRows = bizDao.selectTotalAplRows(searchIndex);
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		searchIndex.setPager(pager);
		
		List<BizAplDto> bizAplInfo = bizDao.selectBizAplList(searchIndex);
		
		List<Map<String, Object>> bizAplList = new ArrayList<>();
		
		for(BizAplDto bizApl : bizAplInfo) {
			Map<String, Object> map = new HashMap<>();
			map.put("branch", branchDao.selectBranchDetail(bizApl.getBrId()).getLocation());
			map.put("bizApl", bizApl);
			
			bizAplList.add(map);
		}
		
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("bizAplList", bizAplList);
		model.addAttribute("branchList", branchList);
		log.info(model.toString());
	}
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
	//사업설명회신청 상세 조회
	public void getBizAplDetail(Model model, SearchIndex searchIndex) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		
		BizAplDto bizApl = bizDao.selectBizAplDetail(Integer.parseInt(searchIndex.getDetailId()));
		BizSchDto bizSch = bizDao.selectBizScheduleBySchId(bizApl.getSchId());
		
		List<BizSchDto> bizSchList = bizDao.selectBizScheduleByPrId(bizApl.getPrId());
		List<Map<String,Object>> dateList = new ArrayList<>();
		for(BizSchDto bs : bizSchList) {
			Map<String, Object> map = new HashMap<>();
			Date date = Date.from(bs.getPrDate().atZone(ZoneId.systemDefault()).toInstant());
			
			map.put("schId", bs.getSchId());
			map.put("prDate", date);
			
			dateList.add(map);
		}
		
		BizDto biz = bizDao.selectBizDetailByPrId(bizApl.getPrId());
		BranchDto branch = branchDao.selectBranchDetail(biz.getBrId());
		Date date = Date.from(bizSch.getPrDate().atZone(ZoneId.systemDefault()).toInstant());
		
		model.addAttribute("dateList", dateList);
		model.addAttribute("bizSch", bizSch);
		model.addAttribute("bizApl", bizApl);
		model.addAttribute("sch", date);
		model.addAttribute("biz", biz);
		model.addAttribute("branch", branch);
		
	}
	//사업설명회신청 수정하기
	public ResponseEntity<?> editBizApply(BizAplDto bizApl) {
		bizDao.updateBizApplyDetail(bizApl);
		return ResponseEntity.ok(null);
	}
	//엑셀 파일 생성 - 사업설명회 목록
	public XSSFWorkbook getBizWorkbook() {
		List<BizDto> bizList = bizDao.selectBizListForExcel();
		
		List<Map<String, Object>> bizResult = new ArrayList<>();
		for(BizDto biz : bizList) {
			Map<String, Object> map = new HashMap<>();
			List<BizSchDto> bizSchList = bizDao.selectBizScheduleByPrId(biz.getPrId());
			biz.setBizSchList(bizSchList);
			
			BranchDto branch = branchDao.selectBranchDetail(biz.getBrId());
			
			map.put("biz", biz);
			map.put("branch", branch.getLocation());
			bizResult.add(map);
		}
		
		XSSFWorkbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("지국(branch)");
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Row dscrptn = sheet.createRow(0);
		dscrptn.createCell(4).setCellValue("기준 일자");
		dscrptn.createCell(5).setCellValue(sdf.format(now));
		
		Row headerRow = sheet.createRow(1);
		headerRow.createCell(0).setCellValue("ID");
		headerRow.createCell(1).setCellValue("지부");
		headerRow.createCell(2).setCellValue("등록일");
		headerRow.createCell(3).setCellValue("진행일자");
		headerRow.createCell(4).setCellValue("상태");
		
		int rowIdx = 2;
		for(Map<String, Object> map : bizResult) {
			Row row = sheet.createRow(rowIdx++);
			BizDto biz = (BizDto) map.get("biz");
			
			row.createCell(0).setCellValue(biz.getPrId());
			row.createCell(1).setCellValue((String) map.get("branch"));
			row.createCell(2).setCellValue(sdf.format(biz.getRegDate()));
			if(!biz.getBizSchList().isEmpty()) {
				row.createCell(3).setCellValue(biz.getBizSchList().get(0).getPrDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"))+" 외"+(biz.getBizSchList().size()-1)+"개");
			}
			row.createCell(4).setCellValue(biz.isWriting() ? "작성중" : "작성완료" );
		}
		
		return workbook;
	}
	//사용자를 위한 사업설명회 목록 가져오기
	public void getBizListForUser(Model model) {
		List<BizDto> bizList = bizDao.selectBizListForApply();
		
		List<Map<String, Object>> result = new ArrayList<>();
		for(BizDto biz : bizList) {
			Map<String, Object> map = new HashMap<>();
			
			List<BizSchDto> bizSchList = bizDao.selectBizScheduleByPrId(biz.getPrId());
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 M월 d일");
			for(BizSchDto bizSch : bizSchList) {
		        String formattedDate = bizSch.getPrDate().format(formatter);

		        // 요일을 한글로 추가
		        String dayOfWeek = bizSch.getPrDate().getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREAN);
		        
		        // 오전/오후 형식
		        String amPm = bizSch.getPrDate().getHour() < 12 ? "오전" : "오후";
		        int hour = bizSch.getPrDate().getHour() % 12 == 0 ? 12 : bizSch.getPrDate().getHour() % 12;
		        String minute = String.format("%02d", bizSch.getPrDate().getMinute());

		        // 포맷하기
		        String str = String.format("%s(%s) %s %d:%s", formattedDate, dayOfWeek, amPm, hour, minute);
		        bizSch.setPrDateStr(str);
			}
			biz.setBizSchList(bizSchList);
			log.info(bizSchList.toString());
			BranchDto branch = branchDao.selectBranchDetail(biz.getBrId());
			
			map.put("branch", branch);
			map.put("biz", biz);
			
			result.add(map);
		}
		
		model.addAttribute("result", result);
		
	}
}
