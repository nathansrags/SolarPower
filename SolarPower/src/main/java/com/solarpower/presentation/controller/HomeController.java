package com.solarpower.presentation.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.solarpower.presentation.Constants.WebAppConstants;
import com.solarpower.presentation.command.HomeCommand;

@Controller
@RequestMapping(WebAppConstants.SLASH_HOME)
public class HomeController extends BaseController {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView onLoad(HttpServletRequest request) {
		ModelAndView model = new ModelAndView(WebAppConstants.HOME);
		System.out.println("In Home controller");
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(new HomeCommand()));
		return model;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onLoadPOST(HttpServletRequest request,@ModelAttribute HomeCommand homeCommand) {
		ModelAndView model = new ModelAndView(WebAppConstants.HOME);
		System.out.println("In Home controller"+ homeCommand.getCurrentPage() +" "+ homeCommand.getSubMenuSelected());
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		return model;
	}
}
