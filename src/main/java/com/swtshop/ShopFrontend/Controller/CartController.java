package com.swtshop.ShopFrontend.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.swtshop.ShopBackend.dao.CartDao;
import com.swtshop.ShopBackend.dao.ProductDao;
import com.swtshop.ShopBackend.model.Cart;
import com.swtshop.ShopBackend.model.Product;



@Controller
public class CartController {
/*
	@Autowired
	CartDao cartdao;
	@Autowired
	ProductDao productDao;

	@RequestMapping("/ProductDetails/{catId}")
	public String Productdetails(@PathVariable("catId")Model model)
	{   Product product=ProductDao.
		model.addAttribute("ProductList",productDao.productByid(catId));
		model.addAttribute("product",new Product());
		return "redirect:/ProductDetails";
	}
	
	@RequestMapping("/Producttable")
	public String Producttable(String catId,Model model)
	{
		model.addAttribute("ProductList",productDao.productByCategory(catId));
		
		return "redirect:/Producttable";
	}
	*/
	
}
