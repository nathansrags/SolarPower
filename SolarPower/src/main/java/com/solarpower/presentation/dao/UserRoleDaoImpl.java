package com.solarpower.presentation.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solarpower.presentation.model.UserRole;

@Repository("userRoleDao")
public class UserRoleDaoImpl implements UserRoleDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveUserRole(UserRole userRole){
		sessionFactory.getCurrentSession().saveOrUpdate(userRole);
	}
	
	@Override
	public void getRoleByUserName(String username){
		sessionFactory.getCurrentSession().createQuery("from UserRole where username="+username);
	}
	
	@Override
	public void deleteUserRole(String username) {
		sessionFactory.getCurrentSession().createQuery("DELETE from UserRole where username='" + username+"'"  ).executeUpdate();

	}
	
	@Override
	public void deleteUserRoleById(long userRoleId) {
		sessionFactory.getCurrentSession().createQuery("DELETE from UserRole where user_role_id='" + userRoleId+"'"  ).executeUpdate();

	}
}
