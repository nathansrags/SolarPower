package com.solarpower.presentation.sessioncommand;

public class UserSessionManger {

	private String userName;
	private String password;
	private String loginStatus;
	private String userRoleType;

	public UserSessionManger(String userName, String password,String userRoleType) {
		super();
		this.userName = userName;
		this.password = password;
		this.userRoleType= userRoleType;
	}

	public UserSessionManger() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}

	public String getUserRoleType() {
		return userRoleType;
	}

	public void setUserRoleType(String userRoleType) {
		this.userRoleType = userRoleType;
	}

}
