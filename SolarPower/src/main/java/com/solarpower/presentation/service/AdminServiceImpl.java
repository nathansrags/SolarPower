package com.solarpower.presentation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.solarpower.presentation.dao.SecurityRoleDao;
import com.solarpower.presentation.dao.UserDao;
import com.solarpower.presentation.dao.UserDetailsDao;
import com.solarpower.presentation.dao.UserRoleDao;
import com.solarpower.presentation.model.SecurityRole;
import com.solarpower.presentation.model.User;
import com.solarpower.presentation.model.UserDetails;
import com.solarpower.presentation.model.UserRole;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {

	@Autowired
	private UserDetailsDao userDetailsDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private UserRoleDao userRoleDao;

	@Autowired
	private SecurityRoleDao securityRoleDao;

	public final void saveUserDetails(final UserDetails userDetails) {
		userDetailsDao.saveUserDetails(userDetails);

	}

	public final List<UserDetails> getAllUserDetails() {
		return userDetailsDao.getAllUserDetails();
	}

	public final UserDetails getUserDetailByName(final String username) {
		return userDetailsDao.getUserDetailByName(username);
	}

	public final void deleteUserDetails(final long userDetailsId) {
		userDetailsDao.deleteUserDetails(userDetailsId);

	}

	public final UserDetails getUserDetailById(final long id) {
		return userDetailsDao.getUserDetailById(id);
	}

	@Override
	public final void saveUser(final User user) {
		userDao.saveUser(user);
	}

	@Override
	public final void saveUserRole(final UserRole userRole) {
		userRoleDao.saveUserRole(userRole);
	}

	@Override
	public final void deleteUserRoleByName(final String username) {
		userRoleDao.deleteUserRole(username);
	}

	@Override
	public final void deleteUserRoleById(final long userRoleId) {
		userRoleDao.deleteUserRoleById(userRoleId);
	}

	@Override
	public final void deleteUserCredentials(final String username) {
		userDao.deleteUserCredentials(username);
	}

	@Override
	public final List<UserDetails> getUserDetailsRoleMap() {
		return userDetailsDao.getUserDetailsRoleMap();
	}

	@Override
	public final List<SecurityRole> getSecurityRoles() {
		return securityRoleDao.getSecurityRoles();
		
	}
	
	@Override
	public final void saveSecurityRole(SecurityRole securityRole){
		securityRoleDao.saveSecurityRole(securityRole);
	}
}
