  
package com.swtshop.ShopBackend.dao;
import java.util.List;

import com.swtshop.ShopBackend.model.Category;
public interface CategoryDao {


	public boolean addCategory(Category c);
	public boolean deleteCategory(String catid);
	public boolean updateCategory(Category c);
	List<Category> getAllCategory();
	Category categoryByid(String catid);
}
