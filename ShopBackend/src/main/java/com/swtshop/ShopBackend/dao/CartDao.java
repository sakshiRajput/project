package com.swtshop.ShopBackend.dao;

import java.util.List;

import com.swtshop.ShopBackend.model.Cart;


public interface CartDao {

	boolean addCart(Cart c );
	boolean deletCart(int cartId );
	boolean updateCart(Cart c );
	List<Cart>getAllCart(String usermailId);
	Cart cartByid(int cartId,String usermailId);
	
	
}
