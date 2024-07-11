package com.cart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.cart.pojo.Category;
import com.cart.pojo.User;

public class CategoryDao {
	
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	public int saveCategory(Category cat)
	{
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			int catId=(int) session.save(cat);
			tx.commit();
			session.close();
			return catId;
		
	}
	public List<Category> getCategory()
	{
		Session s=this.factory.openSession();
		Query query=s.createQuery("from Category");
		List<Category> list=query.list();
		
		
		return list;
		
	}
	public Category getCategoryById(int cid)
	{
		Category cat=null;
		try
		{
			Session s1=this.factory.openSession();
			cat = (Category) s1.get(Category.class, cid);
			s1.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return cat;
	}
}
