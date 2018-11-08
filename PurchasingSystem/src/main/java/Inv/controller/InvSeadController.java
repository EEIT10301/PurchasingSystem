package Inv.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Account.service.Inv_ProductListService;
import Account.service.Inv＿ProductCheckService;
import Apply.service.EmployeeService;
import Inv.model.Inv_SigningProcessBean;
import Inv.service.Inv_SigningProcessService;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_MainService;
import Po.service.PO_SigningProcessService;

@Controller
public class InvSeadController {

	@Autowired
	Inv_SigningProcessService inv_SigningProcessService;
	@Autowired
	Inv_ProductListService inv_ProductListService;
	@Autowired
	PO_MainService po_MainService;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	Inv＿ProductCheckService inv＿ProductCheckService;
	@Autowired
	PO_SigningProcessService po_SigningProcessService;

	@RequestMapping("/Inv/changeinvprosta")
	public String changeinvprosta(Integer chk_Count, String chk_quality, Inv_ProductListBean prochkdatilbean,
			Inv＿ProductCheckBean prochkmain, Inv_SigningProcessBean bean, String chkstatus, Model model,
			HttpSession session, String chk_Id, String part_No) throws ParseException {
		Date date = new Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now = dateFormate.format(date1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date dates = sdf.parse(now);
		Inv＿ProductCheckBean invmain = inv＿ProductCheckService.select(chk_Id);
		Inv_SigningProcessBean secondsigningrocess1 = inv_SigningProcessService.select("驗收", chk_Id);
		Inv_ProductListBean secondsigningrocess = inv_ProductListService.select(chk_Id, part_No);
		System.out.println(secondsigningrocess.getChk_status());
		System.out.println(chkstatus);
		System.out.println("sss");
		model.addAttribute("secondsigningrocess", secondsigningrocess.getChk_status());
		
	
		
		if ("驗收成功".equals(chkstatus)) {
	    	secondsigningrocess.setChk_Count(chk_Count);
	    	secondsigningrocess.setChk_status("驗收成功");
	    	secondsigningrocess.setChk_Date(dates);
	    	secondsigningrocess.setChk_quality(chk_quality);
	    	secondsigningrocess1.setSig_Date(dates);	    	
	    	model.addAttribute("Inv_SigningProcessBean", secondsigningrocess1);	    
	    	model.addAttribute("invprolist",invmain);
			System.out.println("成功");
			return "Inv.sign";
		} else if ("驗收失敗".equals(chkstatus)) {
			secondsigningrocess1.setSig_Date(dates);
	    	secondsigningrocess1.setSig_Sta("驗收失敗");
	    	secondsigningrocess.setChk_status("驗收失敗");
	    	secondsigningrocess.setChk_quality(chk_quality);
	    	model.addAttribute("Inv_SigningProcessBean", secondsigningrocess1);
	    	model.addAttribute("invprolist",invmain);
			System.out.println("失敗");
			return "Inv.sign";
		} else {	 
//	    	secondsigningrocess.setChk_status(null);
	    	model.addAttribute("Inv_SigningProcessBean", secondsigningrocess1);
	    	model.addAttribute("invmain", invmain);
			System.out.println(chkstatus);
	    	System.out.println("沒值");
			return "Inv.sign";
		}
		
	}
	@RequestMapping("/Inv/invfinish")
	public String invfinisg(String chk_Id ,String sig_Sta,Model model,HttpSession session) {
		Inv_SigningProcessBean secondsigningrocess1 = inv_SigningProcessService.select("驗收", chk_Id);
		String po_id = "Po" + chk_Id.substring(2);
		PO_SigningProcessBean posecondsigningrocess = po_SigningProcessService.select("驗收中", po_id);
		if("驗收中".endsWith(sig_Sta)){
			secondsigningrocess1.setSig_Sta("驗收成功");
			posecondsigningrocess.setSig_sug("驗收完成未請款");
			return "Invlogin.success";
		}
		return "Invlogin.success";
	}
}
