package com.solarpower.presentation.dao;

import com.solarpower.presentation.model.UserRole;

public interface UserRoleDao {

	public void saveUserRole(UserRole userRole);
	
	public void getRoleByUserName(String username);
	
	public void deleteUserRole(String username);
	
	public void deleteUserRoleById(long userRoleId);
}
