package com.solarpower.presentation.dao;

import java.util.List;

import com.solarpower.presentation.model.UserDetails;

public interface UserDetailsDao {

	public void saveUserDetails(UserDetails userDetails);
	
	public List<UserDetails> getAllUserDetails();
	
	public UserDetails getUserDetailByName(String username);
	
	public void deleteUserDetails(long userDetailsId);
	
	public UserDetails getUserDetailById(long id);
	
	public List<UserDetails> getUserDetailsRoleMap();

}
