package com.swtshop.ShopFrontend.Controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swtshop.ShopBackend.dao.CartDao;
import com.swtshop.ShopBackend.dao.CategoryDao;
import com.swtshop.ShopBackend.dao.OrderDao;
import com.swtshop.ShopBackend.dao.ProductDao;
import com.swtshop.ShopBackend.dao.UserDao;
import com.swtshop.ShopBackend.daoimpl.UserDaoImpl;
import com.swtshop.ShopBackend.model.BillingAddress;
import com.swtshop.ShopBackend.model.Cart;
import com.swtshop.ShopBackend.model.Category;
import com.swtshop.ShopBackend.model.Order;
import com.swtshop.ShopBackend.model.Product;
import com.swtshop.ShopBackend.model.ShippingAddress;
import com.swtshop.ShopBackend.model.User;



@Controller
public class CartController {
	


	@Autowired
	 CartDao cartdao;

	
	@Autowired
	CategoryDao categoryDao;

	@Autowired
	 ProductDao productdao;

	@Autowired
	 UserDao userdao;
	
	
	@Autowired
	OrderDao orderdao;

	@Autowired
	 HttpSession session;


	@RequestMapping(value = "addtocart/{prodid}")
    public String addToCart(@PathVariable("prodid") String prodid, RedirectAttributes redirect, Model model,Principal p) 
		{	
		    System.out.println("addtocart");
	
		
			Cart cart = new Cart();
			Product product = productdao.productByid(prodid);
			System.out.println(product.getProdName());
			cart.setProdName(product.getProdName());
			cart.setPrice(product.getPrice());
			cart.setDateAdded(new Date());

		
			
	        String username=p.getName();
		    System.out.println("username: "+username);
			cart.setUsername(username);
			cart.setStatus("NEW");
			User user =userdao.getUserById(username);
			System.out.println(user.getUserId());
			cart.setUserId(user.getUserId());
			
			Cart existCart = cartdao.getCartByUsername(username, cart.getProdName());
			System.out.println(product.getProdName());
			if (existCart != null) {
				int currentQuantity = cartdao.getQuantity(username, cart.getProdName());
				cart.setCartId(existCart.getCartId());
				cart.setQuantity(currentQuantity + 1);
				boolean flag = cartdao.update(cart);

				if (flag) {

					redirect.addFlashAttribute("success", product.getProdName() + " " + "Successfully added to cart!");
					session.setAttribute("numberProducts", cartdao.getNumberOfProducts(username));
					
					return "redirect:/";

				} else {
					redirect.addFlashAttribute("error", "Failed to add product to cart!");
					String str="/";
					return "redirect:"+str;
				}
			} else {
				System.out.println("first time product is going to add");
				cart.setQuantity(1);
				System.out.println(cart.getQuantity());
				boolean flag = cartdao.Save(cart);

				if (flag) {

					redirect.addFlashAttribute("success", product.getProdName() + " " + "Successfully added to cart!");
					session.setAttribute("numberProducts", cartdao.getNumberOfProducts(username));
					String str="/";
					return "redirect:"+str;

				} else {
					redirect.addFlashAttribute("error", "Failed to add product to cart!");
					String str="/";
					return "redirect:"+str;
				}
			}
			
   
		
	}
	
	@RequestMapping("/deleteCart/{cartId}")
	public String deleteCartItem(@PathVariable("cartId") int cartId, Model model, RedirectAttributes redirect) {
		
			Cart cart = cartdao.getCartById(cartId);

			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();

			int checkQ = cartdao.getQuantity(username, cart.getProdName());

			if (checkQ > 1) {
				cart.setQuantity(checkQ - 1);
				cartdao.update(cart);
				redirect.addFlashAttribute("success", "Cart updated successfully.");
				return "redirect:/all";
			} else {
				// cart.setStatus("OLD");
				cartdao.delete(cartId);
				redirect.addFlashAttribute("success", "Item removed successfully.");
				return "redirect:/all";
			}
		
	}

	
	@RequestMapping("/clearCart")
	public String clearCart(Model model,RedirectAttributes redirect) {
//		
//			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//			String username = auth.getName();
//			int flag = cartdao.clearCart(username);
//
//			if (flag >= 1) {
//			System.out.println("success,All Items removed successfully.");
//				//redirect.addFlashAttribute("success", "All Items removed successfully.");
//				return "Cart";
//			} else {
//				System.out.println("error,failed to remove");
//				//redirect.addFlashAttribute("error", "Failed to clear cart!");
//				return "Cart";
//			}

		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();
			int flag = cartdao.clearCart(username);

			if (flag >= 1) {
				redirect.addFlashAttribute("success", "All Items removed successfully.");
				return "redirect:/all";
			} else {
				redirect.addFlashAttribute("error", "Failed to clear cart!");
				return "redirect:/all";
			}

		} catch (Exception e) {
			model.addAttribute("catchError", "Server is not responding please try again latter.");
			return "error";
		}
	}
		
		
	


	@RequestMapping("/all")
	public String getCart(Model model) 
		 {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		String loggedInUsername = username;
		model.addAttribute("categoryList",categoryDao.getAllCategory());
		Order order=new Order();
    	session.setAttribute("numberProducts", cartdao.getNumberOfProducts(loggedInUsername));
		session.setAttribute("cartInfo", cartdao.getCartList(loggedInUsername));
	    session.setAttribute("totalAmount", cartdao.getTotalAmount(loggedInUsername));
		System.out.println("before get user by id");
		User user=userdao.getUserById(loggedInUsername);
        System.out.println("after get user by id");
		order.setBillingaddress(user.getBillingaddress());
		order.setShippingaddress(user.getShippingaddress());
		System.out.println("after bill n ship");
		order.setOrderStatus("Placed");
		order.setUser(user);
		System.out.println("after set user");
		session.setAttribute("order", order);
		session.setAttribute("shipaddr", user.getShippingaddress());
		session.setAttribute("billaddr", user.getBillingaddress());
		session.setAttribute("mobile",user.getMobile());
		session.setAttribute("cartInfo", cartdao.getCartList(loggedInUsername));
		session.setAttribute("totalAmount", cartdao.getTotalAmount(loggedInUsername));
		session.setAttribute("Date",new Date() );
		System.out.println("before-");
		System.out.println("redirection is done:");
		orderdao.addOrder(order);
		
		
		//till here modal
		return "Cart";
	}

	
	
	
	
	@RequestMapping("/address")
	public String editaddress()
	{    
		 System.out.println("redirecting to address page");
		return "redirect:/address";
    }
		

		@RequestMapping("/invoice")
		public String invoice(Model model)
		{
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();
			String loggedInUsername = username;
			model.addAttribute("categoryList",categoryDao.getAllCategory());
			System.out.println("before get user by id");
			User user=userdao.getUserById(loggedInUsername);
		   System.out.println("after get user by id");
			Order order=new Order();
			order.setBillingaddress(user.getBillingaddress());
			order.setShippingaddress(user.getShippingaddress());
			   System.out.println("after bill n ship");
			order.setOrderStatus("Placed");
			order.setUser(user);
			System.out.println("after set user");
			session.setAttribute("order", order);
			session.setAttribute("shipaddr", user.getShippingaddress());
			session.setAttribute("billaddr", user.getBillingaddress());
			session.setAttribute("cartInfo", cartdao.getCartList(loggedInUsername));
			session.setAttribute("totalAmount", cartdao.getTotalAmount(loggedInUsername));
			session.setAttribute("Date",new Date() );
			System.out.println("before-");
//			session.setAttribute("Billing",orderdao.getOrderById(loggedInUsername));
			System.out.println("redirection is done:");
			orderdao.addOrder(order);
		    return "invoice";
	    }
	
}





