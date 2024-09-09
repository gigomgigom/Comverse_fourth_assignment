package com.comverse.fourthsubject.dto;

import lombok.Data;

@Data
public class BoardCtgDto {
	private int ctgId;
	private String ctgName;
	private int ctgMenu;
	private boolean ctgInUse;
	private boolean newExpose;
	private int exposePeriod;
	private boolean ctgEnabled;
}
