package Po.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import Apply.model.EmployeeBean;
import Po.model.PO_MainBean;
import Po.service.PO_InvoiceService;
import Po.service.PO_MainService;


@Controller
public class POInvoiceController {

	@Autowired
	PO_InvoiceService pO_InvoiceService;
	@Autowired
	PO_MainService pO_MainService;
   
	@RequestMapping("/Po/Polist.controller")
	public String queryNoInvoiceList(PO_MainBean bean,Model model ,HttpSession session) {
		EmployeeBean empbean = (EmployeeBean)session.getAttribute("user");
		String emp_id=empbean.getEmp_id();
		String sig_sta="驗收完成未請款";
		List<PO_MainBean> NoInvoiceList = pO_InvoiceService.find(emp_id, sig_sta);
			model.addAttribute("list", NoInvoiceList);
			return "TodoInvoiceList";
	}
	
	@RequestMapping("/Po/NewInvoiceForm.controller")
	public String poNew(Model model ,HttpSession session,String poid ) {
		
		PO_MainBean bean=pO_MainService.select(poid);
		String date = pO_InvoiceService.calcExpirePaymentDate(bean.getpO_Vendor_InfoBean().getPayment_term());
		model.addAttribute("bean", bean);
		model.addAttribute("paymentDate", date);
		return"newForm";
	}
	
}
