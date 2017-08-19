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

		//	Customer customer = customerOrder.getCustomer();
			User user=order.getUser();
		//	customerOrder.setBillingAddress(customer.getBillingAddress());
			
		//	customerOrder.setShippingAddress(customer.getShippingAddress());
			order.setOrderStatus("Placed");
			session.saveOrUpdate(order);
			session.saveOrUpdate(user);
		//	session.saveOrUpdate(customer.getBillingAddress());
			//session.saveOrUpdate(customer.getShippingAddress());

			return true;
		
	}

	public List<Order> getAllOrders() {
		
                                            
			return sessionFactory.getCurrentSession().createQuery("FROM Order").list();

		
	}

public Order getOrderById(int id) {
		
		
		return sessionFactory.getCurrentSession().get(Order.class, id);
	}

	
public int changeOrderStatus(int id, String status) {
	
	
		Query query = sessionFactory.getCurrentSession()
				.createQuery("UPDATE CustomerOrder SET orderStatus = '" + status + "' where id = " + id);
		return query.executeUpdate();
	

}

	
}
