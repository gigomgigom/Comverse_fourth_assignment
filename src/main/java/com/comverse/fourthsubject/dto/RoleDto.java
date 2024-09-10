package com.comverse.fourthsubject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class RoleDto {
	private int roleId;
	private String roleName;
	private boolean roleEnabled;
	private boolean roleRemovable;
	private Date regDate;
	
	public RoleDto() {}
	
	public RoleDto(int roleId, String roleName, boolean roleEnabled, boolean roleRemovable) {
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleEnabled = roleEnabled;
		this.roleRemovable = roleRemovable;
	}
}
