package com.swtshop.ShopBackend.dao;

import java.util.List;

import com.swtshop.ShopBackend.model.BillingAddress;
import com.swtshop.ShopBackend.model.ShippingAddress;
import com.swtshop.ShopBackend.model.User;

public interface UserDao {
	
	//,	BillingAddress ba, ShippingAddress sa
	public boolean addUser(User u);
	List<User> getUser();
	
	
	
}
