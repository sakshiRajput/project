package com.swtshop.ShopFrontend.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.swtshop.ShopBackend.dao.CartDao;
import com.swtshop.ShopBackend.dao.CategoryDao;
import com.swtshop.ShopBackend.dao.ProductDao;
import com.swtshop.ShopBackend.dao.SupplierDao;
import com.swtshop.ShopBackend.dao.UserDao;

import com.swtshop.ShopBackend.model.Category;
import com.swtshop.ShopBackend.model.Product;
import com.swtshop.ShopBackend.model.Supplier;
import com.swtshop.ShopBackend.model.User;
@Controller
public class HomeController {

	@Autowired
	CategoryDao categoryDao;
	@Autowired
	ProductDao productDao;
	@Autowired
	SupplierDao supplierDao;
	@Autowired
	UserDao userDao;
	@Autowired
	CartDao cartdao;
	
	@RequestMapping("/")
	public String home(Model model)
	{     
		model.addAttribute("categoryList",categoryDao.getAllCategory());
		model.addAttribute("ProductList",productDao.getAllProduct());
		return "index";
		
	}
	
	@RequestMapping("/index")
	public String index()
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
		
		model.addAttribute("userList",userDao.getUser());
		model.addAttribute("user",new User());
	    return "Register";
			
		}
	@RequestMapping("/Product")
	public String Product(Model model)
		{   model.addAttribute("ProductList",productDao.getAllProduct());
		    model.addAttribute("product",new Product());
		    model.addAttribute("categoryList",categoryDao.getAllCategory());
			model.addAttribute("category",new Category());
			return "Product";
		}
	
	@RequestMapping("/Supplier")
	public String Supplier(Model model)
		{   model.addAttribute("supplierList",supplierDao.getAllSupplier());
		    model.addAttribute("supplier",new Supplier());
		    return "Supplier";
		}
	
	
	@RequestMapping("/Login")
	public String mainlogin(Model model)
	{
		 model.addAttribute("categoryList",categoryDao.getAllCategory());	
		return "Login";
		
	}
	
	@RequestMapping("/Productlist")
	public String Productlist(Model model)
	{
		 model.addAttribute("ProductList",productDao.getAllProduct());
		return "Productlist";
	}
	
	@RequestMapping("/Adddata")
	public String adddata(Model model)
	{   
		
		model.addAttribute("categoryList",categoryDao.getAllCategory());
		model.addAttribute("category",new Category());
		model.addAttribute("supplierList",supplierDao.getAllSupplier());
	    model.addAttribute("supplier",new Supplier());
	    model.addAttribute("ProductList",productDao.getAllProduct());
	    model.addAttribute("product",new Product());
		return "redirect:/Adddata";
		
	}
	
/*	@RequestMapping("/ProductDetails")
	public String Productdetails(Model model)
	{
		model.addAttribute("ProductList",productDao.getAllProduct());
		model.addAttribute("product",new Product());
		return "ProductDetails";
	}
	*/
	@RequestMapping("/Producttable")
	public String Producttable(String catId,Model model)
	{
		model.addAttribute("ProductList",productDao.productByCategory(catId));
	//	model.addAttribute("product",new Product());
		return "redirect:/Producttable";
	}
	
	
	@RequestMapping("/logg")
	public String lon(@RequestParam("name")String x,@RequestParam("password")String y){
		if(x.equals("sakshi") && y.equals("sak"))
		{
			return "logg";	
		}
		else
		{
			return "Home";
		}
	}
	
	
    
	@RequestMapping("/Profile")
	public String profile()
	{     
		
			return "Profile";
		}
	
	@RequestMapping("/Admin")
	public String admin(Model model)
	{     
		model.addAttribute("categoryList",categoryDao.getAllCategory());
		model.addAttribute("category",new Category());
		model.addAttribute("supplierList",supplierDao.getAllSupplier());
	    model.addAttribute("supplier",new Supplier());
	    model.addAttribute("ProductList",productDao.getAllProduct());
	    model.addAttribute("product",new Product());
			return "redirect:/Admin";
		}


}

