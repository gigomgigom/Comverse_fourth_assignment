package com.comverse.fourthsubject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AdminDto {
	private int admNo;
	private String admName;
	private String admId;
	private String admPw;
	private String admTel;
	private String admEmail;
	private String admStts;
	private int admTeam;
	private Date regDate;
	private boolean admEnabled;
	private Date loginDate;
	
	private TeamDto team;
}
