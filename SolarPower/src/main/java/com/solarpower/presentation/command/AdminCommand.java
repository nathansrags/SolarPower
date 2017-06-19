package com.solarpower.presentation.command;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import com.solarpower.presentation.model.SecurityRole;
import com.solarpower.presentation.model.UserDetails;

public class AdminCommand extends BaseCommand {

	@NotEmpty(message = "Username cannot be empty")
	@NotBlank
	@Size(min=2, max=30)
	private String username;

	@NotEmpty(message = "firstName cannot be empty")
	@NotNull(message = "firstName cannot be empty")
	private String firstName;

	@NotEmpty(message = "lastName cannot be empty")
	@NotNull(message = "firstName cannot be empty")
	private String lastName;

	@NotEmpty(message = "password cannot be empty")
	@NotNull(message = "password cannot be empty")
	private String password;

	@NotEmpty(message = "confirmPassword cannot be empty")
	@NotNull(message = "confirmPassword cannot be empty")
	private String confirmPassword;

	private Date dateOfBirth;

	private List<UserDetails> userDetailsList;

	private UserDetails userDetails;

	private String successMsg;

	private String id;

	private List<SecurityRole> securityRole;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public List<UserDetails> getUserDetailsList() {
		return userDetailsList;
	}

	public void setUserDetailsList(List<UserDetails> userDetailsList) {
		this.userDetailsList = userDetailsList;
	}

	public String getSuccessMsg() {
		return successMsg;
	}

	public void setSuccessMsg(String successMsg) {
		this.successMsg = successMsg;
	}

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<SecurityRole> getSecurityRole() {
		return securityRole;
	}

	public void setSecurityRole(List<SecurityRole> securityRole) {
		this.securityRole = securityRole;
	}

}
