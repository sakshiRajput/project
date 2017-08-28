package com.swtshop.ShopBackend.daoimpl;

import java.util.List;
import java.io.IOException;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.swtshop.ShopBackend.dao.CartDao;
import com.swtshop.ShopBackend.model.Cart;
import com.swtshop.ShopBackend.model.Category;

@Repository("cartDao")
@Transactional
public class CartDaoImpl implements CartDao {

	
	@Autowired
	SessionFactory sessionFactory;
	private final Logger log= LoggerFactory.getLogger(CartDaoImpl.class);


	public boolean Save(Cart cart )
	{     log.info("Starting save method in cartDao");
		 sessionFactory.getCurrentSession().save(cart);
		 return true;
    }
	public boolean delete(int cartId )
	{        log.info("Starting delete method in cartDao");
			sessionFactory.getCurrentSession().delete(getCartById(cartId));
			return true;
	}
	
	public boolean update(Cart c)
	{
		sessionFactory.getCurrentSession().update(c);
		return true;
	}
	
    public List<Cart> getCartList(String username) 
    {   log.info("Starting getCartList method in cartDao");
		Query query = sessionFactory.getCurrentSession()
				.createQuery("from Cart where username = '" + username + "' and status='NEW'");
		List<Cart> clist=query.getResultList();
		return clist;
	
    }

	
	public Cart getCartById(int userid) 
	{    log.info("Starting getCartById method in cartDao");
		return sessionFactory.getCurrentSession().get(Cart.class, userid);
	}
	
	public double getTotalAmount(String username) {
		 log.info("Starting getTotalAmount method in cartDao");
			Query query = sessionFactory.getCurrentSession().createQuery(
					"SELECT SUM(price*quantity) FROM Cart where username='" + username + "' and status = 'NEW'");
			if (query.uniqueResult() == null) {
				return 0;
			} else {
				double result =  (Double) query.uniqueResult();
				System.out.println("result-"+result);
				return result;
			}

		
	}

	public Cart getCartByUsername(String username, String productname) {
		 log.info("Starting getCartByUserName method in cartDao");

			Query query = sessionFactory.getCurrentSession().createQuery("from Cart WHERE username='" + username
					+ "' and product_name='" + productname + "' and status = 'NEW'");
			
			return (Cart) query.uniqueResult();
		
	}

	public int getQuantity(String username, String productname) {
		
		 log.info("Starting getquantity method in cartDao");
			Query query = sessionFactory.getCurrentSession().createQuery("SELECT quantity from Cart WHERE username='"
					+ username + "' and product_name='" + productname + "' and status = 'NEW'");
		
			return  (Integer) query.uniqueResult();
		
	}

	public long getNumberOfProducts(String username) {
	
		log.info("Starting getnumberofproducts method in cartDao");
			Query query = sessionFactory.getCurrentSession().createQuery("SELECT SUM(quantity) FROM Cart where username=?1 and status = 'NEW'");
			query.setParameter(1,username);
//			return  (Integer) query.uniqueResult();

			
						if (query.uniqueResult() == null) {
				return 0;
			} else {
				long result = (Long) query.uniqueResult();
				return result;
			}
	
	}

	
	public int clearCart(String username) {
		
		log.info("Starting clearcart method in cartDao");
			Query query = sessionFactory.getCurrentSession()
					.createQuery("DELETE from Cart where username = '" + username + "'");
			return query.executeUpdate();

		
	}
	


	
	
	

}
