package com.swtshop.ShopFrontend.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swtshop.ShopBackend.dao.CategoryDao;
import com.swtshop.ShopBackend.model.Category;
@Controller
public class CategoryController {
	
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value="/addCategory",method=RequestMethod.POST)
	
	public String addCategory(@ModelAttribute("category") Category c, Model model)
	{
		if(c.getCatId()==null)
		{
			categoryDao.addCategory(c);
		}
		else
		{
			categoryDao.updateCategory(c);
		}
		
		return "redirect:/Category";	
	}	
	@RequestMapping(value="/updateCategory/{catId}")
			public String updatecategory(@PathVariable("catId") String  catid, Model model)
			{

				model.addAttribute("category",categoryDao.categoryByid(catid));
			
				model.addAttribute("categoryList",categoryDao.getAllCategory());
				return "Category";

				
			}
	 
	@RequestMapping(value="/deleteCategory/{catId}")
	public String deletecategory(@PathVariable("catId") String catid ,Model model)
	{
		model.addAttribute("category",categoryDao.categoryByid(catid));
		categoryDao.deleteCategory(catid);
		model.addAttribute("categoryList", categoryDao.getAllCategory());
		return "redirect:/Category";
		
	}


}
	
  


