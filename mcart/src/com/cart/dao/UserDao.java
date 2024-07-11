package com.cart.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cart.pojo.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public User getUserByEmailAndPassword(String email,String pass)
	{
		User user=null;
		
		try{
			String query ="from User where userEmail=:e and userPass=:p";
			Session session=this.factory.openSession();
			Query q=session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", pass);
			
			user=(User) q.uniqueResult();
			
			session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
		
	}
}
