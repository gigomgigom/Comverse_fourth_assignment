package com.comverse.fourthsubject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDto {
	private int replyId;
	private int boId;
	private String content;
	private Date regDate;
	private String anonWriter;
	private String anonPw;
	private boolean rply_enabled;
}
