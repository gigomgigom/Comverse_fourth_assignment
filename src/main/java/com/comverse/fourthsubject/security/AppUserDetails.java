package com.comverse.fourthsubject.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.comverse.fourthsubject.dto.AdminDto;

public class AppUserDetails extends User {
	
	private AdminDto admin;

	public AppUserDetails(AdminDto admin, Collection<? extends GrantedAuthority> authorities) {
		super(admin.getAdmId(), admin.getAdmPw(), admin.isAdmEnabled(), true, true, true, authorities);
		
		this.admin = admin;
	}
	
	public AdminDto getAdminInfo() {
		return admin;
	}

}
