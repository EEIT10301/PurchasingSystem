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
import Po.dao.PO_SigningProcessIDao;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;
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
	@Autowired
	PO_SigningProcessIDao pO_SigningProcessIDao;
   

	//查詢待請款採購單及退回請款單
	@RequestMapping("/Po/Polist.controller")
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
	
	//新增請款單顯示採購單畫面
	@RequestMapping("/Po/NewInvoiceForm.controller")
	public String poNew(Model model ,HttpSession session,String poid ,String invid) {
		
		PO_MainBean bean=pO_MainService.select(poid);
		PO_SigningProcessBean poSignBean = pO_SigningProcessIDao.select("驗收中", poid);
		String date = pO_InvoiceService.calcExpirePaymentDate(bean.getpO_Vendor_InfoBean().getPayment_term(),poSignBean.getSig_date());
		List<EmployeeBean> employee=employeeService.selectPoEmployee("採購部", 2);
		model.addAttribute("bean", bean);
		model.addAttribute("paymentDate", date);
		model.addAttribute("manager", employee);
		model.addAttribute("poid", poid);
		return"newForm";
	}

		//新增請款單送出寫入資料庫
	@RequestMapping(value = "/Po/onloadimage.controller", method = RequestMethod.POST)
	public String uploadFile(Model model ,HttpSession session,String name,@RequestParam("Receiptpic") MultipartFile file
		,String Emp_id,String Emp_dep, String Vendor_name, String Vendor_id, String Total_price, 
		String Except_Payment_Date, String Recript_date, String selectPOManager, String SignSug,String poid) throws IllegalStateException, IOException, ParseException {
	
	//上傳圖片	
	String invId="In"+poid.substring(2);
	//String destination ="C:\\Users\\User\\git\\repository2\\PurchasingSystem\\src\\main\\webapp\\images"+"\\"+invId+".jpg";
	String destination ="D:\\Maven-project\\repository\\PurchasingSystem\\PurchasingSystem\\src\\main\\webapp\\images"+"\\"+invId+".jpg";
	if(file !=null || file.getSize()>0) {
	File files =new File(destination);
	file.transferTo(files);}
	
	//insert 請款單
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date date = sdf.parse(Recript_date);
    String src="/images/"+invId+".jpg";
    Integer price=Integer.valueOf(Total_price);
	Account_InvoiceBean account_InvoiceBean=new Account_InvoiceBean(invId,date,src,poid,Emp_id,price);
			Account_InvoiceBean result = account_InvoiceService.insert(account_InvoiceBean);
	if(result!=null) {
		model.addAttribute("successmeg", "新增成功");
		model.addAttribute("inv_id", invId);
	}else {
		model.addAttribute("errormeg", "新增失敗");
	}
	//insert 請款單流程
			pO_InvoiceService.insertAccountSigningProcess(invId, Emp_id, selectPOManager, SignSug);
	
	//update 採款單請款作業簽核流程
			pO_InvoiceService.updatePoSigningProcess(poid, SignSug);

	return "TodoInvoiceList";
}
}
