package com.solarpower.presentation.command;

public class BaseCommand {

	private String username;
	private String tempMsgVariable;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	private String currentPage;
	private String subMenuSelected;

	public String getSubMenuSelected() {
		return subMenuSelected;
	}

	public void setSubMenuSelected(String subMenuSelected) {
		this.subMenuSelected = subMenuSelected;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public String getTempMsgVariable() {
		return tempMsgVariable;
	}

	public void setTempMsgVariable(String tempMsgVariable) {
		this.tempMsgVariable = tempMsgVariable;
	}
}
