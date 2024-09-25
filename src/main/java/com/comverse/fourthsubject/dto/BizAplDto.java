package com.comverse.fourthsubject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BizAplDto {
	private int aplId;
	private int schId;
	private int prId;
	private String name;
	private String hopeArea;
	private String age;
	private String channel;
	private String funnel;
	private String funnelSub;
	private boolean agree;
	private Date aplDate;
	private String tel;
}
