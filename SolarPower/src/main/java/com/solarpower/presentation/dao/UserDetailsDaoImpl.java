package com.solarpower.presentation.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solarpower.presentation.model.SecurityRole;
import com.solarpower.presentation.model.UserDetails;
import com.solarpower.presentation.model.UserRole;

@Repository("userDetailsDao")
public class UserDetailsDaoImpl implements UserDetailsDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveUserDetails(UserDetails userDetails) {
		sessionFactory.getCurrentSession().saveOrUpdate(userDetails);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserDetails> getAllUserDetails() {
		return (List<UserDetails>) sessionFactory.getCurrentSession()
				.createCriteria(UserDetails.class).list();
	}

	@Override
	@SuppressWarnings("unchecked")
	public UserDetails getUserDetailByName(String username) {
		List<Object> returnList= sessionFactory.getCurrentSession().createQuery(" from UserDetails where username='"+username+"'").list();
		Object obj;
		if (returnList.size() > 0) {
			obj = returnList.get(0);
		} else {
			obj = null;
		}
		return (UserDetails) obj;
	}

	@Override
	public void deleteUserDetails(long userDetailsId) {
		sessionFactory.getCurrentSession().createQuery("DELETE from UserDetails where userDetailsId =" + userDetailsId  ).executeUpdate();

	}
	
	@Override
	@SuppressWarnings("unchecked")
	public UserDetails getUserDetailById(long id){
		List<Object> returnList = sessionFactory.getCurrentSession().createQuery(" from UserDetails where userDetailsId="+id).list();
		Object obj;
		if(returnList.size()>0){
			obj= returnList.get(0);
		}else{
			obj=null;
		}
		return (UserDetails)obj;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<UserDetails> getUserDetailsRoleMap() {
		List<UserDetails> userDetailsList = new ArrayList<UserDetails>();
		StringBuilder appender = new StringBuilder();
		appender.append("select ud.USER_DETAILS_ID,ud.USERNAME,ud.FIRST_NAME, ");
		appender.append("ud.LAST_NAME,ud.DOB,ud.CREATED_USER,ud.CREATED_DATE, ");
		appender.append("ud.UPDATED_USER,ud.UPDATED_DATE,group_concat(UR.role separator ',') as USER_ROLE, ");
		appender.append("group_concat(UR.user_role_id separator ',') as user_role_id ");
		appender.append("from user_roles UR, user_details ud where ");
		appender.append("ud.username = ur.username group by ud.USER_DETAILS_ID ");
		final String roleMapQuery = appender.toString();
		//System.out.println("Query "+appender.toString());
		List<Object[]> returnList = sessionFactory.getCurrentSession().createSQLQuery(roleMapQuery).list();
		Iterator<Object[]> iter = returnList.iterator();
		Object[] result = null;
		while(iter.hasNext())
		{
			result = (Object[]) iter.next();
			UserDetails userDetails= new UserDetails();
			userDetails.setUserDetailsId(Long.valueOf(result[0].toString()));
			userDetails.setUsername(result[1].toString());
			userDetails.setFirstName(result[2].toString());
			userDetails.setLastName(result[3].toString());
			userDetails.setDateOfBirth((Date)result[4]);
			userDetails.setCreatedUser(result[5].toString());
			userDetails.setCreatedDate((Date)result[6]);
			userDetails.setUpdatedUser(result[7].toString());
			userDetails.setUpdatedDate((Date)result[8]);
			List<String> roleList =Arrays.asList((result[9].toString()).split(","));
			List<String> roleIdList = Arrays.asList((result[10].toString()).split(","));
			List<UserRole> userRoles= new ArrayList<UserRole>();
			int i=0;
			for (String string : roleList) {
				UserRole role=new UserRole();
				SecurityRole securityRole = new SecurityRole();
				securityRole.setSecurity_role_cd(string);
				role.setRole(securityRole);
				role.setUserRoleId(Integer.valueOf(roleIdList.get(i)));
				userRoles.add(role);
				userDetails.setSelectedUserRole(string);
				i++;
			}
			userDetails.setUserRole(userRoles);
			userDetailsList.add(userDetails);
		}
		return userDetailsList;
	}
	
}
