package com.solarpower.presentation.dao;

import java.util.List;

import com.solarpower.presentation.model.SecurityRole;

public interface SecurityRoleDao {

	public List<SecurityRole> getSecurityRoles();
	
	public void saveSecurityRole(SecurityRole securityRole);
}
