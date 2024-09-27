package com.comverse.fourthsubject.service.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dao.BranchDao;
import com.comverse.fourthsubject.dto.BoardDto;
import com.comverse.fourthsubject.dto.BranchDto;
import com.comverse.fourthsubject.dto.SubBranchDto;
import com.comverse.fourthsubject.dto.nondb.Pager;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BranchService {
	
	@Autowired
	BranchDao branchDao;
	
	//지국 목록 조회
	public void getBranchList(Model model, SearchIndex searchIndex) {
		int totalRows = branchDao.selectRowCnt(searchIndex);
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		searchIndex.setPager(pager);
		
		List<BranchDto> branchList = branchDao.selectBranchList(searchIndex);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("branchList", branchList);
	}
	
	//지국 생성
	@Transactional
	public ResponseEntity<?> createBranch(BranchDto branch) {
		branchDao.insertBranch(branch);
		
		if(branch.getSubBranchRq() != null && !branch.getSubBranchRq().isEmpty()) {
			createSubBranch(branch);
		}
		
		return ResponseEntity.ok(null);
	}
	//지국 산하 학습센터 생성
	public void createSubBranch(BranchDto branch) {
		SubBranchDto subBranch;
		for(String subBranchRq : branch.getSubBranchRq()) {
			StringTokenizer st = new StringTokenizer(subBranchRq, "_");
			subBranch = new SubBranchDto();
			subBranch.setSubName(st.nextToken());
			subBranch.setSubAdr(st.nextToken());
			subBranch.setBrId(branch.getBrId());
			
			branchDao.insertSubBranch(subBranch);
		}	
	}
	//지국 상세 정보 조회
	public void getBranchDetail(Model model, SearchIndex searchIndex) {
		BranchDto branch = branchDao.selectBranchDetail(Integer.parseInt(searchIndex.getDetailId()));
		
		List<SubBranchDto> subBranchList = branchDao.selectSubBranchList(Integer.parseInt(searchIndex.getDetailId()));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		
		model.addAttribute("branch", branch);
		model.addAttribute("subBranchList", subBranchList);
		model.addAttribute("searchIndex", searchIndex);
	}
	//지국 정보 수정하기
	@Transactional
	public ResponseEntity<?> editBranch(BranchDto branch) {
		branchDao.updateBranch(branch);
		branchDao.deleteSubBranch(branch.getBrId());
		
		if(branch.getSubBranchRq() != null && !branch.getSubBranchRq().isEmpty()) {
			createSubBranch(branch);
		}
		return ResponseEntity.ok(null);
	}
	//다른 서비스에서 사용 - 지국 목록 가져오기
	public List<BranchDto> getBranchListForOther() {
		return branchDao.selectBranchListForSearch();
	}
	
	//지국 목록 엑셀 생성
	public XSSFWorkbook getBranchWorkbook() {
		
		List<BranchDto> branchList = branchDao.selectBranchListForExcel();
		
		XSSFWorkbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("지국(branch)");
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Row dscrptn = sheet.createRow(0);
		dscrptn.createCell(4).setCellValue("기준 일자");
		dscrptn.createCell(5).setCellValue(sdf.format(now));
		
		Row headerRow = sheet.createRow(1);
		headerRow.createCell(0).setCellValue("ID");
		headerRow.createCell(1).setCellValue("위치명");
		headerRow.createCell(2).setCellValue("전화");
		headerRow.createCell(3).setCellValue("등록일");
		headerRow.createCell(4).setCellValue("상태");
		
		int rowIdx = 2;
		for(BranchDto branch : branchList) {
			Row row = sheet.createRow(rowIdx++);
			
			row.createCell(0).setCellValue(branch.getBrId());
			row.createCell(1).setCellValue(branch.getLocation());
			row.createCell(2).setCellValue(branch.getTel());
			row.createCell(3).setCellValue(sdf.format(branch.getRegDate()));
			row.createCell(4).setCellValue(branch.getStts().equals("작성중") ? "비활성" : "활성");
		}
		
		return workbook;
	}

}
