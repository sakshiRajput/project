package com.swtshop.ShopBackend.dao;


import java.util.List;

import com.swtshop.ShopBackend.model.Product;

public interface ProductDao {
	
	
	boolean addProduct(Product p );
	boolean deleteProduct(String prodid);
	boolean updateProduct(Product p);
	List<Product>getAllProduct();
	Product productByid(String prodid);
	

}




