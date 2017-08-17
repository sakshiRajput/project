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
import com.swtshop.ShopBackend.dao.SupplierDao;
import com.swtshop.ShopBackend.model.Category;
import com.swtshop.ShopBackend.model.Product;
import com.swtshop.ShopBackend.model.Supplier;

@Controller
public class AddController {


	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SupplierDao supplierDao;
	@Autowired
	ProductDao productdao;
	
	@RequestMapping(value="/Adddata/addCategory",method=RequestMethod.POST)
	
	public String addCategory(@ModelAttribute("category") Category c, Model model)
	{
		if(c.getCatId()==null)
		{
			categoryDao.addCategory(c);
		}
		else
		{
			categoryDao.updateCategory(c);
		}
		
		return "redirect:/Adddata";	
	}	
	@RequestMapping(value="/Adddata/updateCategory/{catId}")
			public String updatecategory(@PathVariable("catId") String  catid, Model model)
			{

				model.addAttribute("category",categoryDao.categoryByid(catid));
			
				model.addAttribute("categoryList",categoryDao.getAllCategory());
				return "redirect:/Adddata";

				
			}
	 
	@RequestMapping(value="Adddata/deleteCategory/{catId}")
	public String deletecategory(@PathVariable("catId") String catid ,Model model)
	{
		model.addAttribute("category",categoryDao.categoryByid(catid));
		categoryDao.deleteCategory(catid);
		model.addAttribute("categoryList", categoryDao.getAllCategory());
		return "redirect:/Adddata";
		
	}

	
	@RequestMapping(value="/Adddata/addProduct",method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product p,Model model,HttpSession session)
	{   if(p.getProdId()==null)
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
	
	return "redirect:/Adddata";	
	}

	@RequestMapping(value="Adddata/updateProduct/{prodId}")
	public String updateproduct(@PathVariable("prodId")String prodId, Model model)
	{

		model.addAttribute("product",productdao.productByid(prodId));
		model.addAttribute("ProductList",productdao.getAllProduct());
		return "Adddata";

	}
	@RequestMapping(value="Adddata/deleteProduct/{prodId}")
	public String deleteProduct(@PathVariable("prodId") String prodId ,Model model)
	{
		model.addAttribute("product",productdao.productByid(prodId));
		productdao.deleteProduct(prodId);
		model.addAttribute("ProductList", productdao.getAllProduct());
		return "redirect:/Adddata";
		
	}
	
	@RequestMapping(value="Adddata/productByid/{prodId}")
	public String prodbyid(@PathVariable("prodId")String prodId, Model model)
	{

		model.addAttribute("product",productdao.productByid(prodId));
		model.addAttribute("ProductList",productdao.getAllProduct());
		return "Adddata";

	}
	

@RequestMapping(value="/Adddata/addSupplier",method=RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier s, Model model)
	{
		if(s.getSupId()==0)
		{
			supplierDao.addSupplier(s);
		}
		else
		{
			supplierDao.updateSupplier(s);
		}
		
		return "redirect:/Adddata";	
	}	
@RequestMapping(value="Adddata/updateSupplier/{supId}")
public String updateSupplier(@PathVariable("supId")int supid, Model model)
{

	model.addAttribute("supplier",supplierDao.supplierByid(supid));
	model.addAttribute("supplierList",supplierDao.getAllSupplier());
//	return "Adddata";
	return "redirect:/Adddata";
}
@RequestMapping(value="Adddata/deleteSupplier/{supId}")
public String deleteSupplier(@PathVariable("supId") int supid ,Model model)
{
	model.addAttribute("supplier",supplierDao.supplierByid(supid));
	supplierDao.deleteSupplier(supid);
	model.addAttribute("supplierList", supplierDao.getAllSupplier());
	return "redirect:/Adddata";
	
	

}
	
	
	
	
	
	
	
	
}
