package com.swtshop.ShopFrontend.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.swtshop.ShopBackend.daoimpl.CategoryDaoImpl;
import com.swtshop.ShopBackend.model.BillingAddress;
import com.swtshop.ShopBackend.model.ShippingAddress;
import com.swtshop.ShopBackend.model.User;

@Controller
public class UserController {

	@Autowired
	UserDao userDao;
	
	@Autowired
	 HttpSession session;
	
	private final Logger logger= LoggerFactory.getLogger(UserController.class);

	/*
	 * 
	 * 
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("customer") Customer customer, BindingResult result, Model model) {
		logger.info("Starting saveUser method in userController");
		if (result.hasErrors()) {
			logger.error("Binding Result has error");
			model.addAttribute("error", "Binding Result has error");
			return "error";
		}

		List<User> usersList = userdao.getuser();

		try {
			logger.info("Saving user...");
			for (int i = 0; i < usersList.size(); i++) {
				if (user.getEmail().equalsIgnoreCase(usersList.get(i).getEmail())) {
					model.addAttribute("emailError", "This email is already exists");
					logger.error("Email is already exist");
					return "Register";
				}

				if (user.getUsername().equalsIgnoreCase(usersList.get(i).getUsername())) {
					model.addAttribute("usernameError", "This username is already exists");
					logger.error("Username is already exists");
					return "Register";
				}

				if (user.getMobile().equalsIgnoreCase(usersList.get(i).getMobileno())) {
					model.addAttribute("mobileError", "Mobile number is already exists");
					logger.error("Mobile number is already exists");
					return "Register";
				}
			}

			boolean flag = userDao.addUser(u);

			if (flag == true) {

				model.addAttribute("success", "Registered successfully");
				logger.info("User registered successfully");
				return "Login";
			} else {
				model.addAttribute("error", "Registration Failed, Please try again !");
				logger.error("Registration failed");
				return "Register";
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("Exception occured " + e);
			model.addAttribute("catchError", "Server is not responding please try again letter.");
			return "logg";
		}

	}


}*/
	
@RequestMapping("/adduser")
public String addUser(@ModelAttribute("user") User u , BindingResult result,Model model)
{ 
	
	
	logger.info("Starting addUser method in userController");
	if (result.hasErrors()) {
		logger.error("Binding Result has error");
		model.addAttribute("error", "Binding Result has error");
		return "error";
	}

	List<User> usersList = userDao.getUser();

	try {
		logger.info("Saving user...");
		for (int i = 0; i < usersList.size(); i++) {
			if (u.getEmail().equalsIgnoreCase(usersList.get(i).getEmail())) {
				model.addAttribute("emailError", "This email is already exists");
				logger.error("Email is already exist");
				return "Register";
			}

			if (u.getUserName().equalsIgnoreCase(usersList.get(i).getUserName())) {
				model.addAttribute("usernameError", "This username is already exists");
				logger.error("Username is already exists");
				return "Register";
			}

			if (u.getMobile().equals(usersList.get(i).getMobile())) {
				model.addAttribute("mobileError", "Mobile number is already exists");
				logger.error("Mobile number is already exists");
				return "Register";
			}
		}

		boolean flag = userDao.addUser(u);

		if (flag == true) {

			model.addAttribute("success", "Registered successfully");
			logger.info("User registered successfully");
			return "Login";
		} else {
			model.addAttribute("error", "Registration Failed, Please try again !");
			logger.error("Registration failed");
			return "Register";
		}

	} catch (Exception e) {

		logger.error("Exception occured " + e);
		model.addAttribute("catchError", "Server is not responding please try again letter.");
		return "logg";
	}

}




@RequestMapping(value="edituser/{userId}")
public String updateuser(@PathVariable("userId") String  userId, Model model)
{

	model.addAttribute("user",userDao.getUserById(userId));
    model.addAttribute("userList",userDao.getUser());
	return "address";

	
}







}
