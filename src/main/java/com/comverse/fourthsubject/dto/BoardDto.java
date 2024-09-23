package com.comverse.fourthsubject.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardDto {
	
	private int boId;
	private int boCtg;
	private int boWriter;
	private String boTitle;
	private boolean boPinned;
	private boolean boReplyable;
	private boolean boWriting;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date exposeStart;
	private String exposeStartSdf;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date exposeEnd;
	private String exposeEndSdf;
	private String content;
	private Date regDate;
	private int hitCnt;
	private boolean boEnabled;
	private String boThumbnail;
	
	//게시물의 첨부파일 갯수
	private int attachCnt;
	//게시물의 첨부파일 목록
	private List<BoardAttachDto> boAttachList;
	
}
