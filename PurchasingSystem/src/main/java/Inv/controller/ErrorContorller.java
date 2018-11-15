package Inv.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Apply.model.EmployeeBean;

@Controller
public class ErrorContorller {

	@RequestMapping("/Inv/errerPage")
	public  String Error(HttpSession session) {
		EmployeeBean bean = (EmployeeBean) session.getAttribute("user");
		if(bean.getEmp_dep().equals("採購部")) {
			return "POlogin.success";			
		}
		else if(bean.getEmp_dep().equals("財務部")) {
			return "Acclogin.success";
		}
        else if(bean.getEmp_dep().equals("品管部")) {
        	return "Invlogin.success";
		}else if(bean.getEmp_dep().equals("研發部")){
			return "login.success";
		}else {
			return "ceo.login";
		}
		
		
	}
}
