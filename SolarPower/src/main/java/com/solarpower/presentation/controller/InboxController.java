package com.solarpower.presentation.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.solarpower.presentation.Constants.WebAppConstants;
import com.solarpower.presentation.command.HomeCommand;
import com.solarpower.presentation.command.InboxCommand;

@Controller
@RequestMapping(WebAppConstants.SLASH_INBOX)
public class InboxController extends BaseController {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView onLoad(final HttpServletRequest request,@ModelAttribute HomeCommand homeCommand) {
		ModelAndView model = new ModelAndView(WebAppConstants.INBOX);
		InboxCommand inboxCommand = new InboxCommand();
		model.getModelMap().addAttribute(WebAppConstants.INBOX_COMMAND, inboxCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		return model;
	}

}