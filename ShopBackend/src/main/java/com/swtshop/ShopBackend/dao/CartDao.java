package com.swtshop.ShopBackend.dao;

import java.util.List;

import com.swtshop.ShopBackend.model.Cart;


public interface CartDao {

	public boolean Save(Cart c );
	public boolean delete(int cartId );
	public boolean update(Cart c );
	public int getQuantity(String username, String productname);
	public List<Cart> getCartList(String username);
	public double getTotalAmount(String username);
    public Cart getCartByUsername(String username, String productname);
    public int clearCart(String username);
    public long getNumberOfProducts(String username);
    public Cart getCartById(int id);


	
}
