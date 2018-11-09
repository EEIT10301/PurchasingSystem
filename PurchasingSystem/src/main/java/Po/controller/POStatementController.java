package Po.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Account_SigningProcessBean;
import Account.service.Account_SigningProcessService;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Inv.model.Inv_SigningProcessBean;
import Inv.service.Inv_SigningProcessService;
import Po.model.PO_DetailBean;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_MainService;
import Po.service.PO_SigningProcessService;

@Controller
public class POStatementController {
	@Autowired
	PO_SigningProcessService pO_SigningProcessService;
	@Autowired
	Inv_SigningProcessService inv_SigningProcessService;
	@Autowired
	Account_SigningProcessService account_SigningProcessService;
	@Autowired
	PO_MainService pO_MainService;
	
	
	@RequestMapping("/Po/POSignStatement.controller")
	public String POSignStatement(App_SigningProcessBean bean, Model model, HttpSession session) throws ParseException {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String EmpId = empbean.getEmp_id();
		if (empbean.getEmp_level() == 1) {// 如果是非主管的員工
			List<PO_SigningProcessBean> Statement = pO_SigningProcessService.selectempID(EmpId);
			model.addAttribute("POList", Statement);
			return "POSignStatement.do";
		}

		else {
			List<PO_SigningProcessBean> Statement = pO_SigningProcessService.selectempID(EmpId);
			model.addAttribute("POList", Statement);
			return "POSignStatement.do";
			
		}
		
	}

	@RequestMapping("/Po/POSignStatementDetail.controller")
	public String POSignStatementDetail(HttpSession session, Model model, PO_SigningProcessBean bean,
			BindingResult bindingResult) throws ParseException {
		String po_id = bean.getPo_id();
		List<PO_SigningProcessBean> POprocess = pO_SigningProcessService.selectpoid(po_id);
		String ck_id = "CK"+po_id.substring(2);
		List<Inv_SigningProcessBean> Invprocess = inv_SigningProcessService.selectchk_Id(ck_id);
		String acc_id = "AC"+ck_id.substring(2);
		List<Account_SigningProcessBean> ACCprocess = account_SigningProcessService.selectPOprocess(acc_id);
		
		
		if(Invprocess==null) {
			model.addAttribute("po_id", po_id);
			model.addAttribute("POprocess", POprocess);
		}else {
			model.addAttribute("po_id", po_id);
			model.addAttribute("POprocess", POprocess);
			model.addAttribute("ck_id", ck_id);
			model.addAttribute("Invprocess", Invprocess);
			model.addAttribute("acc_id", acc_id);
			model.addAttribute("ACCprocess", ACCprocess);
		}
		
		
		
		
		return "POSignStatementDetail.do";
	}
	
	@RequestMapping("/Po/POFinalStatement.controller")
	public String POFinalStatement(HttpSession session, Model model, PO_SigningProcessBean bean,
			BindingResult bindingResult) {
		
		EmployeeBean EmployeeBeanbean = (EmployeeBean)session.getAttribute("user");
		String empid = EmployeeBeanbean.getEmp_id();
		List<PO_SigningProcessBean> accountDone = pO_SigningProcessService.selectempidsend(empid, "已結案");
		if(accountDone!=null) {
			model.addAttribute("accountDone",accountDone);
		}
		else {
			model.addAttribute("noaccountDone","採購無結案請款單");
		}
		
		return "POFinalStatement.do";
	}
	
	@RequestMapping("/Po/POFinalStatementDetail.controller")
	public String POFinalStatementDetail(HttpSession session, Model model, PO_SigningProcessBean bean,
			BindingResult bindingResult,String po_id) {
		PO_MainBean mainbean = pO_MainService.select(po_id);
		//Set<PO_DetailBean> detailbean = mainbean.getpO_DetailBean();
		if(mainbean!=null) {
			model.addAttribute("mainbean",mainbean);
			
		}
		else{
			model.addAttribute("nomainbean","無請購資訊");
		}
		
		
		return "POFinalStatementDetail.do";
	}
	

}
