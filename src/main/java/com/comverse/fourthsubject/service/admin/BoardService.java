package com.comverse.fourthsubject.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comverse.fourthsubject.dao.BoardCtgDao;
import com.comverse.fourthsubject.dto.BoardCtgDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
	
	@Autowired
	private BoardCtgDao boardCtgDao;
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
	
}
