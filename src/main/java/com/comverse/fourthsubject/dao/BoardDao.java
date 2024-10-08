package com.comverse.fourthsubject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.BoardAttachDto;
import com.comverse.fourthsubject.dto.BoardDto;
import com.comverse.fourthsubject.dto.ReplyDto;
import com.comverse.fourthsubject.dto.nondb.Pager;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

@Mapper
public interface BoardDao {
	
	//게시물 목록 - 검색 조건에 대한 결과의 수 조회
	public int selectRowCnt(int boCtg, SearchIndex searchIndex);
	//게시물 목록 - 검색 조건에 해당하는 게시물 목록 조회
	public List<BoardDto> selectBoardList(int boCtg, SearchIndex searchIndex);
	//게시물 목록, 수정, 상세 - 주어진 게시물번호에 업로드된 첨부파일 목록 조회
	public List<BoardAttachDto> selectBoardAttachListByBoId(int boId);
	//게시물 생성 - 게시글 생성
	public void insertBoard(BoardDto board);
	//게시물 생성 - 첨부파일 정보 생성
	public void insertBoardAttach(BoardAttachDto boardAttach);
	//게시물 상세 - 게시물 상세 조회
	public BoardDto selectBoardDetailByBoId(int boId);
	//게시물 상세 - 게시물 조회수 1 증가
	public void updateBoardHitCnt(int boId);
	//게시물 수정 - 게시물 정보 수정하기
	public void updateBoardDetail(BoardDto board);
	//게시물 수정 - 게시물 첨부파일 삭제하기
	public void deleteBoardAttach(int boId, List<Integer> selectedSavedAttach);
	//게시물 목록 - 검색조건에 해당하는 목록 엑셀파일 생성
	public List<BoardDto> selectBoardListForExcel(int boCtg);
	
	//사용자 화면 게시물 목록 가져오기
	public int selectRowCntForUser(int boCtg);
	public List<BoardDto> selectBoardListForUser(int boCtg, Pager pager);
	public List<BoardDto> selectPinnedBoardListForUser(int boCtg);
	//사용자 화면 게시물 상세 가져오기
	public BoardDto selectPreBoardByBoId(int boCtg, int boId);
	public BoardDto selectNextBoardByBoId(int boCtg, int boId);
	//첨부파일 정보 가져오기
	public BoardAttachDto selectBoardAttachByAttachId(int attachId);
	//댓글 작성하기
	public void insertBoardReply(ReplyDto reply);
	//댓글 목록 조회
	public List<ReplyDto> selectReplyListByBoId(int boId);
	public void updateReplyEnabled(ReplyDto rqReply);
	public ReplyDto selectReplyDetail(int replyId);

}
