package Po.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Account_InvoiceBean;
import Po.service.PO_MainService;

@Controller
public class POListController {

	@Autowired
	PO_MainService pO_MainService;
	
   
	@RequestMapping("/Po/Polist.controller")
	public String accountSigner(Account_InvoiceBean bean,BindingResult bindingResult,
			Model model ,HttpSession session,String send,String SignSug) {
			
			
		
			return "TodoInvoiceList";
	}
}
