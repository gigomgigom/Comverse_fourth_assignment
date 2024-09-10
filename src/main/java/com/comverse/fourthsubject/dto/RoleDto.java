package com.comverse.fourthsubject.dto;

import lombok.Data;

@Data
public class RoleDto {
	private int roleId;
	private String roleName;
	private boolean roleEnabled;
	private boolean roleRemovable;
	
	public RoleDto() {}
	
	public RoleDto(int roleId, String roleName, boolean roleEnabled, boolean roleRemovable) {
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleEnabled = roleEnabled;
		this.roleRemovable = roleRemovable;
	}
}
