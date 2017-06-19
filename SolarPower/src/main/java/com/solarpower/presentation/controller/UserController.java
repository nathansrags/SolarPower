package com.solarpower.presentation.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.solarpower.presentation.Constants.WebAppConstants;
import com.solarpower.presentation.command.HomeCommand;
import com.solarpower.presentation.command.PersonalDetailsCommand;

@Controller
@RequestMapping(WebAppConstants.CHANGE_PASSWORD)
public class UserController extends BaseController {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView changePassword(final HttpServletRequest request,
			@ModelAttribute PersonalDetailsCommand personalDetailsCommand,
			@ModelAttribute HomeCommand homeCommand) throws Exception {
		ModelAndView model = new ModelAndView(WebAppConstants.CHANGE_PASSWORD);
		personalDetailsCommand.setUsername(getCurrentUser());
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND, personalDetailsCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		return model;

	}
}
