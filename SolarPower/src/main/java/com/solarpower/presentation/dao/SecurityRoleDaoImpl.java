package com.solarpower.presentation.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solarpower.presentation.model.SecurityRole;

@Repository("securityRoleDao")
public class SecurityRoleDaoImpl implements SecurityRoleDao {
	
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SecurityRole> getSecurityRoles() {
		return (List<SecurityRole>) sessionFactory.getCurrentSession()
				.createCriteria(SecurityRole.class).list();
	}
	
	@Override
	public void saveSecurityRole(SecurityRole securityRole){
		sessionFactory.getCurrentSession().saveOrUpdate(securityRole);
	}

}
