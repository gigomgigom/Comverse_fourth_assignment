package com.comverse.fourthsubject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class FaqDto {
	private int faqId;
	private int faqWriter;
	private boolean faqPinned;
	private boolean faqWriting;
	
	private Date exposeStart;
	private String exposeStartSdf;
	
	private Date exposeEnd;
	private String exposeEndSdf;
	
	private String title;
	private String content;
	private Date regDate;
}
