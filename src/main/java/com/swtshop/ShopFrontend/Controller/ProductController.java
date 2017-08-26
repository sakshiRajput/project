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

import com.swtshop.ShopBackend.dao.CategoryDao;
import com.swtshop.ShopBackend.dao.ProductDao;
import com.swtshop.ShopBackend.model.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDao productdao;
	
	
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product p,Model model,HttpSession session)
	{
		
//		MultipartFile mp=p.getImage();
//	    ServletContext context=session.getServletContext();
//     	String filelocation=context.getRealPath("/resources/images");
//    	System.out.println(filelocation);
//	    String filename=filelocation+"\\"+p.getProdId()+".jpg";
//	    System.out.println(filename);
//	    
//		
//		if(p.getProdId()==null)
//		{
//			productdao.addProduct(p);
//
//		    
//		     try
//		     {   byte b[]=mp.getBytes();
//		     	 FileOutputStream fos=new FileOutputStream(filename);
//		     	 fos.write(b);
//		     	 fos.close();
//		     }
//		     catch(Exception e){}
//		  
//				
//		}
//		else
//		{
//			System.out.println("update data");
//			productdao.updateProduct(p);
//			
//		    
//		}
//	
		
		
		try
	     {     
			MultipartFile mp=p.getImage();
		    ServletContext context=session.getServletContext();
	     	String filelocation=context.getRealPath("/resources/images");
	    	System.out.println(filelocation);
		    String filename=filelocation+"\\"+p.getProdId()+".jpg";
		    System.out.println(filename);
		    byte b[]=mp.getBytes();
			FileOutputStream fos=new FileOutputStream(filename);
			fos.write(b);
			fos.close();   
			 
			    if(p.getProdId()==null)
				{
					productdao.addProduct(p);
				
	             }
			    else
				{
					System.out.println("update data");
					productdao.updateProduct(p);
					
				    
				}
			    
	     }	    
			    catch(Exception e){}
		
			return "redirect:/Product";	
	}

	@RequestMapping(value="/updateProduct/{prodId}")
	public String updateproduct(@PathVariable("prodId")String prodId, Model model)
	{
		model.addAttribute("categoryList",categoryDao.getAllCategory());
		model.addAttribute("product",productdao.productByid(prodId));
		model.addAttribute("ProductList",productdao.getAllProduct());
		return "Product";

	}
	@RequestMapping(value="/deleteProduct/{prodId}")
	public String deleteProduct(@PathVariable("prodId") String prodId ,Model model)
	{
		model.addAttribute("product",productdao.productByid(prodId));
		productdao.deleteProduct(prodId);
		model.addAttribute("ProductList", productdao.getAllProduct());
		return "redirect:/Product";
		
	}
	
	@RequestMapping(value="/productByCategory/{catId}")
	public String prodbycatid(@PathVariable("catId")String catId, Model model)
	{

		model.addAttribute("categoryList",categoryDao.getAllCategory());
		model.addAttribute("ProductList",productdao.productByCategory(catId));
		return "Producttable";

	}

	@RequestMapping(value="/ProductDetails/{prodId}")
	public String productmore(@PathVariable("prodId")String prodId, Model model)
	{
		
		model.addAttribute("Product",productdao.productByid(prodId));
		return "ProductDetails";	
	}
	
}
