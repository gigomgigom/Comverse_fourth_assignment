package com.comverse.fourthsubject.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BizDto {
	private int prId;
	private int brId;
	private String location;
	private int writingCheck;
	private boolean writing;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date exposeStart;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date exposeEnd;
	private Date regDate;
	
	private List<String> dateList;
	
	private List<BizSchDto> bizSchList;
}
