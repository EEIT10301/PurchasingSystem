package Account.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Account.model.Account_InvoiceBean;
import Account.model.Accout_PayableBean;
import Account.service.Account_InvoiceService;
import Account.service.Accout_PayableService;
import Account.view.ExcelViewForInvoice;
import Account.view.PdfViewForInvoice;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_InvoiceService;

@Controller
public class Account_payableController {
	@Autowired
	Accout_PayableService accout_PayableService;
	@Autowired
	Account_InvoiceService account_InvoiceService;
	@Autowired
	PO_InvoiceService pO_InvoiceService;

	// 顯示所有應付款資料
	@RequestMapping("/Account/ShowAccountPayableList.controller")
	public String showAccountPayableDataByAll(Model model) {
		List<Accout_PayableBean> list = accout_PayableService.select();
		model.addAttribute("allPayableList", list);
		return "queryAccountPayable";

	}

	// 點選請款單單號可顯示請款單資料
	@RequestMapping("/Account/ShowInvoice.controller")
	public String showInvoiceData(Model model, HttpSession session, String invid) {
		Account_InvoiceBean result = account_InvoiceService.select(invid);
		String picName = result.getRecript_pic().substring(8);
		model.addAttribute("invoiceData", result);
		model.addAttribute("picName", picName);
		return "queryInvoice";
	}

	// 請款單資料產生excel檔
	@RequestMapping("/Account/ShowInvoice.xls")
	public ModelAndView downloadExcel() {
		List<Accout_PayableBean> list = accout_PayableService.select();
		Map<String, List<Accout_PayableBean>> map = new HashMap<>();
		map.put("infoList", list);
		ExcelViewForInvoice ve = new ExcelViewForInvoice();
		return new ModelAndView(ve, map);
	}

	// 產生pdf檔
	@RequestMapping("/Account/ShowInvoice.pdf")
	public ModelAndView downloadPdf() {
		List<Accout_PayableBean> list = accout_PayableService.select();
		Map<String, List<Accout_PayableBean>> map = new HashMap<>();
		map.put("infoList", list);
		PdfViewForInvoice pv = new PdfViewForInvoice();
		return new ModelAndView(pv, map);
	}

	// 產生待辦件數
		@RequestMapping(path = "/Account/LoginSuccessSelectInvSignList.do")
		@ResponseBody
		public JSONArray LoginSucessSelectAppSignList(HttpSession session) {
			EmployeeBean ben = (EmployeeBean) session.getAttribute("user");
			String emp_id = ben.getEmp_id();
			if (ben.getEmp_level() == 1) {
				List<Account_InvoiceBean> noToSignInv = pO_InvoiceService.findTodoBackInvn(emp_id, "簽核中", 4);
				List<Account_InvoiceBean> noToSignInvReturn = pO_InvoiceService.findTodoBackInvn(emp_id, "退回中", 4);
				int noToSignInvQuy=0;
				int noToSignInvReturnQry=0;
				int noToSignInvtotal=0;
				// 財務承辦未審核請款單數量
				if (noToSignInv != null&&noToSignInv.size()>0) {
					noToSignInvQuy = noToSignInv.size();
					noToSignInvtotal+=noToSignInvQuy;
				}
				// 財務承辦未審核退回請款單數量
				if (noToSignInvReturn != null&&noToSignInvReturn.size()>0) {
					noToSignInvReturnQry = noToSignInvReturn.size();
					noToSignInvtotal+=noToSignInvReturnQry;
				} 
				if(noToSignInvtotal>0) {
				session.setAttribute("noToSignInvtotal", noToSignInvtotal);
				}else {
				session.removeAttribute("noToSignInvtotal");
				};
				
			} 
			if (ben.getEmp_level() == 2) {
				// 財務主管未分派請款單數量
				List<Account_InvoiceBean> noDispatchInv = pO_InvoiceService.findTodoBackInvn(emp_id, "分派中", 3);
				if (noDispatchInv != null&&noDispatchInv.size()>0) {
					Integer noDispatchInvQry = noDispatchInv.size();
					System.out.println(noDispatchInvQry);
					session.setAttribute("noDispatchInv", noDispatchInvQry);
				} else {
					session.removeAttribute("noDispatchInv");
				}
				// 財務主管未審核請款單數量
				List<Account_InvoiceBean> noToSignInvforBoss = pO_InvoiceService.findTodoBackInvn(emp_id, "簽核中", 5);
				if (noToSignInvforBoss != null && noToSignInvforBoss.size()>0) {
					Integer noToSignInvforBossQry = noToSignInvforBoss.size();
					session.setAttribute("noToSignInvforBoss", noToSignInvforBossQry);
				} else {
					session.removeAttribute("noToSignInvforBoss");
				}
			}
			return null;
		}

}
