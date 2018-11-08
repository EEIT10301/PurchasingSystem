package Account.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Account_InvoiceBean;
import Account.model.Accout_PayableBean;
import Account.service.Account_InvoiceService;
import Account.service.Accout_PayableService;


@Controller
public class Account_payableController {
	@Autowired
	Accout_PayableService accout_PayableService;
	@Autowired
	Account_InvoiceService account_InvoiceService;
	
	//顯示所有應付款資料
	@RequestMapping("/Account/ShowAccountPayableList.controller")
	public String showAccountPayableDataByAll(Model model) {
		List<Accout_PayableBean> list = accout_PayableService.select();
		model.addAttribute("allPayableList", list);
		return "queryAccountPayable";
		
	}
	//點選請款單單號可顯示請款單資料
	@RequestMapping("/Account/ShowInvoice.controller")
	public String showInvoiceData(Model model, HttpSession session, String invid) {
		Account_InvoiceBean result = account_InvoiceService.select(invid);
		String picName=result.getRecript_pic().substring(8);
		model.addAttribute("invoiceData",result);
		model.addAttribute("picName",picName);
		return "queryInvoice";
	}
	
	//產生excel檔
	
	
	
	//產生pdf檔
	}
