package com.swtshop.ShopFrontend.Controller;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swtshop.ShopBackend.dao.CartDao;
import com.swtshop.ShopBackend.dao.ProductDao;
import com.swtshop.ShopBackend.dao.UserDao;
import com.swtshop.ShopBackend.model.Cart;
import com.swtshop.ShopBackend.model.Product;
import com.swtshop.ShopBackend.model.User;



@Controller
public class CartController {
	
	
	@Autowired(required=true)
	private Cart cart;

	@Autowired
	private CartDao cartdao;

	@Autowired
	private Product product;

	@Autowired
	private ProductDao productdao;

	@Autowired
	private UserDao userdao;

	@Autowired
	private HttpSession session;


	@RequestMapping(value = "/addtocart/{prodid}")
    public String addToCart(@PathVariable("prodid") String prodid, RedirectAttributes redirect, Model model,Principal p) {
		
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
			User user =(User) userdao.getUser();
			System.out.println(user.getUserId());
			cart.setUser_id(user.getUserId());
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
					return "redirect:/myCart/all";

				} else {
					redirect.addFlashAttribute("error", "Failed to add product to cart!");
					return "redirect:/CatProduct";
				}
			} else {
				System.out.println("first time product is going to add");
				cart.setQuantity(1);
				boolean flag = cartdao.Save(cart);

				if (flag) {

					redirect.addFlashAttribute("success", product.getProdName() + " " + "Successfully added to cart!");
					session.setAttribute("numberProducts", cartdao.getNumberOfProducts(username));
					return "redirect:/myCart/all";

				} else {
					redirect.addFlashAttribute("error", "Failed to add product to cart!");
					return "redirect:/CatProduct";
				}
			}

		
	}
	



}
