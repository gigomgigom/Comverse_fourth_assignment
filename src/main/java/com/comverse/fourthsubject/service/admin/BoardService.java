package com.comverse.fourthsubject.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.comverse.fourthsubject.dao.BoardCtgDao;
import com.comverse.fourthsubject.dao.BoardDao;
import com.comverse.fourthsubject.dto.BoardAttachDto;
import com.comverse.fourthsubject.dto.BoardCtgDto;
import com.comverse.fourthsubject.dto.BoardDto;
import com.comverse.fourthsubject.dto.nondb.Pager;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
	
	@Autowired
	private BoardCtgDao boardCtgDao;
	@Autowired
	private BoardDao boardDao;
	//게시판 설정-------------------------------------------------------
	//---------------------------------------------------------------
	//목록 조회
	public List<BoardCtgDto> getBoardCtgList() {
		return boardCtgDao.selectBoardCtgList();
	}
	//상세 조회
	public BoardCtgDto getBoardCtgDetail(int ctgId) {
		return boardCtgDao.selectBoardCtgDetail(ctgId);
	}
	//생성
	public int createBoardCtg() {
		return boardCtgDao.insertBoardCtg();
	}
	//수정
	public int editBoardCtg(BoardCtgDto boardCtgDto) {
		return boardCtgDao.updateBoardCtgDetail(boardCtgDto);
	}
	//삭제
	public int removeBoardCtg(int ctgId) {
		return boardCtgDao.updateBoardCtgEnabled(ctgId);
	}
	//게시판 관리-------------------------------------------------------
	//---------------------------------------------------------------
	//게시판 목록 조회
	public void getBoardList(int boCtg, SearchIndex searchIndex, Model model) {
		
		int totalRows = boardDao.selectRowCnt(boCtg, searchIndex);
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		
		searchIndex.setPager(pager);
		List<BoardDto> boardList = boardDao.selectBoardList(boCtg, searchIndex);
		
		for(BoardDto board : boardList) {
			List<BoardAttachDto> boAttachList = boardDao.selectBoardAttachListByBoId(board.getBoId());
			board.setBoAttachList(boAttachList);
		}
		
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boCtg", boCtg);
	}
	
}
