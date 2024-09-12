package com.comverse.fourthsubject.dto.nondb;

import lombok.Data;

@Data
public class SideBarModel {
	private int firstDepth;
	private int secondDepth;
	private int boardDepth;
	
	public SideBarModel(int firstDepth, int secondDepth, int boardDepth) {
		this.firstDepth = firstDepth;
		this.secondDepth = secondDepth;
		this.boardDepth = boardDepth;
	}
}
