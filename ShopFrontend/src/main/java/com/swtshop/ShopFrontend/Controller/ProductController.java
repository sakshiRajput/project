package com.swtshop.ShopFrontend.Controller;

import java.io.FileOutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.swtshop.ShopBackend.dao.ProductDao;
import com.swtshop.ShopBackend.model.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDao productdao;
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product p,Model model,HttpSession session)
	{   if(p.getProdId()==0)
	{
		productdao.addProduct(p);
		MultipartFile mp=p.getImage();
		ServletContext context=session.getServletContext();
		String filelocation=context.getRealPath("/resources/images");
		System.out.println(filelocation);
		String filename=filelocation+"\\"+p.getProdId()+".jpg";
		System.out.println(filename);
		try
		{   byte b[]=mp.getBytes();
		    FileOutputStream fos=new FileOutputStream(filename);
		    fos.write(b);
		    fos.close();
		}
		catch(Exception e){}
	
	}
	else
	{
		productdao.updateProduct(p);
	}
	
	return "redirect:/Product";	
	}

	@RequestMapping(value="/updateProduct/{prodId}",method=RequestMethod.GET)
	public String updateproduct(@PathVariable("prodId")int prodId, Model model)
	{

		model.addAttribute("product",productdao.productByid(prodId));
		model.addAttribute("ProductList",productdao.getAllProduct());
		return "redirect:/Product";

	}
	@RequestMapping(value="/deleteProduct/{prodId}",method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("prodId") int prodId ,Model model)
	{
		model.addAttribute("product",productdao.productByid(prodId));
		productdao.deleteProduct(prodId);
		model.addAttribute("ProductList", productdao.getAllProduct());
		return "redirect:/Product";
		
	}


	
}
