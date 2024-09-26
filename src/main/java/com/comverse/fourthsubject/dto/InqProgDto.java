package com.comverse.fourthsubject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class InqProgDto {
	
	private int logId;
	private int inqId;
	private int admId;
	private String admName;
	private String admUserName;
	private String content;
	private String stts;
	private Date regDate;
}
