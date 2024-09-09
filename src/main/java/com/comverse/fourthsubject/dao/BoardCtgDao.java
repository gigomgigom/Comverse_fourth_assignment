package com.comverse.fourthsubject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.comverse.fourthsubject.dto.BoardCtgDto;

@Mapper
public interface BoardCtgDao {
	//게시판 설정 - DB의 게시판 목록 조회
	public List<BoardCtgDto> selectBoardCtgList();
	//게시판 설정 - 게시판의 상세 정보 조회
	public BoardCtgDto selectBoardCtgDetail(int ctgId);
	//게시판 설정 - 게시판 생성
	public int insertBoardCtg();
	//게시판 설정 - 게시판의 정보 수정
	public int updateBoardCtgDetail(BoardCtgDto boardCtgDto);
	//게시판 설정 - 게시판 삭제
	public int updateBoardCtgEnabled(int ctgId);
	
}
