package com.comverse.fourthsubject.dto.nondb;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FaqRequest {
	private int faqId;
	private String title;
	private int pinned;
	private int replyable;
	private int stts;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date exposeStart;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date exposeEnd;
	private String content;
}
