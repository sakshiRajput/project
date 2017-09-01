package com.swtshop.ShopBackend.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;

import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.Session;


import com.swtshop.ShopBackend.dao.OrderDao;
import com.swtshop.ShopBackend.model.Order;

@Transactional
@Repository("OrderDao")
public class OrderDaoImpl implements OrderDao {


	@Autowired
	private SessionFactory sessionFactory;

	private final Logger log= LoggerFactory.getLogger(OrderDaoImpl.class);

	
	public boolean addOrder(Order order) {
		
		log.info("Starting  addorder method in OrderDao");	
		Session session = sessionFactory.getCurrentSession();

		
		//	User user=order.getUser();
		
			
			session.save(order);
			//session.save(user);
			//session.save(user.getBillingaddress());
			//session.save(user.getShippingaddress());

			return true;
		
	}

	public List<Order> getAllOrders() {
		
		log.info("Starting  getallorders method in OrderDao");	                               
			return sessionFactory.getCurrentSession().createQuery("FROM Order").list();

		
	}

public Order getOrderById(String username) {
		
	log.info("Starting  getorderbyid method in OrderDao");	
		return sessionFactory.getCurrentSession().get(Order.class, username);
	}

	
public int changeOrderStatus(String username, String status) {
	
	log.info("Starting  changeorderstatus method in OrderDao");	
		Query query = sessionFactory.getCurrentSession()
				.createQuery("UPDATE CustomerOrder SET orderStatus = '" + status + "' where id = " + username);
		return query.executeUpdate();
	

}

	
}
