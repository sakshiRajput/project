package com.swtshop.ShopBackend;


import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.swtshop.ShopBackend.dao.CategoryDao;
import com.swtshop.ShopBackend.model.Category;


public class categoryTestCase {

	@Autowired
	static AnnotationConfigApplicationContext context;
	
	@Autowired
	static CategoryDao categoryDao;
	
	@Autowired
	static Category category;

	@BeforeClass
	public static void intialize()
	{
		context = new AnnotationConfigApplicationContext();
		context.scan("com.swtshop.ShopBackend");
		context.refresh();
		categoryDao =(CategoryDao)context.getBean("categoryDao");
		category =(Category)context.getBean("category");
		
		
	}
	@Test
	public void addCategory()
	{
		
		category.setCatName("Dry-fruits");
		category.setCatDesc("freshly packed");
		assertEquals("addCategory",categoryDao.addCategory(category),true);
		
	}
	
	@Test
	public void updateCategory()
	{
		category.setCatId("sweets");
		category.setCatName("sweets");
		category.setCatDesc("fresh");
		assertEquals("updateCategory",categoryDao.updateCategory(category),true);
		
	}
	@Test
	public void deleteCategory()
	{
		assertEquals("deleteCategory",categoryDao.deleteCategory("sharbat"),true);

	}
	
	
	
	
}
