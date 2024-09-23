package com.comverse.fourthsubject.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BranchDto {
	private int brId;
	private String location;
	private String adr;
	private String stts;
	private String tel;
	private Date regDate;
	
	private List<String> subBranchRq;
}
