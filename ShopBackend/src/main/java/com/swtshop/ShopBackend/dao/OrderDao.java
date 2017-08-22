package com.swtshop.ShopBackend.dao;
import com.swtshop.ShopBackend.model.Order;
import java.util.List;
public interface OrderDao {

	public boolean addOrder(Order order);

	public List<Order> getAllOrders();

	public Order getOrderById(String Username);

	public int changeOrderStatus(String username, String status);


	
	
	
}
