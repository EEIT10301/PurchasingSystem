package Po.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Account.model.Account_InvoiceBean;
import Account.service.Account_InvoiceService;
import Apply.model.EmployeeBean;
import Apply.service.EmployeeService;
import Po.model.PO_MainBean;
import Po.service.PO_InvoiceService;
import Po.service.PO_MainService;


@Controller
public class POInvoiceController {

	@Autowired
	PO_InvoiceService pO_InvoiceService;
	@Autowired
	PO_MainService pO_MainService;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	Account_InvoiceService account_InvoiceService;
   
	@RequestMapping("/Po/Polist.controller") //找驗收完成未請款的單+被退回的單
	public String queryNoInvoiceList(PO_MainBean bean,Model model ,HttpSession session) {
		EmployeeBean empbean = (EmployeeBean)session.getAttribute("user");
		String emp_id=empbean.getEmp_id();
		String sig_sta="驗收完成未請款";
		List<PO_MainBean> NoInvoiceList = pO_InvoiceService.find(emp_id, sig_sta);
			model.addAttribute("list", NoInvoiceList);

		List<Account_InvoiceBean> InvoiceBack = pO_InvoiceService.find3(emp_id,"退回中" ,1);
			model.addAttribute("listback", InvoiceBack);

			return "TodoInvoiceList";
	}
	
	@RequestMapping("/Po/NewInvoiceForm.controller")
	public String poNew(Model model ,HttpSession session,String poid ,String invid) {
		
		PO_MainBean bean=pO_MainService.select(poid);
		String date = pO_InvoiceService.calcExpirePaymentDate(bean.getpO_Vendor_InfoBean().getPayment_term());
		List<EmployeeBean> employee=employeeService.selectPoEmployee("採購部", 2);
		
		model.addAttribute("bean", bean);
		model.addAttribute("paymentDate", date);
		model.addAttribute("manager", employee);
		model.addAttribute("poid", poid);
		return"newForm";
	}

	@RequestMapping(value = "/Po/onloadimage.controller", method = RequestMethod.POST)
	public String uploadFile(Model model ,HttpSession session,String name,@RequestParam("Receiptpic") MultipartFile file
		,String Emp_id,String Emp_dep, String Vendor_name, String Vendor_id, String Total_price, 
		String Except_Payment_Date, String Recript_date, String selectPOManager, String SignSug,String poid) throws IllegalStateException, IOException, ParseException {
	
	//上傳圖片	
	String invId="In"+poid.substring(2);
	String destination ="C:\\Users\\User\\git\\repository2\\PurchasingSystem\\src\\main\\webapp\\images"+"\\"+invId+".jpg";
	File files =new File(destination);
	file.transferTo(files);
	
	//insert 請款單
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date date = sdf.parse(Recript_date);
    String src="/images/"+invId+".jpg";
    Integer price=Integer.valueOf(Total_price);
	Account_InvoiceBean account_InvoiceBean=new Account_InvoiceBean(invId,date,src,poid,Emp_id,price);
			account_InvoiceService.insert(account_InvoiceBean);
	
	//insert 請款單流程
			
			

	return "";
}
}
