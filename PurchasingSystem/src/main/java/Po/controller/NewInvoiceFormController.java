package Po.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Po.model.PO_MainBean;
import Po.service.PO_MainService;

@Controller
public class NewInvoiceFormController {

	@Autowired
	PO_MainService pO_MainService;
	
	@RequestMapping("/Po/NewInvoiceForm.controller")
	public String poNew(Model model ,HttpSession session,String poid ) {
		
		PO_MainBean bean=pO_MainService.select(poid);
		model.addAttribute("bean", bean);
		
		return"newForm";
	}
}
