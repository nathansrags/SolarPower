package com.solarpower.presentation.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.solarpower.presentation.model.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public User findByUserName(String username) {

		List<User> users = new ArrayList<User>();
		users = sessionFactory.getCurrentSession().createQuery("from User where username=?").setParameter(0, username)
				.list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}

	}
	
	/* (non-Javadoc)
	 * @see com.solarpower.presentation.dao.UserDao#saveUser(com.solarpower.presentation.model.User)
	 */
	@Override
	public void saveUser(User user){
		sessionFactory.getCurrentSession().save(user);
	}
	
	@Override
	public void deleteUserCredentials(String username){
		sessionFactory.getCurrentSession().createQuery("DELETE from User where username ='" + username +"'" ).executeUpdate();
	}

}