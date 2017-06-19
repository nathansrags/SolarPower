package com.solarpower.presentation.dao;

import com.solarpower.presentation.model.User;

public interface UserDao {

	User findByUserName(final String username);
	
	public void saveUser(final User user);
	
	public void deleteUserCredentials(final String username);

}