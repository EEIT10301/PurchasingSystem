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
	@RequestMapping("/Po/sendEmployee.controller")
	public String sendEmployee(Model model, HttpSession session) {

		// List<PO_SigningProcessBean>
		// list=pO_SigningProcessService.selectempidsend(bean.getEmp_id(),"分派中");
		List<PO_SigningProcessBean> list = pO_SigningProcessService.select();
		List<PO_SigningProcessBean> lists = new LinkedList<PO_SigningProcessBean>();
		if (list.size() > 0 && list != null) {

			for (int i = 0; i < list.size(); i++) {
				PO_SigningProcessBean x = list.get(i);

				if (x.getSig_rank() <= 2) {
					lists.add(x);
				}
			}
			model.addAttribute("sendlist", lists);
			return "SendEmployee.do";
		} else {
			model.addAttribute("nosendlist", "無待分派採購單");
			return "SendEmployee.do";
		}

	}
	
	@RequestMapping("/Po/sendEmployeesss.controller")
	public String sendEmployeedetail(PO_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session,String send) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		
		PO_MainBean pomain =pO_MainService.select(bean.getPo_id());
		String poid = bean.getPo_id();
		String poid1 = "Ap" + poid.substring(2);
		App_MainBean appmain = app_MainService.select(poid1);
		model.addAttribute("appmain", appmain);
		model.addAttribute("pomain", pomain);
		return "ListMain.show";
		
	}
}
