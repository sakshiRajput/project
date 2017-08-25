package com.swtshop.ShopBackend.dao;

import java.util.List;

import com.swtshop.ShopBackend.model.BillingAddress;
import com.swtshop.ShopBackend.model.ShippingAddress;
import com.swtshop.ShopBackend.model.User;

public interface UserDao {
	
	
	public boolean addUser(User u);
	public boolean updateUser(User u);
	List<User> getUser();
	 User getUserById(String id);
	
	
}
