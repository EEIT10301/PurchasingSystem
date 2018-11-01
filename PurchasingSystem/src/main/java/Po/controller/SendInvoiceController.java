package Po.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.service.Account_InvoiceService;

@Controller
public class SendInvoiceController {

	@Autowired
	Account_InvoiceService account_InvoiceService;
	
	@RequestMapping("/Po/SendInvoice.controller")
	public String upload(Model model, HttpSession session,String pic) {
		
		
		return "";
	}
}
