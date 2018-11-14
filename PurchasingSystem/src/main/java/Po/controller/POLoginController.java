package Po.controller;

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
public class POLoginController {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private ApplicationContext context;
	
	@RequestMapping("/Po/POLogin.controller")
	public String poLogin(String username, String password, Model model, HttpSession session) {
		
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		
		if(username==null || username.length()==0) {
			
			errors.put("username", "未填寫帳號");
		}
		if(password==null || password.length()==0) {
			
			errors.put("password", "未輸入密碼");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			
			return "POlogin.errors";
		}
		//呼叫model
		EmployeeBean bean = employeeService.POLogin(username, password);
			
		//根據model執行結果，導向view
				if(bean==null) {
					errors.put("password", "登入失敗請重新登入");
					return "POlogin.errors";
					
				} else {
					
					session.setAttribute("user", bean);
					return "POlogin.success";
					
				}

	}
	@RequestMapping("/Po/POLogout.controller")
	public String poLogout(String username, String password, Model model, HttpSession session) {
		session.removeAttribute("user");
		return "indexlogin.return";
	}
	
}
