package Account.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SocketUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Account_InvoiceBean;
import Account.service.Account_InvoiceService;
import Account.service.Account_SigningProcessService;
import Apply.model.AppDetailBean;
import Apply.model.App_MainBean;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Apply.service.App_MainService;
import Apply.service.App_SigningProcessService;
import Po.model.PO_DetailBean;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_DetailService;
import Po.service.PO_MainService;
import Po.service.PO_SigningProcessService;



@Controller
public class AccountSignController {
	@Autowired
	Account_InvoiceService account_InvoiceService;
	@Autowired
	Account_SigningProcessService account_SigningProcessService;
   
	@RequestMapping("/Account/newInvoice.controller")
	public String accountSigner(Account_InvoiceBean bean,BindingResult bindingResult,
			Model model ,HttpSession session,String send,String SignSug) {
			
			
		
			return "xxxx";
		
		
//		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
//		String empid=ben.getEmp_id();
//		Map<String, String> errors = new HashMap<String, String>();//請輸入簽核意見
//		if(SignSug ==null ||SignSug.length()==0||SignSug.trim().isEmpty()) {
//			errors.put("plz", "請輸入文字");
//		}
//		if(errors.size()>0) {
//			String appid=bean.getApp_id();
//			App_MainBean xs=app_MainService.select(appid);
//			model.addAttribute("appid", appid);
//			model.addAttribute("singerlist", xs);
//			model.addAttribute("error", errors);
//			return "apply.signerdetail";
//		}
//		java.util.Date date = new java.util.Date();
//		java.sql.Date datas =new java.sql.Date(date.getTime());
//		    if (send.equals("請購核准")) {//如果按下請購核准就產生採購單
//		    	
//		  App_SigningProcessBean thissign = app_SigningProcessService.select(bean.getApp_sta(), bean.getApp_id());
//		  thissign.setSig_date( datas);
//		  thissign.setSig_sta("請購單完成");//請購欄位改為完成
//		  thissign.setSig_sug(SignSug);
//		  
//		  App_MainBean app_MainBean= thissign.getApp_MainBean();
//		  
//		  Set<AppDetailBean> appDetailBean =thissign.getApp_MainBean().getAppDetailBean();
//		 String poid = "Po"+app_MainBean.getApp_id().substring(2);
//		 
//		 PO_MainBean pO_MainBean=new PO_MainBean(poid,"emp000","ven001",null,null);
//		 pO_MainService.insert(pO_MainBean);
//		 for(AppDetailBean xs:appDetailBean) {
//			 PO_DetailBean sx =new PO_DetailBean(poid,xs.getPart_no(),xs.getPro_price(),null,null,xs.getApp_amount());
//			 pO_DetailService.insert(sx);
//		 }
//		 
//		 PO_SigningProcessBean pO_SigningProcessBean =new PO_SigningProcessBean(empid,"產生採購單",poid,datas,"產生採購單",SignSug,1);
//		 PO_SigningProcessBean pO_SigningProcessBean1 =new PO_SigningProcessBean("emp005","分派採購者",poid,null,"分派中",null,2);
//		 pO_SigningProcessService.insert(pO_SigningProcessBean);
//		 pO_SigningProcessService.insert(pO_SigningProcessBean1);
//		    }
//		    else if(send.equals("送出")) {//如果按下送出就update已簽核
//App_SigningProcessBean thissign1 = app_SigningProcessService.select(bean.getApp_sta(), bean.getApp_id());
//	thissign1.setSig_date( datas);
//	thissign1.setSig_sta("已簽核");
//	thissign1.setSig_sug(SignSug);
//App_SigningProcessBean thissign2 = app_SigningProcessService.selectrank(bean.getApp_id(), bean.getSig_rank()+1);
//thissign2.setSig_date( null);
//thissign2.setSig_sta("簽核中"); 
//thissign2.setSig_sug(null);
//		    }
//            else if(send.equals("退回")) {//如果按下退回就退回給上一位
//App_SigningProcessBean thissign1 = app_SigningProcessService.select(bean.getApp_sta(), bean.getApp_id());
//            	thissign1.setSig_date(datas);
//            	thissign1.setSig_sta("未簽核");
//            	thissign1.setSig_sug(SignSug);
//App_SigningProcessBean thissign2 = app_SigningProcessService.selectrank(bean.getApp_id(), bean.getSig_rank()-1);
//            thissign2.setSig_sta("退回中");  	
//		    	
//		    }
//            else if(send.equals("註銷請購單")) {
//		    	
//		    }
//			return "login.success";
	}
}
