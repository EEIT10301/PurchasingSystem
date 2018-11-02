package Inv.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Apply.model.EmployeeBean;
import Apply.service.EmployeeService;

@Controller
public class InvLoginController {
@Autowired
private EmployeeService employeeService;
@Autowired
private ApplicationContext context;
@RequestMapping("/Inv/Invlogin.controller")
public String invLogin(String username, String password, Model model, HttpSession session) {
	Map<String, String> errors = new HashMap<String, String>();
	model.addAttribute("errors", errors);
	
	if(username==null || username.length()==0) {
		
		errors.put("username", "未填寫帳號");
	}
	if(password==null || password.length()==0) {
		
		errors.put("password", "未輸入密碼");
	}
	
	if(errors!=null && !errors.isEmpty()) {
		
		return "Invlogin.errors";
	}
	//呼叫model
	EmployeeBean bean = employeeService.InvLogin(username, password);
		
	//根據model執行結果，導向view
			if(bean==null) {
				errors.put("password", "Login failed, please try again.");
				return "Invlogin.errors";
				
			} else {
				
				session.setAttribute("user", bean);
				return "Invlogin.success";
				
			}
	
}
@RequestMapping("/Inv/InvLogout.controller")
public String poLogout(String username, String password, Model model, HttpSession session) {
	session.removeAttribute("user");
	return "Invlogin.errors";
}
}
