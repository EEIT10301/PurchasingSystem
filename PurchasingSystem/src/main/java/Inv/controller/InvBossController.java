package Inv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Inv＿ProductCheckBean;
import Account.service.Inv＿ProductCheckService;

@Controller
public class InvBossController {
	@Autowired
	Inv＿ProductCheckService inv＿ProductCheckService;
	@RequestMapping("/Inv/singcheck")
	public String CheckSingingComment(Model model) {
		List<Inv＿ProductCheckBean> check = inv＿ProductCheckService.select();
		model.addAttribute("checkBean", check);		
		return "InvSinging.go";
	}
	@RequestMapping("/Inv/singstatus")
	public String SingingStatus(Model model ,String ChPK) {
		System.out.println(ChPK);
		Inv＿ProductCheckBean checkbean = inv＿ProductCheckService.select(ChPK);
		model.addAttribute("checkbean", checkbean);
		return "InvViewSing.show";
	}
}
