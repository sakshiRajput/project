package com.swtshop.ShopBackend.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.swtshop.ShopBackend.dao.SupplierDao;
import com.swtshop.ShopBackend.model.Product;
import com.swtshop.ShopBackend.model.Supplier;

public class SupplierDaoImpl implements SupplierDao {

	@Autowired
	SessionFactory sessionFactory;
	
	
	public boolean addSupplier(Supplier s )
	{	Session ss=sessionFactory.getCurrentSession();
	    ss.persist(s);
	    return true;
}
		
		

	public	boolean deleteSupplier(int supid)
	{
		
		Session ss=sessionFactory.getCurrentSession();
		Supplier s=(Supplier)ss.load(Supplier.class, supid);
		ss.delete(s);
		
		return true;
	}
	
	public boolean updateSupplier(Supplier s)
	{
		Session ss =sessionFactory.getCurrentSession();
	     ss.update(s);
	     return true;
		
	}
	public List<Supplier>getAllSupplier()
	{
		 Session ss=sessionFactory.getCurrentSession();
	      Query qr= ss.createQuery("from Supplier");
	      List<Supplier> slist=qr.getResultList();
		  return slist;
	}
	public Supplier supplierByid(int supid)
	{

		Session ss=sessionFactory.getCurrentSession();
		Query<Supplier> qr = ss.createQuery("from Supplier where supId="+supid);
	    Supplier suplist = (Supplier)qr.getSingleResult();
	    return suplist;
		
	}
	
}
