package Po.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import Apply.model.App_MainBean;
import Apply.model.EmployeeBean;
import Apply.service.App_MainService;
import Apply.service.EmployeeService;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_MainService;
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
	
	@RequestMapping("/Po/sendEmployee.controller")//多少採購單分派頁面
	public String sendEmployee(Model model, HttpSession session) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		// List<PO_SigningProcessBean>
		 List<PO_SigningProcessBean> list=pO_SigningProcessService.selectempidsend(beans.getEmp_id(),"分派中");
//		List<PO_SigningProcessBean> list = pO_SigningProcessService.select();
		List<PO_SigningProcessBean> lists = new LinkedList<PO_SigningProcessBean>();
		
		if (list== null) {
			model.addAttribute("nosendlist", "無待分派採購單");
			return "SendEmployee.do";
		}else {			
			for (int i = 0; i < list.size(); i++) {
				PO_SigningProcessBean x = list.get(i);
				String poid =x.getPo_id();
				PO_SigningProcessBean xs=pO_SigningProcessService.select("產生採購單", poid);
				if(xs!=null) {
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
	
	@RequestMapping("/Po/sendEmployeesss.controller")//主管待分派單頁面
	public String sendEmployeedetail(PO_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session,String send) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		
		PO_MainBean pomain =pO_MainService.select(bean.getPo_id());
		String poid = bean.getPo_id();
		String poid1 = "Ap" + poid.substring(2);
		App_MainBean appmain = app_MainService.select(poid1);
		List<EmployeeBean> empbeans=employeeService.selectPoEmployee(beans.getEmp_dep(), 1);
		model.addAttribute("appmain", appmain);
		model.addAttribute("pomain", pomain);
		model.addAttribute("empbeans", empbeans);
		model.addAttribute("SigningProcess", bean);
		return "ListMain.show";
		
	}
	@RequestMapping("/Po/sendlist.controller")//主管點選人分派頁面
	public String sendlist(PO_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session,String send,String employeesend,String SignSug) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		java.util.Date date = new java.util.Date();
		java.sql.Date datas =new java.sql.Date(date.getTime());
		PO_MainBean pomain =pO_MainService.select(bean.getPo_id());
		pomain.setEmp_id(employeesend);
		PO_SigningProcessBean secondsigningprocess=pO_SigningProcessService.select(bean.getPo_sta(), bean.getPo_id());
		secondsigningprocess.setSig_sta("已分派");
		secondsigningprocess.setSig_date(datas);
		secondsigningprocess.setSig_sug(SignSug);
		PO_SigningProcessBean secondsigningprocess1=new PO_SigningProcessBean(employeesend,"詢價中",bean.getPo_id(),null,"詢價中",null,3);
		pO_SigningProcessService.insert(secondsigningprocess1);
		model.addAttribute("sendok","分派完成");
		return "sendlist.ok";
		
	}
	@RequestMapping("/Po/selectprice.controller")//採購人員點選待詢價採購單頁面
	public String sendlistss( Model model,HttpSession session) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		String empid=beans.getEmp_id();
		List<PO_SigningProcessBean> selectlist=pO_SigningProcessService.selectempidsend(empid, "詢價中");
		List<PO_SigningProcessBean> selectlists=null;
				selectlists=new LinkedList<PO_SigningProcessBean>();
				if(selectlist==null) {
					
					model.addAttribute("noselectlists","無待詢價採購單");
					return "select.list";
				}else {
					for (int i = 0; i < selectlist.size(); i++) {
						PO_SigningProcessBean x = selectlist.get(i);
						PO_SigningProcessBean xs =pO_SigningProcessService.select("分派採購者", x.getPo_id());
						if(xs!=null) {
							selectlists.add(x);
							selectlists.add(xs);
						}
						model.addAttribute("selectlists",selectlists);
					
				}
					return "select.list";
				}	
				
//		if(selectlist.size()>0 && selectlist!=null) {
//		}
//		}else {
	}
	@RequestMapping("/Po/sendthisselectlist.controller")//採購人員點選待詢價採購單頁面
	public String sendlistss(String po_manger,String po_sta,String po_id, Model model,HttpSession session) {
		PO_SigningProcessBean bean =pO_SigningProcessService.select(po_sta, po_id);
		model.addAttribute("poprocess1",bean);
		return "select.listDetail";
	}
	
	@RequestMapping("/PO/sendsc.controller")
	public String createQueryMemo(String po_manger,String po_sta,String po_id, Model model,HttpSession session) {
		PO_SigningProcessBean bean =pO_SigningProcessService.select(po_sta, po_id);
		model.addAttribute("query",bean);		
		return "";
	}
		
}
