package com.solarpower.presentation.Helpers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.solarpower.presentation.command.AdminCommand;
import com.solarpower.presentation.command.SecurityRoleCommand;
import com.solarpower.presentation.model.SecurityRole;
import com.solarpower.presentation.model.User;
import com.solarpower.presentation.model.UserDetails;
import com.solarpower.presentation.model.UserRole;
import com.solarpower.presentation.service.AdminService;

@Component
public class AdminHelper extends BaseHelper{

	@Autowired
	private AdminService adminService;
	
	public final void saveUserDetails(final AdminCommand adminCommand) throws Exception {
		adminService.saveUserDetails(this.convertCommandToModel(adminCommand));
		adminCommand.setSuccessMsg("User added successfully");
	}

	public final void saveUserCredentialsAndUserRole(final AdminCommand adminCommand) throws Exception {
		User user= new User();
		user.setUsername(adminCommand.getUsername());
		user.setPassword(adminCommand.getPassword());
		user.setEnabled(true);
		UserRole userRole=new UserRole();
		SecurityRole securityRole =new SecurityRole();
		securityRole.setSecurity_role_cd("ROLE_USER");
		securityRole.setSecurity_role_nm("ROLE_USER");
		securityRole.setSecurity_role_desc("ROLE_USER");
		userRole.setUser(user);
		userRole.setRole(securityRole);
		adminService.saveUser(user);
		adminService.saveUserRole(userRole);
		showUserDetails(adminCommand);
	}
	
	
	public final void deleteUser(final long id,final AdminCommand adminCommand) {
		
		UserDetails userDetails =adminService.getUserDetailById(id);
		//delete user role details - child table
		adminService.deleteUserRoleByName(userDetails.getUsername());
		//delete user credentials - parent table
		adminService.deleteUserCredentials(userDetails.getUsername());
		//delete records in user details table
		adminService.deleteUserDetails(id);
	}
	
	public final void showUserDetails(final AdminCommand adminCommand){
		adminCommand.setUserDetailsList(adminService.getAllUserDetails());
	}
	
	public final void showUserDetailsRoleMap(final AdminCommand adminCommand){
		adminCommand.setUserDetailsList(adminService.getUserDetailsRoleMap());
		adminCommand.setSecurityRole(adminService.getSecurityRoles());
	}
	
	public final void getUserDetails(final AdminCommand adminCommand){
		adminCommand.setUserDetails(adminService.getUserDetailByName(adminCommand.getUsername()));
	}
	
	public final void addUserRole(final AdminCommand adminCommand) {
		String ids = adminCommand.getId().toString();
		String[] roleAndUser = ids.split(";");
		String userName = roleAndUser[1].toString();
		String roles = roleAndUser[0].toString();
		String[] roleArray = roles.split(",");
		for (final String role : roleArray) {
			User user = new User();
			SecurityRole securityRole =new SecurityRole();
			securityRole.setSecurity_role_cd(role);
			securityRole.setSecurity_role_nm(role);
			securityRole.setSecurity_role_desc(role);
			user.setUsername(userName);
			UserRole userRole = new UserRole();
			userRole.setUser(user);
			userRole.setRole(securityRole);
			userRole.setUser(user);
			try {
				adminService.saveUserRole(userRole);
			} catch (ConstraintViolationException ce) {
				adminCommand.setSuccessMsg("User role already Exits");
			}
		}
	}

	public final void deleteUserRole(final AdminCommand adminCommand) {
		String ids = adminCommand.getId().toString();
		String[] id = ids.split(",");
		for (String individualId : id) {
			// delete user role details - child table
			adminService.deleteUserRoleById(Long.parseLong(individualId));
		}
	}
	
	public final AdminCommand convertModelToCommand(final UserDetails userDetails) {
		AdminCommand adminCommand = new AdminCommand();
		adminCommand.setUsername(userDetails.getUsername());
		adminCommand.setFirstName(userDetails.getFirstName());
		adminCommand.setLastName(userDetails.getLastName());
		return adminCommand;
	}

	public final UserDetails convertCommandToModel(final AdminCommand adminCommand) throws Exception {
		UserDetails userDetails = new UserDetails();
		userDetails.setUsername(adminCommand.getUsername());
		userDetails.setFirstName(adminCommand.getFirstName());
		userDetails.setLastName(adminCommand.getLastName());
		userDetails.setDateOfBirth(new Date());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		userDetails.setCreatedUser(auth.getName());
		Calendar calendar= Calendar.getInstance();
		SimpleDateFormat sdf= new SimpleDateFormat("MM/dd/yyyy");
		String createdDate = sdf.format(calendar.getTime());
		userDetails.setCreatedDate(sdf.parse(createdDate));
		userDetails.setUpdatedUser(auth.getName());
		userDetails.setUpdatedDate(sdf.parse(createdDate));
		return userDetails;

	}
	
	public final int parseAndDeleteUser(final AdminCommand adminCommand){
		String ids =adminCommand.getId().toString();
		String[] id = ids.split(",");
		for(String individualId:id){
			deleteUser(Long.parseLong(individualId),adminCommand);
		}
		return id.length;
	}

	public void addSecurityRole(final SecurityRoleCommand securityRoleCommand){
		try{
		adminService.saveSecurityRole(convertSecurityRoleCommandToSecurityRole(securityRoleCommand));
		}catch(ConstraintViolationException exception){
			securityRoleCommand.setTempMsgVariable("ROLE Already Exists");
		}
		
	}
	
	private SecurityRole convertSecurityRoleCommandToSecurityRole(SecurityRoleCommand securityRoleCommand){
		SecurityRole securityRole = new SecurityRole();
		securityRole.setSecurity_role_nm(securityRoleCommand.getSecurityRoleNm());
		securityRole.setSecurity_role_cd(securityRoleCommand.getSecurityRoleCd());
		securityRole.setSecurity_role_desc(securityRoleCommand.getSecurityRoleDesc());
		return securityRole;
	}
	public void buildAdminCommand(final HttpServletRequest request,final AdminCommand adminCommand){
		
	}
}
