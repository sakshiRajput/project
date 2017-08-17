package com.swtshop.ShopFrontend.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.swtshop.ShopBackend.dao.CartDao;
import com.swtshop.ShopBackend.model.Cart;



@Controller
public class CartController {

/*	@Autowired
	CartDao cartdao;*/
	/*@RequestMapping(value="/addtocart",method=RequestMethod.POST)
	public ModelAndView addtocart(HttpServletRequest req)
	{   Principal pr=req.getUserPrincipal();
		String userEmail=pr.getName();
		/*int  pId=Integer.parseInt(req.getParameter("id"));
		int pPrice=Integer.parseInt(req.getParameter("price"));
		int pquantity=Integer.parseInt(req.getParameter("quantity"));
		String prodname=req.getParameter("pname");
		String pimage=req.getParameter("prodimage");
		Cart cartobj=cartdao.cartByid(pId, userEmail);*/
/*		
		Cart cm=new Cart();
		cm.setCartPrice(price);
		cm.setCartProdId(pId);
		cm.setCartImage(image);
		
		
		return null;
		
	}
	
	
	
	*/
	/*	
	@RequestMapping(value="/addtocart",method=RequestMethod.POST)
	public String addtocart(@ModelAttribute("cart") Cart cart, Model model)
	{
		
		
		if(cart.getCartId()==0)
		{
			cartdao.addCart(cart);
		}
		else
		{
			cartdao.updateCart(cart);
		}
		
		return  "redirect:/Cart";
		
	}*/
	
}
