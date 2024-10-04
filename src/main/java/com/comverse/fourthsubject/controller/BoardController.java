package com.comverse.fourthsubject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comverse.fourthsubject.dto.ReplyDto;
import com.comverse.fourthsubject.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/home/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/{boCtg}/list")
	public String getBoardList(@PathVariable int boCtg, String pageNo, Model model) {
		
		boardService.getBoardListForUser(boCtg, pageNo, model);
		
		return "/user/board/list";
	}
	@GetMapping("/{boCtg}/detail")
	public String getBoardDetail(@PathVariable int boCtg, String boId, Model model) {
		
		boardService.getBoardDetailForUser(boCtg, boId, model);
		
		return "/user/board/detail";
	}
	
	@ResponseBody
	@PostMapping("/write_reply")
	public ResponseEntity<?> writeBoardReply(ReplyDto reply) {
		return boardService.writeBoardReply(reply);
	}
	
	@ResponseBody
	@GetMapping("/delete_reply")
	public ResponseEntity<?> deleteBoardReply(ReplyDto reply) {
		return boardService.deleteBoardReply(reply);
	}
}
