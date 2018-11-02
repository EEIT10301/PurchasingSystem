package Inv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.service.Inv_ProductListService;
import Inv.model.Inv_DetailBean;
import Inv.service.AdditemServie;
import Inv.service.Inv_DetailService;




@Controller
public class WareHouseController {
	@Autowired
	Inv_ProductListService inv_ProductListService;
	@Autowired
	AdditemServie additemServie;
	@Autowired
	Inv_DetailService inv_Detailservice;
	@RequestMapping("/Inv/item")
	public String Allitem(Model model) {
		System.out.println("這是庫存顯示controller");
     	List<Inv_DetailBean> bean = inv_Detailservice.select();


		model.addAttribute("ss",bean);
		return "invend.item";	
		
	}
	
	@RequestMapping("/Inv/itemin")
	private String Itemin(Model model,String number) {
		System.out.println("這是庫存增加controller");
//		 inv_ProductListService.select(chk_Id, part_No);
		
		
		
		

	
		
		return "invend.itemin";

	}
	
}
