package com.solarpower.presentation.service;

import java.util.List;

import com.solarpower.presentation.model.SecurityRole;
import com.solarpower.presentation.model.User;
import com.solarpower.presentation.model.UserDetails;
import com.solarpower.presentation.model.UserRole;

public interface AdminService {

	void saveUserDetails(UserDetails userDetails);

	List<UserDetails> getAllUserDetails();

	UserDetails getUserDetailByName(String username);

	void deleteUserDetails(long userDetailsId);

	UserDetails getUserDetailById(long id);

	void saveUser(User user);

	void saveUserRole(UserRole userRole);

	void deleteUserRoleByName(String username);
	
	void deleteUserRoleById(long userRoleId);

	void deleteUserCredentials(String username);

	List<UserDetails> getUserDetailsRoleMap();
	
	List<SecurityRole> getSecurityRoles();
	
	void saveSecurityRole(SecurityRole securityRole);

}
