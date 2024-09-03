package com.comverse.fourthsubject.dto;

import lombok.Data;

@Data
public class SideBarModel {
	private int firstDepth;
	private int secondDepth;
	
	public SideBarModel(int firstDepth, int secondDepth) {
		this.firstDepth = firstDepth;
		this.secondDepth = secondDepth;
	}
}
