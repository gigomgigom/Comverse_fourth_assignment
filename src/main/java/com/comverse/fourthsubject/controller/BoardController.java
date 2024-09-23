package com.comverse.fourthsubject.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comverse.fourthsubject.service.admin.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	// 게시판 공통 - 게시글 내 이미지파일 다운로드
	@ResponseBody
	@GetMapping("/download-image/{date}/{fileName}")
	public ResponseEntity<?> boardDownladImage(@PathVariable String date, @PathVariable String fileName) {
		try {
			return boardService.boardDownloadImage(date, fileName);
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}
	// 게시판 공통 - 게시글 내 썸네일이미지 파일 다운로드
	@ResponseBody
	@GetMapping("/download-thumbnail/{id}")
	public ResponseEntity<?> boardDownloadThumnail(@PathVariable String id) {
		int boId = Integer.parseInt(id);
		try {
			return boardService.boardDownloadThumbnailImage(boId);
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}
	// 게시판 공통 - 게시글 내 첨부파일 다운로드
	@ResponseBody
	@GetMapping("/download-attach/{boId}/{fileName}")
	public ResponseEntity<?> boardDownloadAttach(@PathVariable int boId, @PathVariable String fileName) {
		
		return null;
	}
}
