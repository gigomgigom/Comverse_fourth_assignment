package com.comverse.fourthsubject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class RecruitDto {
	private int rcrtId;
	private String name;
	private String field;
	private String tel;
	private String birthDate;
	private String location;
	private String adr;
	private boolean agree;
	private String sex;
	private String email;
	private Date regDate;
}
