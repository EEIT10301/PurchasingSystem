package Po.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Account.dao.Account_InvoiceIDao;
import Account.model.Account_InvoiceBean;
import Account.model.Account_SigningProcessBean;
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

		List<Account_InvoiceBean> InvoiceBack = pO_InvoiceService.find3(emp_id,"退回中",1);
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
	
	//採購主管查看要審核的該張請款單  
		@RequestMapping("/Po/SignInvoiceForm.controller")
		public String signInvoice(Model model ,HttpSession session ,String invid) {
			
			Account_InvoiceBean bean= account_InvoiceService.select(invid);
			PO_SigningProcessBean poSignBean = pO_SigningProcessIDao.select("驗收中", bean.getPo_id());
			String empid=bean.getEmp_id();
			String empdep=bean.getEmployeeBean().getEmp_dep();
			String ven_name=bean.getpO_MainBean().getpO_Vendor_InfoBean().getVendor_name();
			String ven_id=bean.getpO_MainBean().getVendor_ID();
			Integer price=bean.getTotal_price();
			String payMethod=bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_method();
			String paydate=pO_InvoiceService.calcExpirePaymentDate(bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term(),poSignBean.getSig_date());
			Date keyday=bean.getRecript_date();
			
			Set<Account_SigningProcessBean> selects = bean.getAccount_SigningProcessBean();
			for(Account_SigningProcessBean x:selects) {
				if(x.getSig_Rank()==1) {
				String sigSug=x.getSig_Sug();
				model.addAttribute("sigSug", sigSug);
				}
			}		

			List<EmployeeBean> employee=employeeService.selectPoEmployee("財務部", 2);
			
			model.addAttribute("bean", bean);
			model.addAttribute("empid", empid);
			model.addAttribute("empdep", empdep);
			model.addAttribute("ven_name", ven_name);
			model.addAttribute("ven_id", ven_id);
			model.addAttribute("price", price);
			model.addAttribute("payMethod", payMethod);
			model.addAttribute("paydate", paydate);
			model.addAttribute("keyday", keyday);
			model.addAttribute("manager", employee);
			model.addAttribute("invid", invid);
			return"updateForm";
		}
		//財務經理查看要分派的該張請款單  
		@RequestMapping("/Account/AccSignInvoiceForm.controller")
		public String signInvoiceAccMan(Model model ,HttpSession session ,String invid) {
			
			Account_InvoiceBean bean= account_InvoiceService.select(invid);
			PO_SigningProcessBean poSignBean = pO_SigningProcessIDao.select("驗收中", bean.getPo_id());
			String empid=bean.getEmp_id();
			String empdep=bean.getEmployeeBean().getEmp_dep();
			String ven_name=bean.getpO_MainBean().getpO_Vendor_InfoBean().getVendor_name();
			String ven_id=bean.getpO_MainBean().getVendor_ID();
			Integer price=bean.getTotal_price();
			String payMethod=bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_method();
			String paydate=pO_InvoiceService.calcExpirePaymentDate(bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term(),poSignBean.getSig_date());
			Date keyday=bean.getRecript_date();
			
			Set<Account_SigningProcessBean> selects = bean.getAccount_SigningProcessBean();
			for(Account_SigningProcessBean x:selects) {
				if(x.getSig_Rank()==2) {
					String sigSug=x.getSig_Sug();
					model.addAttribute("sigSug", sigSug);
				}
			}		
			
			List<EmployeeBean> employee=employeeService.selectPoEmployee("財務部", 1);
			
			model.addAttribute("bean", bean);
			model.addAttribute("empid", empid);
			model.addAttribute("empdep", empdep);
			model.addAttribute("ven_name", ven_name);
			model.addAttribute("ven_id", ven_id);
			model.addAttribute("price", price);
			model.addAttribute("payMethod", payMethod);
			model.addAttribute("paydate", paydate);
			model.addAttribute("keyday", keyday);
			model.addAttribute("manager", employee);
			model.addAttribute("invid", invid);
			return"updateForm";
		}
		
		//財務經理查看要簽核的該張請款單  
		@RequestMapping("/Account/AccSignInvForm.controller")
		public String signInvAccMan(Model model ,HttpSession session ,String invid) {
			
			Account_InvoiceBean bean= account_InvoiceService.select(invid);
			PO_SigningProcessBean poSignBean = pO_SigningProcessIDao.select("驗收中", bean.getPo_id());
			String empid=bean.getEmp_id();
			String empdep=bean.getEmployeeBean().getEmp_dep();
			String ven_name=bean.getpO_MainBean().getpO_Vendor_InfoBean().getVendor_name();
			String ven_id=bean.getpO_MainBean().getVendor_ID();
			Integer price=bean.getTotal_price();
			String payMethod=bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_method();
			String paydate=pO_InvoiceService.calcExpirePaymentDate(bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term(),poSignBean.getSig_date());
			Date keyday=bean.getRecript_date();
			
			Set<Account_SigningProcessBean> selects = bean.getAccount_SigningProcessBean();
			for(Account_SigningProcessBean x:selects) {
				if(x.getSig_Rank()==4) {
					String sigSug=x.getSig_Sug();
					model.addAttribute("sigSug", sigSug);
				}
			}		
			
			List<EmployeeBean> employee=null;
			
			model.addAttribute("bean", bean);
			model.addAttribute("empid", empid);
			model.addAttribute("empdep", empdep);
			model.addAttribute("ven_name", ven_name);
			model.addAttribute("ven_id", ven_id);
			model.addAttribute("price", price);
			model.addAttribute("payMethod", payMethod);
			model.addAttribute("paydate", paydate);
			model.addAttribute("keyday", keyday);
			model.addAttribute("manager", employee);
			model.addAttribute("invid", invid);
			return"updateForm";
		}
		
		//財務查看被分派的該張請款單  
		@RequestMapping("/Account/AccSignInvlevel1.controller")
		public String signInvAcc(Model model ,HttpSession session ,String invid) {
			
			Account_InvoiceBean bean= account_InvoiceService.select(invid);
			PO_SigningProcessBean poSignBean = pO_SigningProcessIDao.select("驗收中", bean.getPo_id());
			String empid=bean.getEmp_id();
			String empdep=bean.getEmployeeBean().getEmp_dep();
			String ven_name=bean.getpO_MainBean().getpO_Vendor_InfoBean().getVendor_name();
			String ven_id=bean.getpO_MainBean().getVendor_ID();
			Integer price=bean.getTotal_price();
			String payMethod=bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_method();
			String paydate=pO_InvoiceService.calcExpirePaymentDate(bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term(),poSignBean.getSig_date());
			Date keyday=bean.getRecript_date();
			
			Set<Account_SigningProcessBean> selects = bean.getAccount_SigningProcessBean();
			for(Account_SigningProcessBean x:selects) {
				if(x.getSig_Rank()==3) {
					String sigSug=x.getSig_Sug();
					model.addAttribute("sigSug", sigSug);
				}
			}		
			
			List<EmployeeBean> employee=null;
			
			model.addAttribute("bean", bean);
			model.addAttribute("empid", empid);
			model.addAttribute("empdep", empdep);
			model.addAttribute("ven_name", ven_name);
			model.addAttribute("ven_id", ven_id);
			model.addAttribute("price", price);
			model.addAttribute("payMethod", payMethod);
			model.addAttribute("paydate", paydate);
			model.addAttribute("keyday", keyday);
			model.addAttribute("manager", employee);
			model.addAttribute("invid", invid);
			return"updateForm";
		}
	//財務主管查詢待分派的請款單
		@RequestMapping("/Account/ToDoAssignInvoice.controller")
		public String queryHaveToAssign(Model model ,HttpSession session) {
			EmployeeBean empbean = (EmployeeBean)session.getAttribute("user");
			String emp_id=empbean.getEmp_id();
			String sig_sta="分派中"; //財務經理自己的狀態是分派中(前一關送出並更新主管為"分派中")

			List<Account_InvoiceBean> haveToAssign = pO_InvoiceService.findProcessCorrect(emp_id,sig_sta ,3);
				model.addAttribute("list", haveToAssign);

				return "assignInv.show";
		}
		
	//財務主管查詢待簽核的請款單
		@RequestMapping("/Account/ToDoSignInvoice.controller")
		public String queryHaveToSign(Model model ,HttpSession session) {
			EmployeeBean empbean = (EmployeeBean)session.getAttribute("user");
			String emp_id=empbean.getEmp_id();
			String sig_sta="簽核中"; //財務經理自己的狀態是簽核中(前一關送出並更新主管為"簽核中")

			List<Account_InvoiceBean> haveToSign = pO_InvoiceService.findProcessCorrect(emp_id,sig_sta ,5);
				model.addAttribute("list", haveToSign);

				return "signInv.show";
		}
		//財務查詢被分派的請款單
		@RequestMapping("/Account/ToDoSignlevel1.controller")
		public String queryHaveToSignlevel1(Model model ,HttpSession session) {
			EmployeeBean empbean = (EmployeeBean)session.getAttribute("user");
			String emp_id=empbean.getEmp_id();
			String sig_sta="簽核中"; //財務自己的狀態是簽核中(前一關送出並更新財務為"簽核中")
			
			List<Account_InvoiceBean> haveToSign = pO_InvoiceService.findProcessCorrect(emp_id,sig_sta ,4);
			model.addAttribute("list", haveToSign);
			
			return "signInv.show";
		}

		//新增請款單送出寫入資料庫
	@RequestMapping(value = "/Po/onloadimage.controller", method = RequestMethod.POST)
	public String uploadFile(Model model ,HttpSession session,String name,@RequestParam("Receiptpic") MultipartFile file
		,String Emp_id,String Emp_dep, String Vendor_name, String Vendor_id, String Total_price, 
		String Except_Payment_Date, String Recript_date, String selectPOManager, String SignSug,String poid,HttpServletRequest request) throws IllegalStateException, IOException, ParseException {
	
	//上傳圖片	
	String invId="In"+poid.substring(2);
	//String destination ="C:\\Users\\User\\git\\repository2\\PurchasingSystem\\src\\main\\webapp\\images"+"\\"+invId+".jpg";
	String destination ="D:\\Maven-project\\repository\\PurchasingSystem\\PurchasingSystem\\src\\main\\webapp\\images"+"\\"+invId+".jpg";
	//String destination = "images/"+invId+".jpg";
    //System.out.println("uploadRootPath=" + destination);
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
	//採購承辦重送請款單
	@RequestMapping(value = "/Po/resendInvoiceforBuyer.controller", method = RequestMethod.POST)
	public String resend(Account_InvoiceBean account_InvoiceBean,Model model ,HttpSession session,String name,@RequestParam("Receiptpic") MultipartFile file
		,String selectPOManager, String poid,HttpServletRequest request,Integer sig_Rank, String SignSug ) throws IllegalStateException, IOException, ParseException {
	
	//上傳圖片	
	String invId="In"+account_InvoiceBean.getPo_id().substring(2);
	//String destination ="C:\\Users\\User\\git\\repository2\\PurchasingSystem\\src\\main\\webapp\\images"+"\\"+invId+".jpg";
	String destination ="D:\\Maven-project\\repository\\PurchasingSystem\\PurchasingSystem\\src\\main\\webapp\\images"+"\\"+invId+".jpg";
	//String destination = "images/"+invId+".jpg";
    System.out.println("uploadRootPath=" + destination);
	if(file !=null || file.getSize()>0) {
	File files =new File(destination);
	file.transferTo(files);}
	
	//update請款單
	Account_InvoiceBean result = pO_InvoiceService.updateInvoiceData(account_InvoiceBean);
	if(result!=null) {
		model.addAttribute("successmeg", "重新送出成功");
		model.addAttribute("inv_id", invId);
	}else {
		model.addAttribute("errormeg", "重新送出失敗");
	}
	//update  請款單簽核流程
	String sig_Sta1="已申請";
	String sig_Sta2="簽核中";
	pO_InvoiceService.updateAccountSigningProcess(invId, sig_Rank, sig_Sta1, sig_Sta2, SignSug);
	return "TodoInvoiceList";
}
	
}
