package com.swtshop.ShopBackend.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.Session;


import com.swtshop.ShopBackend.dao.OrderDao;
import com.swtshop.ShopBackend.model.Order;
import com.swtshop.ShopBackend.model.User;
@Transactional
@Repository("OrderDao")
public class OrderDaoImpl implements OrderDao {


	@Autowired
	private SessionFactory sessionFactory;

	
	public boolean addOrder(Order order) {
		
			Session session = sessionFactory.getCurrentSession();

		
		//	User user=order.getUser();
		
			
			session.save(order);
			//session.save(user);
			//session.save(user.getBillingaddress());
			//session.save(user.getShippingaddress());

			return true;
		
	}

	public List<Order> getAllOrders() {
		
                                            
			return sessionFactory.getCurrentSession().createQuery("FROM Order").list();

		
	}

public Order getOrderById(String username) {
		
		
		return sessionFactory.getCurrentSession().get(Order.class, username);
	}

	
public int changeOrderStatus(String username, String status) {
	
	
		Query query = sessionFactory.getCurrentSession()
				.createQuery("UPDATE CustomerOrder SET orderStatus = '" + status + "' where id = " + username);
		return query.executeUpdate();
	

}

	
}
