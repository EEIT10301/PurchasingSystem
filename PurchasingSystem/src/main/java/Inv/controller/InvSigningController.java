package Inv.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Account.service.Inv_ProductListService;
import Account.service.Inv＿ProductCheckService;
import Apply.model.EmployeeBean;
import Apply.service.App_MainService;
import Apply.service.EmployeeService;
import Inv.model.Inv_MainBean;
import Inv.model.Inv_SigningProcessBean;
import Inv.service.Inv_MainSerivce;
import Inv.service.Inv_SigningProcessService;
import Po.model.PO_MainBean;
import Po.service.PO_MainService;

@Controller
public class InvSigningController {
	@Autowired
	Inv_SigningProcessService inv_SigningProcessService;
	@Autowired
	Inv_ProductListService inv_ProductListService;
	@Autowired
	PO_MainService po_MainService;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	Inv＿ProductCheckService inv＿ProductCheckService;

	@RequestMapping("/Inv/sendEmployee.controller") // 多少驗收單分派頁面
	public String sendEmployee(Model model, HttpSession session) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		List<Inv_SigningProcessBean> list = inv_SigningProcessService.selectempidsend(beans.getEmp_id(), "待分派");
		List<Inv_SigningProcessBean> lists = new LinkedList<Inv_SigningProcessBean>();
		if (list == null) {
			model.addAttribute("nosendlist", "無待分派驗收單");
			return "InvSendEmployee.do";
		} else {
			for (int i = 0; i < list.size(); i++) {
				Inv_SigningProcessBean x = list.get(i);
				String invid = x.getChk_Id();
				Inv_SigningProcessBean xs = inv_SigningProcessService.select("貨物狀態", invid);
				if (xs != null) {
					lists.add(x);
					lists.add(xs);
				}
			}
			model.addAttribute("sendlist", lists);
			return "InvSendEmployee.do";
		}

	}

	@RequestMapping("/Inv/InvsendEmployee.controller")//分派採購單頁面
	public String InvsendEmployee( Inv_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session, String send, String employeesend) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		Inv＿ProductCheckBean invmain = inv＿ProductCheckService.select(bean.getChk_Id());
		String invid = bean.getChk_Id();
		String invidonlynumber = "Po" + invid.substring(2);
		PO_MainBean pomain = po_MainService.select(invidonlynumber);
		List<EmployeeBean> empinvchkbeans = employeeService.selectPoEmployee(beans.getEmp_dep(), 1);
		model.addAttribute("pomain",pomain);
		model.addAttribute("empinvchkbeans",empinvchkbeans);
		model.addAttribute("invmain",invmain);
		model.addAttribute("SigningProcess",bean);		
		return "InvList.show";
	}
}
