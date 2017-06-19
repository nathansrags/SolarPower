package com.solarpower.presentation.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.solarpower.presentation.Constants.WebAppConstants;
import com.solarpower.presentation.Helpers.BaseHelper;
import com.solarpower.presentation.command.HomeCommand;
import com.solarpower.presentation.command.PersonalDetailsCommand;
import com.solarpower.presentation.model.UserDetails;
import com.solarpower.presentation.service.AdminService;

@Controller
@RequestMapping(WebAppConstants.SLASH_PERSONAL_DETAILS)
public class PersonalDetailsController extends BaseController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BaseHelper baseHelper;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView onLoad(HttpServletRequest request,@ModelAttribute HomeCommand homeCommand) {
		ModelAndView model= new ModelAndView(WebAppConstants.PERSONAL_DETAILS);
		PersonalDetailsCommand personalDetailsCommand= new PersonalDetailsCommand();
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND, buildHomeCommand(homeCommand));
		this.getPersonalDetails(personalDetailsCommand);
		model.getModelMap().addAttribute(WebAppConstants.PERSONAL_DETAILS_COMMAND,personalDetailsCommand);
		return model;
	}
	
	
	@RequestMapping(value = "/saveUserDetails", method = RequestMethod.POST)
	public ModelAndView addUser(final HttpServletRequest request,@ModelAttribute PersonalDetailsCommand personalDetailsCommand
				,@ModelAttribute HomeCommand homeCommand) throws Exception {
		ModelAndView model = new ModelAndView(WebAppConstants.PERSONAL_DETAILS);
		
		// method to save user details in user details table
		saveUserDetails(personalDetailsCommand);
		this.getPersonalDetails(personalDetailsCommand);
		model.getModelMap().addAttribute(WebAppConstants.ADMIN_COMMAND,personalDetailsCommand);
		model.getModelMap().addAttribute(WebAppConstants.HOME_COMMAND,buildHomeCommand(homeCommand));
		return model;
	}
	
	public void saveUserDetails(PersonalDetailsCommand personalDetailsCommand) throws Exception {
		adminService.saveUserDetails(this.convertCommandToModel(personalDetailsCommand));
		personalDetailsCommand.setTempMsg("User added successfully");
	}
	
	public UserDetails convertCommandToModel(PersonalDetailsCommand personalDetailsCommand) throws Exception {
		
		UserDetails userDetails = new UserDetails();
		userDetails.setUsername(personalDetailsCommand.getUsername());
		System.out.println("Username == "+personalDetailsCommand.getUsername());
		userDetails.setFirstName(personalDetailsCommand.getFirstName());
		userDetails.setLastName(personalDetailsCommand.getLastName());
		userDetails.setDateOfBirth(new Date());
		
		if (personalDetailsCommand.getUserDetailsId() != 0) {
			userDetails.setUserDetailsId(personalDetailsCommand
					.getUserDetailsId());
		}
		System.out.println(personalDetailsCommand.getUserDetailsId());
		Calendar calendar= Calendar.getInstance();
		SimpleDateFormat sdf= new SimpleDateFormat("MM/dd/yyyy");
		String createdDate = sdf.format(calendar.getTime());
		userDetails.setCreatedDate(sdf.parse(createdDate));
		userDetails.setCreatedUser(baseHelper.getCurrentUser());
		userDetails.setUpdatedUser(baseHelper.getCurrentUser());
		userDetails.setUpdatedDate(sdf.parse(createdDate));
		return userDetails;

	}
	
	private void getPersonalDetails(PersonalDetailsCommand personalDetailsCommand){
		
		UserDetails userDetails = adminService.getUserDetailByName(getCurrentUser());
		personalDetailsCommand.setUsername(getCurrentUser());
		if (userDetails != null) {
			personalDetailsCommand.setUsername(userDetails.getUsername());
			personalDetailsCommand.setFirstName(userDetails.getFirstName());
			personalDetailsCommand.setLastName(userDetails.getLastName());
			personalDetailsCommand.setDateOfBirth(userDetails.getDateOfBirth());
			personalDetailsCommand.setCreatedDate(userDetails.getCreatedDate());
			personalDetailsCommand.setCreatedUser(userDetails.getCreatedUser());
			personalDetailsCommand.setUpdatedUser(userDetails.getUpdatedUser());
			personalDetailsCommand.setUpdatedDate(userDetails.getUpdatedDate());
			personalDetailsCommand.setUserDetailsId(userDetails.getUserDetailsId());
		}else{
			personalDetailsCommand.setTempMsg("NO DATA");
		}
	}
	
}
