package com.comverse.fourthsubject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class InquiryDto {
	
	private int inqId;
	private String title;
	private String field;
	private String name;
	private String tel;
	private String email;
	private String content;
	private boolean agree;
	private Date regDate;
	private String stts;
}
