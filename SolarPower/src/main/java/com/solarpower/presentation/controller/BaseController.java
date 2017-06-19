package com.solarpower.presentation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.solarpower.presentation.Helpers.BaseHelper;
import com.solarpower.presentation.command.BaseCommand;
import com.solarpower.presentation.command.HomeCommand;

@Controller
public class BaseController {

	@Autowired
	private BaseHelper baseHelper;
	
	public BaseCommand buildHomeCommand(final HomeCommand homeCommand){
		BaseCommand command= new BaseCommand();
		command.setUsername(getCurrentUser());
		command.setCurrentPage(homeCommand.getCurrentPage());
		command.setSubMenuSelected(homeCommand.getSubMenuSelected());
		return command;
	}
	
	public String getCurrentUser(){
		return baseHelper.getCurrentUser();
	}
	
}
