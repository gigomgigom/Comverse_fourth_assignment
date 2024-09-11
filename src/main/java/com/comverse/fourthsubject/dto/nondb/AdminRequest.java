package com.comverse.fourthsubject.dto.nondb;

import java.util.List;

import lombok.Data;

@Data
public class AdminRequest {
	private int admNo;
	private String admName;
	private String admId;
	private String admPw;
	private String admTel;
	private String admEmail;
	private int admTeam;
	private String admStts;
	private List<Integer> roleList;
}
