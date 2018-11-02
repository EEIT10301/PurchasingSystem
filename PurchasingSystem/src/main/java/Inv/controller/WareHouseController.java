package Inv.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Account.service.Inv_ProductListService;
import Apply.model.AppDetailBean;
import Apply.model.App_MainBean;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Apply.model.ProductListBean;
import Apply.service.App_MainService;
import Apply.service.App_SigningProcessService;
import Inv.model.Inv_DetailBean;
import Inv.service.AdditemServie;
import Inv.service.Inv_Detailservice;
import Po.model.PO_DetailBean;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_DetailService;
import Po.service.PO_MainService;
import Po.service.PO_SigningProcessService;



@Controller
public class WareHouseController {
	@Autowired
	Inv_ProductListService inv_ProductListService;
	@Autowired
	AdditemServie additemServie;
	@Autowired
	Inv_Detailservice inv_Detailservice;
	@RequestMapping("/Inv/item")
	public String Allitem(Model model) {
		System.out.println("這是庫存顯示controller");
     	List<Inv_DetailBean> bean = inv_Detailservice.find();


		model.addAttribute("ss",bean);
		return "invend.item";	
		
	}
	
	@RequestMapping("/Inv/itemin")
	private String Itemin(Model model,String number) {
		System.out.println("這是庫存增加controller");
		List<Inv_ProductListBean> check = inv_ProductListService.select();
		for(int i=0;i<check.size();i++) {
			Inv_ProductListBean aa = check.get(i);
			System.out.println(aa.getPart_No());
		}
		
		
		

	
		
		return "invend.itemin";

	}
	
}
