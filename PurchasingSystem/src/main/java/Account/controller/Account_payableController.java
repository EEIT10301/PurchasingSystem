package Account.controller;

import java.text.SimpleDateFormat;
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
		if (list != null) {
			model.addAttribute("allpayablelist", list);
		}
		return "queryAccountPayable";
		
	}
	//點選請款單單號可顯示請款單資料
	@RequestMapping("/Account/ShowInvoice.controller")
	public String showInvoiceData(Model model, HttpSession session, String invid) {
		Account_InvoiceBean result = account_InvoiceService.select(invid);
		if(result !=null) {
			model.addAttribute("invoice",result);
		}
		return "queryInvoice";
	}
	//以廠商名稱做查詢條件
	//以付款方式做查詢條件
	//以預計付款日期間做查詢條件
	//產生excel檔
	//產生pdf檔
	}
