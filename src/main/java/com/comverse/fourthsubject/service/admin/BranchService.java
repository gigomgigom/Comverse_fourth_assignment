package com.comverse.fourthsubject.service.admin;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dao.BranchDao;
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

}
