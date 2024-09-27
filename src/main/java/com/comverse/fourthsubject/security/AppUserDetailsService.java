package com.comverse.fourthsubject.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.comverse.fourthsubject.dao.AuthDao;
import com.comverse.fourthsubject.dto.AdminDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AppUserDetailsService implements UserDetailsService {

	@Autowired
	private AuthDao authDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		AdminDto admin = authDao.selectAdminByAdminId(username);
		if(admin == null) {
			throw new UsernameNotFoundException("사용자가 존재하지않습니다.");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		
		AppUserDetails userDetails = new AppUserDetails(admin, authorities);
		return userDetails;
	}

}
