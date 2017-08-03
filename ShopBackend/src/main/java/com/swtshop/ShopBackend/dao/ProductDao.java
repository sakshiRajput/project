package com.swtshop.ShopBackend.dao;


import java.util.List;

import com.swtshop.ShopBackend.model.Product;

public interface ProductDao {
	
	
	boolean addProduct(Product p );
	boolean deleteProduct(int prodid);
	boolean updateProduct(Product p);
	List<Product>getAllProduct();
	Product productByid(int prodId);
	

}




