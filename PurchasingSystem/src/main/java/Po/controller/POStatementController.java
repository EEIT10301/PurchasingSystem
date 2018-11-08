package Po.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

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
import Po.model.PO_SigningProcessBean;
import Po.service.PO_SigningProcessService;

@Controller
public class POStatementController {
	@Autowired
	PO_SigningProcessService pO_SigningProcessService;
	@Autowired
	Inv_SigningProcessService inv_SigningProcessService;
	@Autowired
	Account_SigningProcessService account_SigningProcessService;
	
	
	@RequestMapping("/Po/POSignStatement.controller")
	public String POSignStatement(App_SigningProcessBean bean, Model model, HttpSession session
			,BindingResult bindingResult) throws ParseException {
		EmployeeBean empbean = (EmployeeBean) session.getAttribute("user");
		String EmpId = empbean.getEmp_id();
		
		
		
		Integer Polistsranks =0;
		Integer pages=0;
		Integer pagesize=5;
		// 如果是非主管的員工
			List<PO_SigningProcessBean> Statement = pO_SigningProcessService.selectStatement("產生採購單");
			
			List<PO_SigningProcessBean> Statement2 =new LinkedList<PO_SigningProcessBean>();
			
			
//			if(Statement==null) {			
//			}else {
//				pages=Statement.size()/5;
//				if(Statement.size()%5>0) {
//					pages++;
//				}
//				pO_SigningProcessService.selectoneempidpages(EmpId, 0, pagesize);
//				
//				for(int i=0;i<Statement.size();i++) {
//					PO_SigningProcessBean xsz=Statement.get(i);
//								
//						Polistsranks=xsz.getSig_rank();
//						String poid = xsz.getPo_id();									
//						PO_SigningProcessBean xsz1 =pO_SigningProcessService.selectempandrank(poid, Polistsranks-1);   
//						if(xsz1!=null) {
//							Statement2.add(xsz1);
//						}
//				}		
//			}
			
			
			
		

			model.addAttribute("POLists",Statement);
			model.addAttribute("pages",pages);
			return "POSignStatement.do";
		

		
	
	}

	@RequestMapping("/Po/POSignStatementDetail.controller")
	public String POSignStatementDetail(HttpSession session, Model model, PO_SigningProcessBean bean,
			BindingResult bindingResult) throws ParseException {
		String po_id = bean.getPo_id();
		List<PO_SigningProcessBean> POprocess = pO_SigningProcessService.selectpoid(po_id);
		String ck_id = "CK"+po_id.substring(2);
		List<Inv_SigningProcessBean> Invprocess = inv_SigningProcessService.selectchk_Id(ck_id);
		String acc_id = "In"+ck_id.substring(2);
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

}
