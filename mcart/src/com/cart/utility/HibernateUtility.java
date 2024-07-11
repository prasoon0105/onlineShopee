package com.cart.utility;


import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtility {

	public static SessionFactory factory= null;
	
	public static SessionFactory getSessionFactory()
	{
		Configuration config=
				new Configuration().configure("hibernate.cfg.xml");
				//step 2
				ServiceRegistry registry = 
					new StandardServiceRegistryBuilder().applySettings(config.getProperties()).build();
		        //step 3
				factory= 
		        	config.buildSessionFactory(registry);
				return factory;
	}
}
