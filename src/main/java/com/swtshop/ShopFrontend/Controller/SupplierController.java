package com.swtshop.ShopFrontend.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swtshop.ShopBackend.dao.SupplierDao;
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
@RequestMapping(value="/updateSupplier/{supId}")
public String updateSupplier(@PathVariable("supId")int supid, Model model)
{

	model.addAttribute("supplier",supplierDao.supplierByid(supid));
	model.addAttribute("supplierList",supplierDao.getAllSupplier());
	return "Supplier";

}
@RequestMapping(value="/deleteSupplier/{supId}")
public String deleteSupplier(@PathVariable("supId") int supid ,Model model)
{
	model.addAttribute("supplier",supplierDao.supplierByid(supid));
	supplierDao.deleteSupplier(supid);
	model.addAttribute("supplierList", supplierDao.getAllSupplier());
	return "redirect:/Supplier";
	
	

}
}
