package com.swtshop.ShopFrontend.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;


import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.swtshop.ShopBackend.dao.UserDao;
import com.swtshop.ShopBackend.model.BillingAddress;
import com.swtshop.ShopBackend.model.ShippingAddress;
import com.swtshop.ShopBackend.model.User;

@Controller
public class UserController {

	@Autowired
	UserDao userDao;
	
	


@RequestMapping("/adduser")
public String addUser(@ModelAttribute("user") User u ,Model model)
{ 
	
	
	 
	    
		
	  //  BillingAddress ba = u.getBillingaddress();
	    //ShippingAddress sa = u.getShippingaddress();
	    userDao.addUser(u);
	   
      
	    
	String str="/";
	return "redirect:"+str;
}









}
