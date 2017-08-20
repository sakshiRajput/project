package com.swtshop.ShopBackend.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.swtshop.ShopBackend.dao.ProductDao;
import com.swtshop.ShopBackend.model.Product;
@Repository("ProductDao")
@Transactional
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
public boolean addProduct(Product p) {
		
		Session s=sessionFactory.getCurrentSession();
		p.setProdId(p.getProdName());
		s.persist(p);
		return true;
	}

public boolean deleteProduct(String prodid)
{    Session s=sessionFactory.getCurrentSession();
	Product p =(Product)s.load(Product.class, prodid);
	s.delete(p);
	
	return true;
}
public boolean updateProduct(Product p)
{    Session s =sessionFactory.getCurrentSession();
     s.update(p);
     return true;
}
public List<Product>getAllProduct()
{     Session s=sessionFactory.getCurrentSession();
      Query q= s.createQuery("from Product");
      List<Product> list=q.getResultList();
	  return list;
}
public Product productByid(String prodid)
{
	Session s=sessionFactory.getCurrentSession();
	Query<Product> q = s.createQuery("from Product where prodId=?");
	q.setParameter(0,prodid);
    Product prodlist = (Product)q.getSingleResult();
    return prodlist;
    }
	
public List<Product>productByCategory(String catid)
{   
	Session s=sessionFactory.getCurrentSession();
	Query<Product> ql = s.createQuery("from Product where catId='" + catid + "'");
	//ql.setEntity("catId", catid);
	//ql.setParameter(",catid);
	List<Product> plist =ql.getResultList();
    return plist;
	
	
	

}
	

}
