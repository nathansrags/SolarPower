package com.solarpower.presentation.command;


public class SecurityRoleCommand extends BaseCommand{

	private long securityRoleId;

	private String securityRoleNm;
	
	private String securityRoleCd;
	
	private String securityRoleDesc;
	
	public long getSecurityRoleId() {
		return securityRoleId;
	}

	public void setSecurityRoleId(long securityRoleId) {
		this.securityRoleId = securityRoleId;
	}

	public String getSecurityRoleNm() {
		return securityRoleNm;
	}

	public void setSecurityRoleNm(String securityRoleNm) {
		this.securityRoleNm = securityRoleNm;
	}

	public String getSecurityRoleCd() {
		return securityRoleCd;
	}

	public void setSecurityRoleCd(String securityRoleCd) {
		this.securityRoleCd = securityRoleCd;
	}

	public String getSecurityRoleDesc() {
		return securityRoleDesc;
	}

	public void setSecurityRoleDesc(String securityRoleDesc) {
		this.securityRoleDesc = securityRoleDesc;
	}
}
