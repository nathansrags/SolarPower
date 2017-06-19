package com.solarpower.presentation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.solarpower.presentation.Constants.WebAppConstants;
import com.solarpower.presentation.Helpers.AdminHelper;
import com.solarpower.presentation.command.AdminCommand;
import com.solarpower.presentation.command.HomeCommand;
import com.solarpower.presentation.command.SecurityRoleCommand;

@Controller
@RequestMapping(WebAppConstants.SLASH_ADMIN)
public class AdminController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminHelper adminHelper;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView onLoadAdmin(final HttpServletRequest request) {
		ModelAndView model = new ModelAndView(WebAppConstants.ADMIN);
		
		AdminCommand adminCommand= new AdminCommand();
		adminHelper.buildAdminCommand(request,new AdminCommand());
		
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND,adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND,buildHomeCommand(new HomeCommand()));
		return model;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView onLoadAdminPOST(final HttpServletRequest request,@ModelAttribute HomeCommand homeCommand) {
		ModelAndView model = new ModelAndView(WebAppConstants.ADMIN);
		
		AdminCommand adminCommand= new AdminCommand();
		adminHelper.buildAdminCommand(request,new AdminCommand());
		
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND,adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND,buildHomeCommand(homeCommand));
		return model;
	}

	@RequestMapping(value = "/addNewUser", method = RequestMethod.POST)
	public ModelAndView addUser(final HttpServletRequest request,
			@ModelAttribute HomeCommand homeCommand,
			@ModelAttribute AdminCommand adminCommand) throws Exception {
		ModelAndView model = new ModelAndView(WebAppConstants.MODIFY_USER);
		adminHelper.buildAdminCommand(request, adminCommand);
		adminHelper.saveUserCredentialsAndUserRole(adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND, adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		
		return model;
	}
	
	
	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
	public ModelAndView modifyUser(final HttpServletRequest request,@Valid AdminCommand adminCommand
				,@ModelAttribute HomeCommand homeCommand) {
		ModelAndView model = new ModelAndView(WebAppConstants.MODIFY_USER);
		LOGGER.debug("on modify admin user");
		
		adminHelper.showUserDetails(adminCommand);
		adminHelper.buildAdminCommand(request,adminCommand);
		
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND,	adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		return model;
	}
	
	@RequestMapping(value = "/accessRoles", method = RequestMethod.POST)
	public ModelAndView accessRoleUser(final HttpServletRequest request,@Valid AdminCommand adminCommand
				,@ModelAttribute HomeCommand homeCommand) {
		ModelAndView model = new ModelAndView("accessRoles");
		LOGGER.debug("on access role admin user");
		
		adminHelper.showUserDetailsRoleMap(adminCommand);
		adminHelper.buildAdminCommand(request,adminCommand);
		
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND,	adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		return model;
	}
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public ModelAndView deleteUser(final HttpServletRequest request,@Valid AdminCommand adminCommand
				,@ModelAttribute HomeCommand homeCommand) {
		ModelAndView model = new ModelAndView(WebAppConstants.MODIFY_USER);
		LOGGER.debug("on delete admin user");
		System.out.println("in delete user"+adminCommand.getId());
		int nod =adminHelper.parseAndDeleteUser(adminCommand);
		
		adminCommand.setSuccessMsg(nod +" users deleted");
		adminHelper.showUserDetails(adminCommand);
		adminHelper.buildAdminCommand(request,adminCommand);
		
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND,adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND,buildHomeCommand(homeCommand));
		return model;
	}
	
	@RequestMapping(value = "/updateUserRole", method = RequestMethod.POST)
	public ModelAndView updateUserRole(final HttpServletRequest request,@Valid AdminCommand adminCommand
				,@ModelAttribute HomeCommand homeCommand) {
		ModelAndView model = new ModelAndView("accessRoles");
		LOGGER.debug("action on add role admin user");
		adminHelper.addUserRole(adminCommand);
		adminHelper.showUserDetailsRoleMap(adminCommand);
		adminHelper.buildAdminCommand(request,adminCommand);
		
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND,	adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		return model;
	}
	
	@RequestMapping(value = "/deleteUserRole", method = RequestMethod.POST)
	public ModelAndView deleteUserRole(final HttpServletRequest request,@Valid AdminCommand adminCommand
				,@ModelAttribute HomeCommand homeCommand) {
		ModelAndView model = new ModelAndView("accessRoles");
		LOGGER.debug("action on delete role admin user");
		adminHelper.deleteUserRole(adminCommand);
		adminHelper.showUserDetailsRoleMap(adminCommand);
		adminHelper.buildAdminCommand(request,adminCommand);
		
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND,	adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		return model;
	}
	
	@RequestMapping(value = "/manageRoles", method = RequestMethod.POST)
	public ModelAndView manageRoles(final HttpServletRequest request,@Valid AdminCommand adminCommand
				,@ModelAttribute HomeCommand homeCommand,@ModelAttribute SecurityRoleCommand securityRoleCommand) {
		ModelAndView model = new ModelAndView("manageRoles");
		LOGGER.debug("on manage Role list");
		adminHelper.showUserDetailsRoleMap(adminCommand);
		adminHelper.buildAdminCommand(request,adminCommand);
		model.getModelMap().addAttribute("securityRoleCommand",securityRoleCommand);
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND,	adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		return model;
	}
	
	@RequestMapping(value = "/addSecurityRole", method = RequestMethod.POST)
	public ModelAndView addSecurityRole(final HttpServletRequest request,@Valid AdminCommand adminCommand
				,@ModelAttribute HomeCommand homeCommand,@ModelAttribute SecurityRoleCommand securityRoleCommand) {
		ModelAndView model = new ModelAndView("manageRoles");
		LOGGER.debug("on manage Role list");
		adminHelper.showUserDetailsRoleMap(adminCommand);
		adminHelper.addSecurityRole(securityRoleCommand);
		adminHelper.buildAdminCommand(request,adminCommand);
		model.getModelMap().addAttribute("securityRoleCommand",securityRoleCommand);
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND,	adminCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		return model;
	}

}
