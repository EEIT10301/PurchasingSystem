package Po.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.json.JSONArray;
import org.json.JSONObject;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import Account.model.Account_InvoiceBean;
import Account.model.Account_SigningProcessBean;
import Account.service.Account_InvoiceService;
import Account.service.Accout_PayableService;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Apply.service.EmployeeService;
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
	Accout_PayableService accout_PayableService;
	

	
	
	

//	@InitBinder
//	public void registerPropertyEditor(WebDataBinder dataBinder) {
//		dataBinder.registerCustomEditor(java.util.Date.class,
//				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), false));
//		dataBinder.registerCustomEditor(Integer.class, "Total_price", new CustomNumberEditor(Integer.class, false));
//	}

	// 採購承辦查詢待請款採購單及退回請款單
	@RequestMapping("/Po/Polist.controller")
	public String queryNoInvoiceList(PO_MainBean bean, Model model, HttpSession session) {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String emp_id = empbean.getEmp_id();
		String poSignProcess_sig_sta = "驗收完成未請款";
		String accountSignProcess_sig_sta = "退回中";
		Integer rank = 1;
		List<PO_MainBean> noInvoiceList = pO_InvoiceService.findNeedApplicationInvoice(emp_id, poSignProcess_sig_sta);
		model.addAttribute("list", noInvoiceList);
		List<Account_InvoiceBean> invoiceBack = pO_InvoiceService.findProcessCorrect(emp_id, accountSignProcess_sig_sta,
				rank);
		model.addAttribute("listback", invoiceBack);
		return "TodoInvoiceList";
	}

	// 採購承辦新增請款單顯示採購單畫面
	@RequestMapping("/Po/NewInvoiceForm.controller")
	public String poNew(Model model, HttpSession session, String poid, String invid) {
		PO_MainBean bean = pO_MainService.select(poid);
		PO_SigningProcessBean poSignBean = pO_InvoiceService.selectForOneProcessbyPoSign("驗收作業", poid);
		String date = pO_InvoiceService.calcExpirePaymentDate(bean.getpO_Vendor_InfoBean().getPayment_term(),
				poSignBean.getSig_date());
		List<EmployeeBean> employee = employeeService.selectPoEmployee("採購部", 2);
		model.addAttribute("bean", bean);
		model.addAttribute("paymentDate", date);
		model.addAttribute("manager", employee);
		model.addAttribute("poid", poid);
		return "newForm";
	}

	// 採購承辦顯示退回請款單資料畫面
	@RequestMapping("/Po/ShowReturnInvoiceForm.controller")
	public String showReturnInvoice(Model model, HttpSession session, String poid) {
		String invId = "In" + poid.substring(2);
		Account_InvoiceBean accountInvoiceBean = pO_InvoiceService.selectInvoice(invId);
		PO_MainBean poMainBean = pO_MainService.select(poid);
		PO_SigningProcessBean poSignBean = pO_InvoiceService.selectForOneProcessbyPoSign("驗收作業", poid);
		String sigman = pO_InvoiceService.selectForOneProcessbyAccountSign(invId, 2).getEmployeeBean().getEmp_name();
		String sigSug = pO_InvoiceService.selectForOneProcessbyAccountSign(invId, 2).getSig_Sug();
		Date sigtime = pO_InvoiceService.selectForOneProcessbyAccountSign(invId, 2).getSig_Date();
		String date = pO_InvoiceService.calcExpirePaymentDate(poMainBean.getpO_Vendor_InfoBean().getPayment_term(),
				poSignBean.getSig_date());
		String oldRecript_date = new SimpleDateFormat("yyyy/MM/dd").format(accountInvoiceBean.getRecript_date());
		String recript_pic = accountInvoiceBean.getRecript_pic();
		String picName = recript_pic.substring(8);
		List<EmployeeBean> employee = employeeService.selectPoEmployee("採購部", 2);
		if (accountInvoiceBean != null) {
			model.addAttribute("invoice", accountInvoiceBean);
			model.addAttribute("pomain", poMainBean);
			model.addAttribute("paymentDate", date);
			model.addAttribute("oldRecript_date", oldRecript_date);
			model.addAttribute("manager", employee);
			model.addAttribute("poid", poid);
			model.addAttribute("sigman", sigman);
			model.addAttribute("sigSug", sigSug);
			model.addAttribute("sigtime", sigtime);
			model.addAttribute("recript_pic", recript_pic);
			model.addAttribute("picName", picName);
		}
		return "updateForm";
	}

	// 採購承辦新增請款單送出寫入資料庫
	@RequestMapping(value = "/Po/onloadimage.controller", method = RequestMethod.POST)
	public String uploadFile(Model model, HttpSession session, String name,
			@RequestParam("Receiptpic") MultipartFile file, String Emp_id, String Emp_dep, String Vendor_name,
			String Vendor_id, String Total_price, String Except_Payment_Date, String Recript_date,
			String selectPOManager, String SignSug, String poid, HttpServletRequest request)
			throws IllegalStateException, IOException, ParseException {
		// 上傳圖片
		String invId = "In" + poid.substring(2);
//		String destination="C:\\Users\\User\\Downloads\\PurchasingSystem\\PurchasingSystem\\src\\main\\webapp\\images"+"\\"+invId+".jpg";
//		String destination = "D:\\Maven-project\\repository\\PurchasingSystem\\src\\main\\webapp\\images"
//				+ "\\" + invId + ".jpg";
//		// String destination = "\\"+"images"+"\\"+invId+".jpg";
//		String destination ="C:\\Users\\timmy\\git\\repository\\PurchasingSystem\\src\\main\\webapp\\images"+ "\\" + invId + ".jpg";
		String destination =request.getSession().getServletContext().getRealPath("images")+"\\"+invId+".jpg";
//		String destination ="C:\\Users\\Tony\\Downloads\\PurchasingSystem\\PurchasingSystem\\src\\main\\webapp\\images"+"\\"+invId+".jpg";

		System.out.println(destination);
		if (file != null && file.getSize() > 0) {
			File files = new File(destination);
			file.transferTo(files);
		}

		// insert 請款單
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(Recript_date);
		String src = "/images/" + invId + ".jpg";
		Integer price = Integer.valueOf(Total_price);
		Account_InvoiceBean account_InvoiceBean = new Account_InvoiceBean(invId, date, src, poid, Emp_id, price);
		Account_InvoiceBean result = account_InvoiceService.insert(account_InvoiceBean);
		if (result != null) {
			model.addAttribute("successmeg", "3");
			model.addAttribute("inv_id", invId);
		} else {
			model.addAttribute("errormeg", "4");
		}
		// insert 請款單流程
		pO_InvoiceService.insertAccountSigningProcess(invId, Emp_id, selectPOManager, SignSug);

		// update 採購單請款作業簽核流程
		pO_InvoiceService.updatePoSigningProcess(poid, SignSug, "請款中");
		
		//送出email通知下一關
//		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
//		String email = employeeService.select(empbean.getEmp_managerid()).getEmp_email();
//		String subject = "請款單簽核通知";
//
//		String text = "您有一張待簽核的請款單"+"(單號為:"+invId+")請點下列連結登入：http://localhost:8080/PurchasingSystem/MainPage.jsp";
//		misc.AutoSendEmailByJava.processMemberWishNotice(email, subject, text);

		return "newForm";
	}

	// 採購承辦重送請款單
	@RequestMapping(value = "/Po/resendInvoice.controller", method = RequestMethod.POST)
	public String resend(Model model, HttpSession session, String name, @RequestParam("Receiptpic") MultipartFile file,
			String selectPOManager, String poid, HttpServletRequest request, Integer sig_Rank, String SignSug,
			String Recript_date,String xxzs) throws IllegalStateException, IOException, ParseException {

		// 上傳圖片
		String invId = "In" + poid.substring(2);
//		 String destination
//		 ="C:\\Users\\User\\Downloads\\PurchasingSystem\\PurchasingSystem\\src\\main\\webapp\\images"+"\\"+invId+".jpg";
//		String destination = "D:\\Maven-project\\repository\\PurchasingSystem\\src\\main\\webapp\\images"
//				+ "\\" + invId + ".jpg";
//		String destination = "C:\\Users\\jonat\\Downloads\\PurchasingSystem\\PurchasingSystem\\src\\main\\webapp\\images"
//				+ "\\" + invId + ".jpg";
//		String destination ="C:\\Users\\timmy\\git\\repository\\PurchasingSystem\\src\\main\\webapp\\images"+ "\\" + invId + ".jpg";
		String destination =request.getSession().getServletContext().getRealPath("images")+"\\"+invId+".jpg";
		// String destination = "images/"+invId+".jpg";
		System.out.println("uploadRootPath=" + destination);
		if (file != null && file.getSize() > 0) {
			File files = new File(destination);
			file.transferTo(files);
		}

		// update請款單
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Account_InvoiceBean accbean = account_InvoiceService.select(invId);
		Date date = null;
		int xs=0;
		try {
			
			 date = sdf.parse(Recript_date);
		}catch( ParseException e){
			xs++;
		}
		if(xs==0) {
			accbean.setRecript_date(date);
		}
		Account_InvoiceBean result = pO_InvoiceService.updateInvoiceData(accbean);
		if (result != null) {
			model.addAttribute("successmeg", "1");
			model.addAttribute("inv_id", invId);
		} else {
			model.addAttribute("errormeg", "2");
		}
		// update 請款單簽核流程
		String sig_Sta1 = "已申請";
		String sig_Sta2 = "簽核中";
		pO_InvoiceService.updateAccountSigningProcess(invId, sig_Rank, sig_Sta1, sig_Sta2, SignSug, selectPOManager);
		
		//送出email通知下一關
//				Account_SigningProcessBean bean = pO_InvoiceService.selectForOneProcessbyAccountSign(invId, 2);
//				String email = bean.getEmployeeBean().getEmp_email();
//				String subject = "請款單簽核通知";
//				String text = "您有一張待簽核的請款單"+"(單號為:"+invId+")請點下列連結登入：http://localhost:8080/PurchasingSystem/MainPage.jsp";
//				misc.AutoSendEmailByJava.processMemberWishNotice(email, subject, text);
		return "updateForm";
	}

	// 採購主管查看要審核的該張請款單
	@RequestMapping("/Po/SignInvoiceForm.controller")
	public String signInvoice(Model model, HttpSession session, String invid) {
		Account_InvoiceBean bean = account_InvoiceService.select(invid);
		PO_SigningProcessBean poSignBean = pO_InvoiceService.selectForOneProcessbyPoSign("驗收作業", bean.getPo_id());
		String empid = bean.getEmployeeBean().getEmp_name();
		String empdep = bean.getEmployeeBean().getEmp_dep();
		String ven_name = bean.getpO_MainBean().getpO_Vendor_InfoBean().getVendor_name();
		String ven_id = bean.getpO_MainBean().getVendor_ID();
		Integer price = bean.getTotal_price();
		String payMethod = bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_method();
		String paydate = pO_InvoiceService.calcExpirePaymentDate(
				bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term(), poSignBean.getSig_date());
		String keyday = new SimpleDateFormat("yyyy/MM/dd").format(bean.getRecript_date());
		String recript_pic = bean.getRecript_pic();
		String picName = recript_pic.substring(8);
		List<Account_SigningProcessBean> sug = pO_InvoiceService.selectInvidAndRankLower(invid, 2);
		model.addAttribute("sug", sug);

		List<EmployeeBean> employee = employeeService.selectPoEmployee("財務部", 2);
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
		model.addAttribute("recript_pic", recript_pic);
		model.addAttribute("picName", picName);
		model.addAttribute("status", "review");
		return "updateForm";
	}

	// 採購主管查看要審核的該張被退請款單
	@RequestMapping("/Po/SignInvoiceFormBack.controller")
	public String signInvoiceBack(Model model, HttpSession session, String invid) {

		Account_InvoiceBean bean = account_InvoiceService.select(invid);
		PO_SigningProcessBean poSignBean = pO_InvoiceService.selectForOneProcessbyPoSign("驗收作業", bean.getPo_id());
		String empid = bean.getEmployeeBean().getEmp_name();
		String empdep = bean.getEmployeeBean().getEmp_dep();
		String ven_name = bean.getpO_MainBean().getpO_Vendor_InfoBean().getVendor_name();
		String ven_id = bean.getpO_MainBean().getVendor_ID();
		Integer price = bean.getTotal_price();
		String payMethod = bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_method();
		String paydate = pO_InvoiceService.calcExpirePaymentDate(
				bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term(), poSignBean.getSig_date());
		String keyday = new SimpleDateFormat("yyyy/MM/dd").format(bean.getRecript_date());
		String recript_pic = bean.getRecript_pic();
		String picName = recript_pic.substring(8);
		Set<Account_SigningProcessBean> selects = bean.getAccount_SigningProcessBean();
		for (Account_SigningProcessBean x : selects) {
			if (x.getSig_Rank() == 4) { // 要看財務承辦的退回原因(第四關)
				String sigman=x.getEmployeeBean().getEmp_name();
				String sigSug = x.getSig_Sug();
				Date sigtime=x.getSig_Date();
				model.addAttribute("sigman", sigman);
				model.addAttribute("sigSug", sigSug);
				model.addAttribute("sigtime", sigtime);
			}
		}

		List<EmployeeBean> employee = employeeService.selectPoEmployee("財務部", 2);

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
		model.addAttribute("recript_pic", recript_pic);
		model.addAttribute("picName", picName);
		model.addAttribute("invid", invid);
		model.addAttribute("status", "review");
		return "updateForm";
	}

	// 財務經理查看要分派的該張請款單
	@RequestMapping("/Account/AccSignInvoiceForm.controller")
	public String signInvoiceAccMan(Model model, HttpSession session, String invid) {

		Account_InvoiceBean bean = account_InvoiceService.select(invid);
		PO_SigningProcessBean poSignBean = pO_InvoiceService.selectForOneProcessbyPoSign("驗收作業", bean.getPo_id());
		String empid = bean.getEmployeeBean().getEmp_name();
		String empdep = bean.getEmployeeBean().getEmp_dep();
		String ven_name = bean.getpO_MainBean().getpO_Vendor_InfoBean().getVendor_name();
		String ven_id = bean.getpO_MainBean().getVendor_ID();
		Integer price = bean.getTotal_price();
		String payMethod = bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_method();
		String paydate = pO_InvoiceService.calcExpirePaymentDate(
				bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term(), poSignBean.getSig_date());
		String keyday = new SimpleDateFormat("yyyy/MM/dd").format(bean.getRecript_date());
		String recript_pic = bean.getRecript_pic();
		String picName = recript_pic.substring(8);
		List<Account_SigningProcessBean> sug = pO_InvoiceService.selectInvidAndRankLower(invid, 3);
		model.addAttribute("sug", sug);

		List<EmployeeBean> employee = employeeService.selectPoEmployee("財務部", 1);

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
		model.addAttribute("recript_pic", recript_pic);
		model.addAttribute("picName", picName);
		model.addAttribute("status", "dispatch");
		return "updateForm";
	}

	// 財務經理查看要簽核的該張請款單
	@RequestMapping("/Account/AccSignInvForm.controller")
	public String signInvAccMan(Model model, HttpSession session, String invid) {

		Account_InvoiceBean bean = account_InvoiceService.select(invid);
		PO_SigningProcessBean poSignBean = pO_InvoiceService.selectForOneProcessbyPoSign("驗收作業", bean.getPo_id());
		String empid = bean.getEmployeeBean().getEmp_name();
		String empdep = bean.getEmployeeBean().getEmp_dep();
		String ven_name = bean.getpO_MainBean().getpO_Vendor_InfoBean().getVendor_name();
		String ven_id = bean.getpO_MainBean().getVendor_ID();
		Integer price = bean.getTotal_price();
		String payMethod = bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_method();
		String paydate = pO_InvoiceService.calcExpirePaymentDate(
				bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term(), poSignBean.getSig_date());
		String keyday = new SimpleDateFormat("yyyy/MM/dd").format(bean.getRecript_date());
		String recript_pic = bean.getRecript_pic();
		String picName = recript_pic.substring(8);
		List<Account_SigningProcessBean> sug = pO_InvoiceService.selectInvidAndRankLower(invid, 5);
		model.addAttribute("sug", sug);

		List<EmployeeBean> employee = null;

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
		model.addAttribute("recript_pic", recript_pic);
		model.addAttribute("picName", picName);
		model.addAttribute("invid", invid);
		model.addAttribute("status", "review");
		return "updateForm";
	}

	// 財務查看被分派的該張請款單
	@RequestMapping("/Account/AccSignInvlevel1.controller")
	public String signInvAcc(Model model, HttpSession session, String invid) {

		Account_InvoiceBean bean = account_InvoiceService.select(invid);
		PO_SigningProcessBean poSignBean = pO_InvoiceService.selectForOneProcessbyPoSign("驗收作業", bean.getPo_id());
		String empid = bean.getEmployeeBean().getEmp_name();
		String empdep = bean.getEmployeeBean().getEmp_dep();
		String ven_name = bean.getpO_MainBean().getpO_Vendor_InfoBean().getVendor_name();
		String ven_id = bean.getpO_MainBean().getVendor_ID();
		Integer price = bean.getTotal_price();
		String payMethod = bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_method();
		String paydate = pO_InvoiceService.calcExpirePaymentDate(
				bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term(), poSignBean.getSig_date());
		String keyday = new SimpleDateFormat("yyyy/MM/dd").format(bean.getRecript_date());
		String recript_pic = bean.getRecript_pic();
		String picName = recript_pic.substring(8);
		List<Account_SigningProcessBean> sug = pO_InvoiceService.selectInvidAndRankLower(invid, 4);
		model.addAttribute("sug", sug);

		List<EmployeeBean> employee = employeeService.selectPoEmployee("財務部", 2);

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
		model.addAttribute("recript_pic", recript_pic);
		model.addAttribute("picName", picName);
		model.addAttribute("invid", invid);
		model.addAttribute("status", "review");
		return "updateForm";
	}

	// 財務查看被退回的該張請款單
		@RequestMapping("/Account/ReturnSignInv.controller")
		public String resignInvAcc(Model model, HttpSession session, String invid) {

			Account_InvoiceBean bean = account_InvoiceService.select(invid);
			PO_SigningProcessBean poSignBean = pO_InvoiceService.selectForOneProcessbyPoSign("驗收作業", bean.getPo_id());
			String empid = bean.getEmployeeBean().getEmp_name();
			String empdep = bean.getEmployeeBean().getEmp_dep();
			String ven_name = bean.getpO_MainBean().getpO_Vendor_InfoBean().getVendor_name();
			String ven_id = bean.getpO_MainBean().getVendor_ID();
			Integer price = bean.getTotal_price();
			String payMethod = bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_method();
			String paydate = pO_InvoiceService.calcExpirePaymentDate(
					bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term(), poSignBean.getSig_date());
			String keyday = new SimpleDateFormat("yyyy/MM/dd").format(bean.getRecript_date());
			String recript_pic = bean.getRecript_pic();
			String picName = recript_pic.substring(8);
			String sigman = pO_InvoiceService.selectForOneProcessbyAccountSign(invid, 5).getEmployeeBean().getEmp_name();
			model.addAttribute("sigman", sigman);
			Date sigtime = pO_InvoiceService.selectForOneProcessbyAccountSign(invid, 5).getSig_Date();
			model.addAttribute("sigtime", sigtime);

			Account_SigningProcessBean sug = pO_InvoiceService.selectForOneProcessbyAccountSign(invid, 5);
			String sigSug = sug.getSig_Sug();
			model.addAttribute("sigSug", sigSug);
			List<EmployeeBean> employee = employeeService.selectPoEmployee("財務部", 2);

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
			model.addAttribute("recript_pic", recript_pic);
			model.addAttribute("invid", invid);
			model.addAttribute("status", "review");
			model.addAttribute("picName", picName);
			return "updateForm";
		}

	// 財務主管查詢待分派的請款單
	@RequestMapping("/Account/ToDoAssignInvoice.controller")
	public String queryHaveToAssign(Model model, HttpSession session) {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String emp_id = empbean.getEmp_id();
		String sig_sta = "分派中"; // 財務經理自己的狀態是分派中(前一關送出並更新主管為"分派中")

		List<Account_InvoiceBean> haveToAssign = pO_InvoiceService.findTodoBackInvn(emp_id, sig_sta, 3);
		model.addAttribute("list", haveToAssign);

		return "assignInv.show";
	}

	// 財務主管查詢待簽核的請款單
	@RequestMapping("/Account/ToDoSignInvoice.controller")
	public String queryHaveToSign(Model model, HttpSession session) {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String emp_id = empbean.getEmp_id();
		String sig_sta = "簽核中"; // 財務經理自己的狀態是簽核中(前一關送出並更新主管為"簽核中")

		List<Account_InvoiceBean> haveToSign = pO_InvoiceService.findTodoBackInvn(emp_id, sig_sta, 5);
		model.addAttribute("list", haveToSign);

		return "signInv.show";
	}

	// 財務查詢待簽核及被退回的請款單
	@RequestMapping("/Account/ToDoSignlevel1.controller")
	public String queryHaveToSignlevel1(Model model, HttpSession session) {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String emp_id = empbean.getEmp_id();
		String sig_sta1 = "簽核中"; // 財務自己的狀態是簽核中(前一關送出並更新財務為"簽核中")
		String sig_sta2 = "退回中";
		Integer rank = 4;

		List<Account_InvoiceBean> haveToSign = pO_InvoiceService.findTodoBackInvn(emp_id, sig_sta1, rank);
		model.addAttribute("list", haveToSign);

		List<Account_InvoiceBean> InvoiceBack = pO_InvoiceService.findTodoBackInvn(emp_id, sig_sta2, rank);
		model.addAttribute("listback", InvoiceBack);

		return "signInv.show";
	}

	// 採購主管/財務/財務主管 分派/審核/退回請款單
	@RequestMapping("/Account/ReviewInvoice.controller")
	public String sendReviewInvoice(Model model, HttpSession session, String action, String invid, String SignSug,
			String status, String selectPOManager) throws ParseException, UnsupportedEncodingException {
		String poId = "po" + invid.substring(2);
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String dep = empbean.getEmp_dep();
		Integer level = empbean.getEmp_level();
		Boolean result1 = false;
		Boolean result2 = false;
		Boolean result3 = false;

		// 判斷是否為分派
		if (status.equals("dispatch") && action.equals("送出")) {
			result3 = pO_InvoiceService.updateAccountSigningProcess(invid, 3, "已分派", "簽核中", SignSug, selectPOManager);
			//送出email通知下一關
//			String email = employeeService.select(selectPOManager).getEmp_email();
//			String subject = "請款單簽核通知";
//
//			String text = "您有一張待分派的請款單"+"(單號為:"+invid+")請點下列連結登入：http://localhost:8080/PurchasingSystem/MainPage.jsp";
//			misc.AutoSendEmailByJava.processMemberWishNotice(email, subject, text);

			if (result3) {
				model.addAttribute("dispatchsuccessmeg", "1");
				model.addAttribute("inv_id", invid);
			} else {
				model.addAttribute("dispatcherrormeg", "2");
			}
			return "updateForm";
		}
		// 判斷審核是送出
		if (action.equals("送出") && status.equals("review")) {
			// 判斷部門及職別
			if (dep.equals("採購部") && level == 2) {
				result1 = pO_InvoiceService.updateAccountSigningProcess(invid, 2, "已核准", "分派中", SignSug,
						selectPOManager);

				//送出email通知下一關
//				String email =  employeeService.select(selectPOManager).getEmp_email();
//				String subject = "請款單分派通知";
//
//				String text = "您有一張待簽核的請款單"+"(單號為:"+invid+")請點下列連結登入：http://localhost:8080/PurchasingSystem/MainPage.jsp";
//				misc.AutoSendEmailByJava.processMemberWishNotice(email, subject, text);


				if (result1) {
					model.addAttribute("sendsuccessmeg", "1");
					model.addAttribute("inv_id", invid);
				} else {
					model.addAttribute("senderrormeg", "2");
				}
				return "updateForm";
			} else if (dep.equals("財務部") && level == 1) {
				result1 = pO_InvoiceService.updateAccountSigningProcess(invid, 4, "已簽核", "簽核中", SignSug,
						selectPOManager);
//				String email =  employeeService.select(selectPOManager).getEmp_email();
//				String subject = "請款單簽核通知";
//
//				String text = "您有一張待簽核的請款單"+"(單號為:"+invid+")請點下列連結登入：http://localhost:8080/PurchasingSystem/MainPage.jsp";
//				misc.AutoSendEmailByJava.processMemberWishNotice(email, subject, text);

				if (result1) {
					model.addAttribute("sendsuccessmeg", "3");
					model.addAttribute("inv_id", invid);
				} else {
					model.addAttribute("senderrormeg", "4");
				}
				return "updateForm";
			} else {
				result1 = pO_InvoiceService.updateAccountSigningProcess(invid, 5, "已簽核", null, SignSug, null);
				pO_InvoiceService.updatePoSigningProcess(poId, SignSug, "已結案");
				accout_PayableService.updateAccountPayable(invid);
				if (result1) {
					model.addAttribute("sendsuccessmeg", "3");
					model.addAttribute("inv_id", invid);
				} else {
					model.addAttribute("senderrormeg", "4");
				}
				return "updateForm";
			}

		}

		// 判斷審核是退回
		if (action.equals("退回") && status.equals("review")) {
			if (dep.equals("採購部") && level == 2) {
				result2 = pO_InvoiceService.updateAccountSigningProcessForReturn(invid, 2, "未簽核", "退回中", SignSug);
//				String email =  pO_InvoiceService.selectForOneProcessbyAccountSign(invid, 1).getEmployeeBean().getEmp_email();
//				String subject = "請款單簽核通知";
//				String text = "您有一張待簽核的請款單"+"(單號為:"+invid+")請點下列連結登入：http://localhost:8080/PurchasingSystem/MainPage.jsp";
//				misc.AutoSendEmailByJava.processMemberWishNotice(email, subject, text);
				if (result2) {
					model.addAttribute("returnsuccessmeg", "1");
					model.addAttribute("inv_id", invid);
				} else {
					model.addAttribute("returnerrormeg", "2");
				}
				return "updateForm";
			} else if (dep.equals("財務部") && level == 1) {
				result2 = pO_InvoiceService.updateAccountSigningProcessForReturn(invid, 4, "未簽核", "退回中", SignSug);
//				String email =  pO_InvoiceService.selectForOneProcessbyAccountSign(invid, 3).getEmployeeBean().getEmp_email();
//				String subject = "請款單簽核通知";
//				String text = "您有一張待簽核的請款單"+"(單號為:"+invid+")請點下列連結登入：http://localhost:8080/PurchasingSystem/MainPage.jsp";
//				misc.AutoSendEmailByJava.processMemberWishNotice(email, subject, text);
				if (result2) {
					model.addAttribute("returnsuccessmeg", "3");
					model.addAttribute("inv_id", invid);
				} else {
					model.addAttribute("returnerrormeg", "4");
				}
				return "updateForm";
			} else {
				result2 = pO_InvoiceService.updateAccountSigningProcessForReturn(invid, 5, "未核准", "退回中", SignSug);
//				String email = pO_InvoiceService.selectForOneProcessbyAccountSign(invid, 4).getEmployeeBean().getEmp_email();
//				String subject = "請款單簽核通知";
//				String text = "您有一張待簽核的請款單"+"(單號為:"+invid+")請點下列連結登入：http://localhost:8080/PurchasingSystem/MainPage.jsp";
//				//misc.AutoSendEmailByJava.processMemberWishNotice(email, subject, text);
				if (result2) {
					model.addAttribute("returnsuccessmeg", "3");
					model.addAttribute("inv_id", invid);
				} else {
					model.addAttribute("returnerrormeg", "4");
				}
				return "updateForm";
			}
			
		}
		return "xxx";
	}

	// 採購/財務查詢所有請款單狀態
	@RequestMapping("/Po/queryStatus.controller")
	public String queryStatus(Model model, HttpSession session) {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String emp_id = empbean.getEmp_id();
		String emp_dep=empbean.getEmp_dep();
		if(emp_dep.equals("採購部")) {
			List<Account_SigningProcessBean> lists = pO_InvoiceService.selectAccountManagerInvoiveOrNot(emp_id);
			if (lists != null) {
				model.addAttribute("listsallforbuyer", lists);
				return "status.show";
			} else {
				model.addAttribute("nolistsallforbuyer", "尚無請款單單號");
				return "status.show";
			}
		} else if (emp_id.equals("emp009")) {
			List<Account_SigningProcessBean> lists = pO_InvoiceService.selectAccountManagerInvoiveOrNotM(emp_id,
					"財務經理分派");
			if (lists != null) {
				model.addAttribute("listsallforaccboss", lists);
				return "statusforAcc.show";
			} else {
				model.addAttribute("nolistsallforaccboss", "尚無請款單單號");
				return "statusforAcc.show";
			}
		} else {
			List<Account_SigningProcessBean> lists = pO_InvoiceService.selectAccountManagerInvoiveOrNot(emp_id);
			if (lists != null) {
				model.addAttribute("listsallforaccemp", lists);
				return "statusforAcc.show";
			} else {
				model.addAttribute("nolistsallforaccemp", "尚無請款單單號");
				return "statusforAcc.show";
			}
		}
	}

	// 採購/財務查詢已完成請款單狀態 PO流程是"已結案"
	@RequestMapping("/Po/queryStatusDone.controller")
	public String queryStatusDone(Model model, HttpSession session) {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String emp_id = empbean.getEmp_id();
		String emp_dep=empbean.getEmp_dep();
		if (emp_id.equals("emp009")) { // 找自己有參與的請款單
			List<Account_SigningProcessBean> lists = pO_InvoiceService.selectAccountManagerInvoiveOrNotM(emp_id,
					"財務經理分派");
			List<Account_SigningProcessBean> liststa = new LinkedList<Account_SigningProcessBean>();
			List<Account_SigningProcessBean> listsd = new LinkedList<Account_SigningProcessBean>();
			for (int i = 0; i < lists.size(); i++) {
				String id = lists.get(i).getInv_id();
				liststa = pO_InvoiceService.selectDone(id, 5); // 自己有參與的單的sig_rank=5
				for (int y = 0; y < liststa.size(); y++) {
					if (liststa.get(y).getSig_Sta() == null) {
						continue;
					}
					else if (liststa.get(y).getSig_Sta().equals("已簽核")) {
						listsd.add(liststa.get(y));
					}
				}
			}
			if (listsd.size() > 0) {
				model.addAttribute("finishlistsforaccboss", listsd);
				return "statusforAcc.show";
			} else {
				model.addAttribute("nofinishlistsforaccboss", "尚無已結案請款單單號");
				return "statusforAcc.show";
			}

		} else if(emp_dep.equals("採購部")){
			List<Account_SigningProcessBean> lists = pO_InvoiceService.selectAccountManagerInvoiveOrNot(emp_id);
			List<Account_SigningProcessBean> liststa = new LinkedList<Account_SigningProcessBean>();
			List<Account_SigningProcessBean> listsd = new LinkedList<Account_SigningProcessBean>();
			for (int i = 0; i < lists.size(); i++) {
				String id = lists.get(i).getInv_id();
				liststa = pO_InvoiceService.selectDone(id, 5);
				for (int y = 0; y < liststa.size(); y++) {
					if (liststa.get(y).getSig_Sta() == null) {
						continue;
					}

					else if (liststa.get(y).getSig_Sta().equals("已簽核")) {
						listsd.add(liststa.get(y));
					}
				}
			}
			if (listsd.size() > 0) {
				model.addAttribute("finishlistsforbuyer", listsd);
				return "status.show";
			} else {
				model.addAttribute("nofinishlistsforbuyer", "尚無已結案請款單單號");
				return "status.show";
			}}
			else {
				List<Account_SigningProcessBean> lists = pO_InvoiceService.selectAccountManagerInvoiveOrNot(emp_id);
				List<Account_SigningProcessBean> liststa = new LinkedList<Account_SigningProcessBean>();
				List<Account_SigningProcessBean> listsd = new LinkedList<Account_SigningProcessBean>();
				for (int i = 0; i < lists.size(); i++) {
					String id = lists.get(i).getInv_id();
					liststa = pO_InvoiceService.selectDone(id, 5);
					for (int y = 0; y < liststa.size(); y++) {
						if (liststa.get(y).getSig_Sta() == null) {
							continue;
						}

						else if (liststa.get(y).getSig_Sta().equals("已簽核")) {
							listsd.add(liststa.get(y));
						}
					}
				}
				if (listsd.size() > 0) {
					model.addAttribute("finishlistsforaccemp", listsd);
					return "statusforAcc.show";
				} else {
					model.addAttribute("nofinishlistsforaccemp", "尚無已結案請款單單號");
					return "statusforAcc.show";
				
			}
		}
	}

	// 採購/財務查詢未完成請款單狀態 PO流程是"請款中"
	@RequestMapping("/Po/queryStatusUndone.controller")
	public String queryStatusUndone(Model model, HttpSession session) {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String emp_id = empbean.getEmp_id();
		String emp_dep=empbean.getEmp_dep();
		if (emp_id.equals("emp009")) { // 找自己有參與的請款單
			List<Account_SigningProcessBean> lists = pO_InvoiceService.selectAccountManagerInvoiveOrNotM(emp_id,
					"財務經理分派");
			PO_SigningProcessBean liststa = new PO_SigningProcessBean();
			List<PO_SigningProcessBean> liststa2 = new LinkedList<PO_SigningProcessBean>();
			Account_InvoiceBean liststaUn = new Account_InvoiceBean();
			List<Account_InvoiceBean> liststaUn2 = new LinkedList<Account_InvoiceBean>();
			for (int i = 0; i < lists.size(); i++) {
				String id = "Po" + lists.get(i).getInv_id().substring(2);
				liststa = pO_InvoiceService.selectForOneProcessbyPoSigSta("請款中", id);
				if (liststa != null) {
					liststa2.add(liststa);
				} else {
					continue;
				}
			}
			if (liststa2.size() > 0) {
				for (int j = 0; j < liststa2.size(); j++) {
					String inv = "In" + liststa2.get(j).getPo_id().substring(2);
					liststaUn = pO_InvoiceService.selectInvoice(inv);
					liststaUn2.add(liststaUn);
				}
				model.addAttribute("unfinishlistsforaccboss", liststaUn2);
				return "statusforAcc.show";
			} else {
				model.addAttribute("nounfinishlistsforaccboss", "尚無未結案請款單單號");
				return "statusforAcc.show";
			}
		} else if(emp_dep.equals("採購部")){
			List<Account_SigningProcessBean> lists = pO_InvoiceService.selectAccountManagerInvoiveOrNot(emp_id);
			PO_SigningProcessBean liststa = new PO_SigningProcessBean();
			List<PO_SigningProcessBean> liststa2 = new LinkedList<PO_SigningProcessBean>();
			Account_InvoiceBean liststaUn = new Account_InvoiceBean();
			List<Account_InvoiceBean> liststaUn2 = new LinkedList<Account_InvoiceBean>();
			for (int i = 0; i < lists.size(); i++) {
				String id = "Po" + lists.get(i).getInv_id().substring(2);
				liststa = pO_InvoiceService.selectForOneProcessbyPoSigSta("請款中", id);
				if (liststa != null) {
					liststa2.add(liststa);
				} else {
					continue;
				}
			}
			if (liststa2.size() > 0) {
				for (int j = 0; j < liststa2.size(); j++) {
					String inv = "In" + liststa2.get(j).getPo_id().substring(2);
					liststaUn = pO_InvoiceService.selectInvoice(inv);
					liststaUn2.add(liststaUn);
				}
				model.addAttribute("unfinishlistsforbuyer", liststaUn2);
				return "status.show";
			} else {
				model.addAttribute("nounfinishlistsforbuyer", "尚無未結案請款單單號");
				return "status.show";
			}
		}else {
			List<Account_SigningProcessBean> lists = pO_InvoiceService.selectAccountManagerInvoiveOrNot(emp_id);
			PO_SigningProcessBean liststa = new PO_SigningProcessBean();
			List<PO_SigningProcessBean> liststa2 = new LinkedList<PO_SigningProcessBean>();
			Account_InvoiceBean liststaUn = new Account_InvoiceBean();
			List<Account_InvoiceBean> liststaUn2 = new LinkedList<Account_InvoiceBean>();
			for (int i = 0; i < lists.size(); i++) {
				String id = "Po" + lists.get(i).getInv_id().substring(2);
				liststa = pO_InvoiceService.selectForOneProcessbyPoSigSta("請款中", id);
				if (liststa != null) {
					liststa2.add(liststa);
				} else {
					continue;
				}
			}
			if (liststa2.size() > 0) {
				for (int j = 0; j < liststa2.size(); j++) {
					String inv = "In" + liststa2.get(j).getPo_id().substring(2);
					liststaUn = pO_InvoiceService.selectInvoice(inv);
					liststaUn2.add(liststaUn);
				}
				model.addAttribute("unfinishlistsforaccemp", liststaUn2);
				return "statusforAcc.show";
			} else {
				model.addAttribute("nounfinishlistsforaccemp", "尚無未結案請款單單號");
				return "statusforAcc.show";
			}
		}
		}
	

	// 查詢該張請款單狀態
	@RequestMapping("/Po/queryStatusIn.controller")
	public String queryStatusIn(Model model, HttpSession session, String invid) {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String emp_dep=empbean.getEmp_dep();
		
		List<Account_SigningProcessBean> stat = pO_InvoiceService.selectStatus(invid);
		model.addAttribute("stat", stat);

		Account_InvoiceBean bean = account_InvoiceService.select(invid);
		model.addAttribute("bean", bean);
		if(emp_dep.equals("採購部")) {
		return "statusIn.show";
		}else {
		return "statusInforAcc.show";
		}
		
	}
	

}