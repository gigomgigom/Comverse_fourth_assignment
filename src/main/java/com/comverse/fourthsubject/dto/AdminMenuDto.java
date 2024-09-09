package com.comverse.fourthsubject.dto;

import lombok.Data;

@Data
public class AdminMenuDto {
	private int menuId;
	private String name;
	private int grp;
	private int dpth;
	private int step;
}
