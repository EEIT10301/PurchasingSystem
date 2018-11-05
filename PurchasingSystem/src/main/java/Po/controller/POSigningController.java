package Po.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Account_InvoiceBean;
import Account.model.PO_Vendor_InfoBean;
import Account.service.PO_Vendor_InfoService;
import Apply.model.App_MainBean;
import Apply.model.EmployeeBean;
import Apply.service.App_MainService;
import Apply.service.EmployeeService;
import Po.model.PO_DetailBean;
import Po.model.PO_MainBean;
import Po.model.PO_QueryBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_DetailService;
import Po.service.PO_InvoiceService;
import Po.service.PO_MainService;
import Po.service.PO_QueryService;
import Po.service.PO_SigningProcessService;

@Controller
public class POSigningController {
	@Autowired
	PO_SigningProcessService pO_SigningProcessService;
	@Autowired
	App_MainService app_MainService;
	@Autowired
	PO_MainService pO_MainService;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	PO_Vendor_InfoService pO_Vendor_InfoService;
	@Autowired
	PO_DetailService pO_DetailService;
	@Autowired
	PO_QueryService pO_QueryService;
	@Autowired
	PO_InvoiceService pO_InvoiceService;
	
	@RequestMapping("/Po/sendEmployee.controller") // 多少採購單分派頁面
	public String sendEmployee(Model model, HttpSession session) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		// List<PO_SigningProcessBean>
		List<PO_SigningProcessBean> list = pO_SigningProcessService.selectempidsend(beans.getEmp_id(), "分派中");
//		List<PO_SigningProcessBean> list = pO_SigningProcessService.select();
		List<PO_SigningProcessBean> lists = new LinkedList<PO_SigningProcessBean>();

		if (list == null) {
			model.addAttribute("nosendlist", "無待分派採購單");
			return "SendEmployee.do";
		} else {
			for (int i = 0; i < list.size(); i++) {
				PO_SigningProcessBean x = list.get(i);
				String poid = x.getPo_id();
				PO_SigningProcessBean xs = pO_SigningProcessService.select("產生採購單", poid);
				if (xs != null) {
					lists.add(x);
					lists.add(xs);
				}

			}

//			for (int i = 0; i < list.size(); i++) {
//				PO_SigningProcessBean x = list.get(i);
//
//				if (x.getSig_rank() <= 2) {
//					lists.add(x);
//				}}

			model.addAttribute("sendlist", lists);
			return "SendEmployee.do";
		}
	}

	@RequestMapping("/Po/sendEmployeesss.controller") // 主管待分派單頁面
	public String sendEmployeedetail(PO_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session, String send) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");

		PO_MainBean pomain = pO_MainService.select(bean.getPo_id());
		String poid = bean.getPo_id();
		String poid1 = "Ap" + poid.substring(2);
		App_MainBean appmain = app_MainService.select(poid1);
		List<EmployeeBean> empbeans = employeeService.selectPoEmployee(beans.getEmp_dep(), 1);
		model.addAttribute("appmain", appmain);
		model.addAttribute("pomain", pomain);
		model.addAttribute("empbeans", empbeans);
		model.addAttribute("SigningProcess", bean);
		return "ListMain.show";

	}

	@RequestMapping("/Po/sendlist.controller") // 主管點選人分派頁面
	public String sendlist(PO_SigningProcessBean bean, BindingResult bindingResult, Model model, HttpSession session,
			String send, String employeesend, String SignSug) throws ParseException {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		java.util.Date date = new java.util.Date();
		java.sql.Date data1 = new java.sql.Date(date.getTime());
		DateFormat dateFormate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now= dateFormate.format(data1);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date dates=sdf.parse(now);
		PO_MainBean pomain = pO_MainService.select(bean.getPo_id());
		pomain.setEmp_id(employeesend);
		PO_SigningProcessBean secondsigningprocess = pO_SigningProcessService.select(bean.getPo_sta(), bean.getPo_id());
		secondsigningprocess.setSig_sta("已分派");
		secondsigningprocess.setSig_date(dates);
		secondsigningprocess.setSig_sug(SignSug);
		PO_SigningProcessBean secondsigningprocess1 = new PO_SigningProcessBean(employeesend, "詢價中", bean.getPo_id(),
				null, "詢價中", null, 3);
		pO_SigningProcessService.insert(secondsigningprocess1);
		model.addAttribute("sendok", "分派完成");
		return "sendlist.ok";

	}

	@RequestMapping("/Po/selectprice.controller") // 採購人員點選待詢價採購單頁面
	public String sendlistss(Model model, HttpSession session) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		String empid = beans.getEmp_id();
		List<PO_SigningProcessBean> selectlist = pO_SigningProcessService.selectempidsend(empid, "詢價中");
		List<PO_SigningProcessBean> selectlists = null;
		selectlists = new LinkedList<PO_SigningProcessBean>();
		if (selectlist == null) {

			model.addAttribute("noselectlists", "無待詢價採購單");
			return "select.list";
		} else {
			for (int i = 0; i < selectlist.size(); i++) {
				PO_SigningProcessBean x = selectlist.get(i);
				PO_SigningProcessBean xs = pO_SigningProcessService.select("分派採購者", x.getPo_id());
				if (xs != null) {
					selectlists.add(x);
					selectlists.add(xs);
				}
				model.addAttribute("selectlists", selectlists);

			}
			return "select.list";
		}

//		if(selectlist.size()>0 && selectlist!=null) {
//		}
//		}else {
	}

	@RequestMapping("/Po/sendthisselectlist.controller") // 採購人員點選待詢價採購單頁面
	public String sendlistss(String po_manger, String po_sta, String po_id, Model model, HttpSession session) {
		PO_SigningProcessBean bean = pO_SigningProcessService.select(po_sta, po_id);
		List<PO_QueryBean> POQuery = pO_QueryService.selectQueryBean(po_id);
		model.addAttribute("poprocess1", bean);
		model.addAttribute("queryss", POQuery);
		return "select.listDetail";
	}

	@RequestMapping("/Po/posendlistsign.controller") // 採購人員於待詢價採購單頁面選擇送出審核
	public String posendlistsign(String po_manger, String po_sta, String po_id, Model model, HttpSession session) {
		PO_SigningProcessBean bean = pO_SigningProcessService.select(po_sta, po_id);
		// List<PO_Vendor_InfoBean> AllPO_Vendor = pO_Vendor_InfoService.select();
		model.addAttribute("poprocess1", bean);
		List<PO_QueryBean> POQuery = pO_QueryService.selectQueryBean(po_id);
		model.addAttribute("AllPO_Vendor", POQuery);
		if (POQuery == null) {
			model.addAttribute("noselist", "審核前請先新增詢價紀錄");
			return "select.listDetail";
		} else {

			return "Posend.sign";
		}
	}

	@RequestMapping("/Po/sendsc.controller")
	public String createQueryMemo(String po_manger, String po_sta, String po_id, Model model, HttpSession session) {
		PO_SigningProcessBean bean1 = pO_SigningProcessService.select(po_sta, po_id);
		List<PO_Vendor_InfoBean> AllPO_Vendor1 = pO_Vendor_InfoService.select();
		model.addAttribute("query", bean1);
		model.addAttribute("po_manger", po_manger);
		model.addAttribute("po_sta", po_sta);
		model.addAttribute("po_id", po_id);
		model.addAttribute("AllPO_Vendor1", AllPO_Vendor1);
		return "QueryMemo.show";
	}

	@RequestMapping("/Po/queryinsert.controller")
	public String queryMemoInsert(String po_manger, String po_sta, String po_id, PO_QueryBean bean, Model model,
			HttpSession session) {
		List<PO_QueryBean> query = pO_QueryService.selectQueryBean(bean.getPo_ID());
		java.util.Date date = new java.util.Date();
		java.sql.Date datas = new java.sql.Date(date.getTime());
		DateFormat dateFormate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		bean.setPo_querydate(datas);
		String now = dateFormate.format(datas);

		PO_QueryBean searchbean = pO_QueryService.select(bean.getPo_ID(), bean.getVendor_ID());
		if (searchbean != null) {
			searchbean.setPo_querydate(datas);
			searchbean.setPo_totalprice(bean.getPo_totalprice());
			model.addAttribute("query1", searchbean);
			model.addAttribute("now", now);
		} else {
			PO_QueryBean insert = pO_QueryService.insert(bean);
			PO_Vendor_InfoBean xs = pO_Vendor_InfoService.select(bean.getVendor_ID());
			model.addAttribute("now", now);
			model.addAttribute("queryVendor", xs);
			model.addAttribute("query1", insert);
			// searchbean=pO_QueryService.select(bean.getPo_ID(), bean.getVendor_ID());
		}

		PO_SigningProcessBean sendbean = pO_SigningProcessService.select(po_sta, po_id);
		model.addAttribute("poprocess2", sendbean);
		model.addAttribute("po_manger", po_manger);
		model.addAttribute("po_sta", po_sta);
		model.addAttribute("po_id", po_id);
		model.addAttribute("queryss", query);
		return "select.listDetail";
	}
	// 有問題
//	@RequestMapping("/Po/queryTable.controller")
//	public String querytable(Model model) {
//		List<PO_QueryBean> query = pO_QueryService.select();
//		for(int i=0;i<query.size();i++) {
//			PO_QueryBean ss = query.get(i);
//			model.addAttribute("query",ss);
//		}
//		return "select.listDetail";
//	}

//	@RequestMapping("/PO/sendsc.controller")
//	public String createQueryMemo(String po_manger,String po_sta,String po_id, Model model,HttpSession session) {
//		PO_SigningProcessBean bean =pO_SigningProcessService.select(po_sta, po_id);
//		model.addAttribute("query",bean);		
//		return "QueryMemo.show";
//	}

	@RequestMapping("/Po/checkvendorandpodetail.controller") // 採購人員於待詢價採購單頁面選擇送出審核
	public String checkvendorandpodetail(String[] po_id, String[] part_No, String[] market_Price, String[] quotation,
			String[] total_Price, String[] total_Qty, Model model, HttpSession session, String AllPO_Vendors,
			String posta1, String poid1, String send) {

		List<PO_DetailBean> Podetailbeans = new LinkedList<PO_DetailBean>();
		Map<String, String> errors = new HashMap<String, String>();
		PO_DetailBean Podetailbean = new PO_DetailBean();
		Integer allListprice = 0;
		PO_SigningProcessBean bean = pO_SigningProcessService.select(posta1, poid1);
		List<PO_Vendor_InfoBean> AllPO_Vendor = pO_Vendor_InfoService.select();
//		 if(send.equals("重新輸入")) {
//	    	   model.addAttribute("poprocess1",bean);
//	    	   model.addAttribute("AllPO_Vendor",AllPO_Vendor);
//				return "Posend.sign"; 
//	       }
		for (int i = 0; i < po_id.length; i++) {
			if (quotation[i].equals("") || quotation[i].trim().isEmpty() || total_Price[i].equals("")
					|| total_Price[i].trim().isEmpty()) {
				errors.put("number", "請輸入整數");
				model.addAttribute("poprocess1", bean);
				model.addAttribute("errors", errors);
				model.addAttribute("AllPO_Vendor", AllPO_Vendor);
				return "Posend.sign";
			}
			String poid = po_id[i];
			Podetailbean.setPo_id(poid);
			String partno = part_No[i];
			Podetailbean.setPart_No(partno);
			Integer marketPrice = Integer.parseInt(market_Price[i]);
			Podetailbean.setMarket_Price(marketPrice);
			Integer quot = Integer.parseInt(quotation[i]);
			Podetailbean.setQuotation(quot);
			Integer totalPrice = Integer.parseInt(total_Price[i]);
			Podetailbean.setTotal_Price(totalPrice);
			Integer totalQty = Integer.parseInt(total_Qty[i]);
			Podetailbean.setTotal_Qty(totalQty);
			Integer thislistprice = quot * totalPrice;
			allListprice += thislistprice;
			Podetailbeans.add(Podetailbean);

		}
		PO_Vendor_InfoBean VendorBean = pO_Vendor_InfoService.select(AllPO_Vendors);
		List<EmployeeBean> pomangers = employeeService.selectPoEmployee("採購部", 2);
		String apid = "Ap" + poid1.substring(2);
		App_MainBean AppMain = app_MainService.select(apid);
		if (allListprice > (AppMain.getApp_price() * 1.2)) {
			EmployeeBean boss = employeeService.select("emp003");
			model.addAttribute("boss", boss);
		}
		model.addAttribute("Podetailbeans", Podetailbeans);
		model.addAttribute("AllPO_Vendors", VendorBean);
		model.addAttribute("posta1", posta1);
		model.addAttribute("poid1", poid1);
		model.addAttribute("pomangers", pomangers);
		model.addAttribute("allListprice", allListprice);
		return "Posendcheck.sign";

	}

	@RequestMapping("/Po/podetailupdate.controller") // 採購人員於待詢價採購單頁面選擇送審核畫面按下重新輸入or送出
	public String podetailupdate(String[] po_id, String[] part_No, String[] market_Price, String[] quotation,
			String[] total_Price, String[] total_Qty, Model model, HttpSession session, String allListprice,
			String AllPO_Vendors, String posta1, String poid1, String send, String pomanger, String boss,
			String SignSug) {
		EmployeeBean thisemp = (EmployeeBean) session.getAttribute("user");
		java.util.Date date = new java.util.Date();
		java.sql.Date datas = new java.sql.Date(date.getTime());
		PO_SigningProcessBean bean = pO_SigningProcessService.select(posta1, poid1);

		List<PO_Vendor_InfoBean> AllPO_Vendor = pO_Vendor_InfoService.select();
		if (send.equals("重新輸入")) {
			model.addAttribute("poprocess1", bean);
			model.addAttribute("AllPO_Vendor", AllPO_Vendor);
			return "Posend.sign";
		} else {// 按下送出時
			if (boss == null) {// 如果部會到總經理的話
				PO_MainBean pomain = pO_MainService.select(poid1);
				pomain.setVendor_ID(AllPO_Vendors);
				pomain.setTotal_price(Integer.valueOf(allListprice));
				Set<PO_DetailBean> PODetail = pomain.getpO_DetailBean();
				for (int i = 0; i < po_id.length; i++) {
					Integer thisquotation = Integer.valueOf(quotation[i]);
					Integer thistotal_Price = Integer.valueOf(total_Price[i]);
					for (PO_DetailBean x : PODetail) {
						if(x.getPart_No().equals(part_No[i]));
						x.setQuotation(thisquotation);
						x.setTotal_Price(thistotal_Price);
					}
//					PO_DetailBean thispodetail = pO_DetailService.select(po_id[i], part_No[i]);
//					thispodetail.setQuotation(thisquotation);
//					thispodetail.setTotal_Price(thistotal_Price);
//					pO_DetailService.update(thispodetail);
				}
				Set<PO_SigningProcessBean> posignprocess = pomain.getpO_SigningProcessBean();
				for (PO_SigningProcessBean x : posignprocess) {
					if (x.getSig_rank() == 3) {
						x.setSig_date(datas);
						x.setSig_sta("已詢價");
						x.setSig_sug(SignSug);
					}
				}

				PO_SigningProcessBean sx1 = new PO_SigningProcessBean(pomanger, "主管審核完成", poid1, null, "簽核中", null, 4);
				PO_SigningProcessBean sx2 = new PO_SigningProcessBean(thisemp.getEmp_id(), "下單中", poid1, null, "未下單",
						null, 5);
				PO_SigningProcessBean sx3 = new PO_SigningProcessBean(thisemp.getEmp_id(), "待收貨", poid1, null, "未收貨",
						null, 6);
				PO_SigningProcessBean insert=pO_SigningProcessService.insert(sx1);
				if(insert==null) {
					PO_SigningProcessBean update=pO_SigningProcessService.selectempandrank(poid1, 4);
					update.setSig_sta("簽核中");
				}else {
					
					pO_SigningProcessService.insert(sx2);
					pO_SigningProcessService.insert(sx3);
				}
				
				
			} else {// 如果會到總經理的話
				PO_MainBean pomain = pO_MainService.select(poid1);
				pomain.setVendor_ID(AllPO_Vendors);
				pomain.setTotal_price(Integer.valueOf(allListprice));
				Set<PO_DetailBean> PODetail = pomain.getpO_DetailBean();
				for (int i = 0; i < po_id.length; i++) {
					Integer thisquotation = Integer.valueOf(quotation[i]);
					Integer thistotal_Price = Integer.valueOf(total_Price[i]);
					for (PO_DetailBean x : PODetail) {
						if(x.getPart_No().equals(part_No[i]));
						x.setQuotation(thisquotation);
						x.setTotal_Price(thistotal_Price);
					}
//					PO_DetailBean thispodetail = pO_DetailService.select(po_id[i], part_No[i]);
//					thispodetail.setQuotation(thisquotation);
//					thispodetail.setTotal_Price(thistotal_Price);
//					pO_DetailService.update(thispodetail);
				}
				Set<PO_SigningProcessBean> posignprocess = pomain.getpO_SigningProcessBean();
				for (PO_SigningProcessBean x : posignprocess) {
					if (x.getSig_rank() == 3) {
						x.setSig_date(datas);
						x.setSig_sta("已詢價");
						x.setSig_sug(SignSug);
					}
				}

				PO_SigningProcessBean sx1 = new PO_SigningProcessBean(pomanger, "主管審核中", poid1, null, "簽核中", null, 4);
				PO_SigningProcessBean sx2 = new PO_SigningProcessBean(boss, "主管審核完成", poid1, null, "未簽核", null, 5);
				PO_SigningProcessBean sx3 = new PO_SigningProcessBean(thisemp.getEmp_id(), "下單中", poid1, null, "未下單",
						null, 6);
				PO_SigningProcessBean sx4 = new PO_SigningProcessBean(thisemp.getEmp_id(), "待收貨", poid1, null, "未收貨",
						null, 7);
				PO_SigningProcessBean insert=pO_SigningProcessService.insert(sx2);
				if(insert==null) {
					PO_SigningProcessBean update=pO_SigningProcessService.selectempandrank(poid1, 4);
					update.setSig_sta("簽核中");
				}else {					
					pO_SigningProcessService.insert(sx1);
					pO_SigningProcessService.insert(sx3);
					pO_SigningProcessService.insert(sx4);
				}
				
			}
			return "POlogin.successint";
		}
	}

//	@RequestMapping("/Po/signedorder.controller")
//	public String signedOrder(Model model, HttpSession session) {
//		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
//		String empid = beans.getEmp_id();
//		List<PO_SigningProcessBean> selectlist = pO_SigningProcessService.selectempidsend(empid, "下單中");
//		List<PO_SigningProcessBean> selectlists = null;
//		selectlists = new LinkedList<PO_SigningProcessBean>();
//		if (selectlist == null) {
//
//			model.addAttribute("noselectlists", "無待下單資訊");
//			return "SignedOrder.show";
//		} else {
//			for (int i = 0; i < selectlist.size(); i++) {
//				PO_SigningProcessBean x = selectlist.get(i);
//				PO_SigningProcessBean xs = pO_SigningProcessService.select("主管審核中", x.getPo_id());
//				if (xs != null) {
//					selectlists.add(x);
//					selectlists.add(xs);
//				}
//				model.addAttribute("selectlists", selectlists);
//
//			}
//			return "SignedOrder.show";
//		}

//		}else {

	
	//採購主管的"待簽核請款單列表"
	@RequestMapping("/Po/todoSignInvoice.controller")
	public String todoSignInvoice(Model model, HttpSession session) {
		EmployeeBean empbean = (EmployeeBean)session.getAttribute("user");
		String emp_id=empbean.getEmp_id();
		
		List<Account_InvoiceBean> InvoiceSign = pO_InvoiceService.findTodoSignInv(emp_id, "簽核中", 2);
		model.addAttribute("listtodosign", InvoiceSign);
		List<Account_InvoiceBean> BackInvoiceSign = pO_InvoiceService.findTodoBackInv(emp_id, "退回中", 2);
		model.addAttribute("BackInvoiceSign", BackInvoiceSign);
		
		
		
		return "todoSignInvoice.show";
	}


}
