package Inv.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Apply.model.EmployeeBean;
import Inv.model.Inv_SigningProcessBean;
import Inv.service.Inv_SigningProcessService;

@Controller
public class InvSigningController {
	@Autowired
	Inv_SigningProcessService inv_SigningProcessService;

	@RequestMapping("/Inv/sendEmployee.controller")// 多少驗收單分派頁面
	public String sendEmployee(Model model, HttpSession session) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		List<Inv_SigningProcessBean> list = inv_SigningProcessService.selectempidsend(beans.getEmp_id(), "分派中");
		List<Inv_SigningProcessBean> lists = new LinkedList<Inv_SigningProcessBean>();
		if (list == null) {
			model.addAttribute("nosendlist", "無待分派驗收單");
			return "InvSendEmployee.do";
		} else {
			for (int i = 0; i < list.size(); i++) {
				Inv_SigningProcessBean x = list.get(i);
				String invid = x.getChk_Id();
				Inv_SigningProcessBean xs = inv_SigningProcessService.select("產生驗收單", invid);
				if (xs != null) {
					lists.add(x);
					lists.add(xs);
				}
			}
			model.addAttribute("sendlist", lists);
			return "InvSendEmployee.do";
		}
		
	}
}
