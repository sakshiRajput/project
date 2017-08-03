package com.swtshop.ShopFrontend.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.swtshop.ShopBackend.dao.CategoryDao;
import com.swtshop.ShopBackend.dao.ProductDao;
import com.swtshop.ShopBackend.model.Category;
import com.swtshop.ShopBackend.model.Product;
@Controller
public class HomeController {

	@Autowired
	CategoryDao categoryDao;
	@Autowired
	ProductDao productDao;
	@RequestMapping("/")
	public String home()
	{
		
		return "index";
		
	}
	
	@RequestMapping("/Category")
	public String login(Model model)
	{
		model.addAttribute("categoryList",categoryDao.getAllCategory());
		model.addAttribute("category",new Category());
		return "Category";
		
	}

	@RequestMapping("/Register")
	public String Register(Model model)
		{
			return "Register";
		}
	@RequestMapping("/Product")
	public String Product(Model model)
		{   model.addAttribute("productList",productDao.getAllProduct());
		    model.addAttribute("product",new Product());
		    model.addAttribute("categoryList",categoryDao.getAllCategory());
			model.addAttribute("category",new Category());
			return "Product";
		}
	}

