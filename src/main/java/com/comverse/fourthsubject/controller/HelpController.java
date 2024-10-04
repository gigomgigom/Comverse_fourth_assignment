package com.comverse.fourthsubject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comverse.fourthsubject.dto.BranchDto;
import com.comverse.fourthsubject.service.BranchService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/help")
public class HelpController {
	
	@Autowired
	BranchService branchService;
	
	//지국위치 안내
	@GetMapping("/location")
	public String location(Model model) {
		List<BranchDto> branchList = branchService.getBranchListForOther();
		model.addAttribute("branchList", branchList);
		return "/user/help/help_location";
	}
	
	//지국 위치 안내 REST-API
	@ResponseBody
	@GetMapping("/get-location-detail")
	public ResponseEntity<?> getLocationDetail(int brId) {
		return branchService.getBranchDetailForUser(brId);
	}
	
	//알려드립니다. 목록
	@GetMapping("/notice-list")
	public String noticeList() {
		return "/user/help/help_notice_list";
	}
	
	//알려드립니다. 상세
	@GetMapping("/notice-detail")
	public String noticeDetail() {
		return "/user/help/help_notice_detail";
	}
	
	//1대1
	@GetMapping("/one-to-one")
	public String oneToOne() {
		return "/user/help/help_onetoone";
	}
}
 