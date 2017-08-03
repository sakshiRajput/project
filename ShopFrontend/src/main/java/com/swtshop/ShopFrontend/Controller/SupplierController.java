package com.swtshop.ShopFrontend.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swtshop.ShopBackend.dao.SupplierDao;
import com.swtshop.ShopBackend.model.Category;
import com.swtshop.ShopBackend.model.Supplier;

@Controller
public class SupplierController {
	
	
	@Autowired
	SupplierDao supplierDao;
	
@RequestMapping(value="/addSupplier",method=RequestMethod.POST)
	
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
		
		return "redirect:/Supplier";	
	}	
	





}
