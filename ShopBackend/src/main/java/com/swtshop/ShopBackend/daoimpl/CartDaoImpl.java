package com.swtshop.ShopBackend.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.swtshop.ShopBackend.dao.CartDao;
import com.swtshop.ShopBackend.model.Cart;


public class CartDaoImpl implements CartDao {

	
	@Autowired
	SessionFactory sessionFactory;
	public boolean addCart(Cart c )
	{  Session s=sessionFactory.getCurrentSession();
	   s.persist(c);
	   return true;
	}
	
		
		
	
	public boolean deletCart(int cartId )
	{
		Session s=sessionFactory.getCurrentSession();
		Cart c =(Cart)s.load(Cart.class, cartId);
		s.delete(cartId);
		return true;
		
		
	}
	
	
	
	public boolean updateCart(Cart c )
	{   Session s=sessionFactory.getCurrentSession();
	    s.update(c);
	    return true;
		
	}
	
	public List<Cart>getAllCart(String usermailId)
	{     Session s=sessionFactory.getCurrentSession();
	      List<Cart> clist=null;      
	      clist=(List<Cart>)s.createQuery("from Cart where usermailId:email").setString("email",usermailId).uniqueResult();
	      
		  return clist;
	}
	
	public Cart cartByid(int cartId,String usermailId)
	{
		Session s=sessionFactory.getCurrentSession();
		Cart cr=null;
		cr=(Cart)s.createQuery("from Cart where usermailId:email and cartProdId:id").setString("email",usermailId).setInteger("id", cartId).uniqueResult();
		return cr;
	    }
	
	
	
}
