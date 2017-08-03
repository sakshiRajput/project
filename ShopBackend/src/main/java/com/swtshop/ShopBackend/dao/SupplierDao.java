package com.swtshop.ShopBackend.dao;

import java.util.List;

import com.swtshop.ShopBackend.model.Supplier;

public interface SupplierDao {
	
	boolean addSupplier(Supplier s );
	boolean deleteSupplier(int supid);
	boolean updateSupplier(Supplier s);
	List<Supplier>getAllSupplier();
	Supplier supplierByid(int supid);
	

}
