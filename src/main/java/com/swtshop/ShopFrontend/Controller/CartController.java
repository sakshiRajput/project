package com.swtshop.ShopFrontend.Controller;

import java.security.Principal;
import java.util.Date;

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
import com.swtshop.ShopBackend.dao.ProductDao;
import com.swtshop.ShopBackend.dao.UserDao;
import com.swtshop.ShopBackend.model.Cart;
import com.swtshop.ShopBackend.model.Product;
import com.swtshop.ShopBackend.model.User;



@Controller
public class CartController {
	
//	
//     @Autowired(required=true)
//     Cart cart;

	@Autowired
	 CartDao cartdao;

	
	@Autowired
	CategoryDao categoryDao;
// 	@Autowired
//    Product product;

	@Autowired
	 ProductDao productdao;

	@Autowired
	 UserDao userdao;

	@Autowired
	 HttpSession session;


	@RequestMapping(value = "/addtocart/{prodid}")
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
					String str="/";
					return "redirect:"+str;

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

				if (flag==true) {

					redirect.addFlashAttribute("success", product.getProdName() + " " + "Successfully added to cart!");
					session.setAttribute("numberProducts", cartdao.getNumberOfProducts(username));
					System.out.println("numberProducts:-"+cartdao.getNumberOfProducts(username));
					String str="/";
					return "redirect:"+str;

				} else {
					redirect.addFlashAttribute("error", "Failed to add product to cart!");
					String str="/";
					return "redirect:"+str;
				}
			}

		
	}
	
	@RequestMapping("/deleteItem/{prodid}")
	public String deleteCartItem(@PathVariable("prodid") int prodid, Model model, RedirectAttributes redirect) {
		
			Cart cart = cartdao.getCartById(prodid);

			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();

			int checkQ = cartdao.getQuantity(username, cart.getProdName());

			if (checkQ > 1) {
				cart.setQuantity(checkQ - 1);
				cartdao.update(cart);
				redirect.addFlashAttribute("success", "Cart updated successfully.");
				return "redirect:/Cart";
			} else {
				// cart.setStatus("OLD");
				cartdao.delete(prodid);
				redirect.addFlashAttribute("success", "Item removed successfully.");
				return "redirect:/Cart";
			}
		
	}


	@RequestMapping("/clearCart")
	public String clearCart(RedirectAttributes redirect, Model model) {
		
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();
			int flag = cartdao.clearCart(username);

			if (flag >= 1) {
				redirect.addFlashAttribute("success", "All Items removed successfully.");
				return "redirect:/Cart";
			} else {
				redirect.addFlashAttribute("error", "Failed to clear cart!");
				return "redirect:/Cart";
			}

		
	}
	
	@RequestMapping("/Cart")
	public String cart(String username,Model model)
	{   model.addAttribute("numberProducts", cartdao.getNumberOfProducts(username));  
		model.addAttribute("cartInfo",cartdao.getCartList(username));
			return "redirect:/Cart";
		}

	@RequestMapping("/all")
	public String getCart() {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		String loggedInUsername = username;
		session.setAttribute("numberProducts", cartdao.getNumberOfProducts(loggedInUsername));
		session.setAttribute("cartInfo", cartdao.getCartList(loggedInUsername));
		session.setAttribute("totalAmount", cartdao.getTotalAmount(loggedInUsername));
		return "redirect:/Cart";
	}

	
	
}





