package com.comverse.fourthsubject.dto.nondb;

import java.util.List;

import lombok.Data;

@Data
public class CreateRoleRequest {
	
	private String roleName;
	private boolean roleEnabled;
	private boolean roleRemovable;
	private List<Integer> menuList;
	private List<Integer> boardList;
	private boolean isBoardEnabled;
	
}
