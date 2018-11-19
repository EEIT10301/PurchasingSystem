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
import Account.model.PO_Vendor_InfoBean;
import Account.service.Account_SigningProcessService;
import Apply.model.AppDetailBean;
import Apply.model.App_MainBean;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Apply.service.AppDetailService;
import Apply.service.App_MainService;
import Apply.service.App_SigningProcessService;
import Inv.model.Inv_SigningProcessBean;
import Inv.service.Inv_SigningProcessService;
import Po.model.PO_DetailBean;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_DetailService;
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
	App_SigningProcessService app_SigningProcessService;
	@Autowired
	PO_MainService pO_MainService;
	@Autowired
	PO_DetailService pO_DetailService;
	@Autowired
	App_MainService app_MainService;
	@Autowired
	AppDetailService appDetailService;
	
	
	@RequestMapping("/Po/POSignStatement.controller")
	public String POSignStatement(App_SigningProcessBean bean, Model model, HttpSession session) throws ParseException {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String EmpId = empbean.getEmp_id();
		if (empbean.getEmp_level() == 1) {// 如果是非主管的員工
			
			List<PO_SigningProcessBean> Statement = pO_SigningProcessService.selectpo_sta("產生採購單");
//			List<PO_SigningProcessBean> Statement =pO_SigningProcessService.selectempID(EmpId);
			
			for(int i=0;i<Statement.size();i++) {
				
				PO_SigningProcessBean SingleStatement = Statement.get(i);
				model.addAttribute("POSingle", SingleStatement);
				
			}
			
			model.addAttribute("POList", Statement);
			return "POSignStatement.do";
		}

		else {
			List<PO_SigningProcessBean> Statement = pO_SigningProcessService.selectpo_sta("產生採購單");
			model.addAttribute("POList", Statement);
			return "POSignStatement.do";
			
		}
		
	}

	@RequestMapping("/Po/POSignStatementDetail.controller")
	public String POSignStatementDetail(HttpSession session, Model model, PO_SigningProcessBean bean,
			BindingResult bindingResult) throws ParseException {
		String po_id = bean.getPo_id();
		List<PO_SigningProcessBean> POpart = pO_SigningProcessService.selectpoid(po_id);
		for(int i=0;i<POpart.size();i++) {
			PO_SigningProcessBean n = POpart.get(i);
			Set<PO_DetailBean> podetail = n.getpO_MainBean().getpO_DetailBean();
			model.addAttribute("podetail",podetail);
			
			PO_MainBean pomain = n.getpO_MainBean();
			model.addAttribute("pomain",pomain);
			
			EmployeeBean poEmployee = pomain.getEmployeeBean();
			model.addAttribute("poEmployee",poEmployee);
			
			PO_Vendor_InfoBean vendor = pomain.getpO_Vendor_InfoBean();
			model.addAttribute("vendor",vendor);
			
	
		}
		
		
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
		Integer emplevel=EmployeeBeanbean.getEmp_level();
		if(emplevel==1) {
			
			List<PO_SigningProcessBean> accountDone = pO_SigningProcessService.selectempidsend(empid, "已結案");
			if(accountDone!=null) {
				model.addAttribute("accountDone",accountDone);
			}
			else {
				model.addAttribute("noaccountDone","採購無結案請款單");
			}
		}else {
			List<PO_SigningProcessBean> accountDone = pO_SigningProcessService.selectonlySigSta("已結案");
			if(accountDone!=null) {
				model.addAttribute("accountDone",accountDone);
			}
			else {
				model.addAttribute("noaccountDone","採購無結案請款單");
			}
		}
		
		return "POFinalStatement.do";
	}
	
	@RequestMapping("/Po/POFinalStatementDetail.controller")
	public String POFinalStatementDetail(HttpSession session, Model model, PO_SigningProcessBean bean,
			BindingResult bindingResult,String po_id) {

		
		
		List<PO_SigningProcessBean> poDone = pO_SigningProcessService.selectpoid(po_id);
		model.addAttribute("poDone",poDone);//採購單簽核流程
		
		String Applyid = "Ap"+po_id.substring(2);
		List<App_SigningProcessBean> applyDone = app_SigningProcessService.selectallappid(Applyid);
		model.addAttribute("applyDone",applyDone);//請購單簽核流程
		
		String Invid = "CK"+po_id.substring(2);
		List<Inv_SigningProcessBean> InvDone = inv_SigningProcessService.selectchk_Id(Invid);
		model.addAttribute("InvDone",InvDone);//驗收單簽核流程
		
		
		String acc_id = "In"+Invid.substring(2);
		List<Account_SigningProcessBean> ACCDone = account_SigningProcessService.selectPOprocess(acc_id);
		model.addAttribute("ACCDone",ACCDone);//請款單簽核流程
		

		PO_MainBean pomainbean = pO_MainService.select(po_id);
		model.addAttribute("pomainDone",pomainbean);//採購單主檔
		
		
		List<PO_DetailBean> podetailbean = pO_DetailService.selectpo_id(po_id);
		model.addAttribute("podetailDone",podetailbean);//採購單細項
		
		App_MainBean appMainDone = app_MainService.select(Applyid);
		model.addAttribute("appMainDone",appMainDone);//請購單主檔
			
		List<AppDetailBean> appDetailDone = appDetailService.selectapp_id(Applyid);
		model.addAttribute("appDetailDone",appDetailDone);//請購單細項
		
		
		return "POFinalStatementDetail.do";
	}
	

}
