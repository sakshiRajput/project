package com.swtshop.ShopFrontend.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;


import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@Autowired
	 HttpSession session;


@RequestMapping("/adduser")
public String addUser(@ModelAttribute("user") User u ,Model model)
{ 
	
	
	if(u.getUserId()==null)
	{
		userDao.addUser(u);
	}
	else
	{
		System.out.println("in update add user "+u.getMobile());
		userDao.updateUser(u);
	}
	    
		
	  //  BillingAddress ba = u.getBillingaddress();
	    //ShippingAddress sa = u.getShippingaddress();
	  //  userDao.addUser(u);
	   
      
	    
	String str="/";
	return "redirect:"+str;
}


@RequestMapping(value="edituser/{userId}")
public String updateuser(@PathVariable("userId") String  userId, Model model)
{

	model.addAttribute("user",userDao.getUserById(userId));
    model.addAttribute("userList",userDao.getUser());
	return "address";

	
}







}
