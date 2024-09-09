package com.comverse.fourthsubject.dto;

import lombok.Data;

@Data
public class RoleDto {
	private int roleId;
	private String roleName;
	private boolean roleEnabled;
	private boolean roleRemovable;
}
