package com.solarpower.presentation.Helpers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 * @author Gopinathan_Gopal
 *
 */
@Component
public class BaseHelper {

	/**
	 * @return
	 */
	public String getCurrentUser(){
		final Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return auth.getName();
	}
}
