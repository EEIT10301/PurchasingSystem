package Po.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.service.PO_Vendor_InfoService;
import Apply.model.EmployeeBean;
import Apply.service.App_MainService;
import Apply.service.EmployeeService;
import Po.model.PO_DetailBean;
import Po.model.PO_MainBean;
import Po.model.PO_QueryBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_DetailService;
import Po.service.PO_MainService;
import Po.service.PO_QueryService;
import Po.service.PO_SigningProcessService;

@Controller
public class POManagerSignController {
	@Autowired
	PO_SigningProcessService pO_SigningProcessService;
	@Autowired
	App_MainService app_MainService;
	@Autowired
	PO_MainService pO_MainService;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	PO_Vendor_InfoService pO_Vendor_InfoService;
	@Autowired
	PO_DetailService pO_DetailService;
	@Autowired
	PO_QueryService pO_QueryService;
	@RequestMapping("/Po/POManagerSigner.controller") // 採購單審核頁面
	public String POManagerSigner(Model model, HttpSession session) {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
		List<PO_SigningProcessBean> PO_SignSend=pO_SigningProcessService.selectempidsend(empid, "簽核中");
		List<PO_SigningProcessBean> PO_SignBack=pO_SigningProcessService.selectempidsend(empid, "退回中");
		List<PO_SigningProcessBean> PO_SignSendRank =new LinkedList<PO_SigningProcessBean>();
		List<PO_SigningProcessBean> PO_SignBackRank =new LinkedList<PO_SigningProcessBean>();
		Integer Polistsranks=0;
		Integer Polistsbackranks=0;
		if(PO_SignSend==null) {
			
		}else {
			for(int i=0;i<PO_SignSend.size();i++) {
				PO_SigningProcessBean xsz=new PO_SigningProcessBean();
				xsz=PO_SignSend.get(i);			
				   Polistsranks=xsz.getSig_rank();
					String poid = xsz.getPo_id();
					PO_SigningProcessBean xsz1 =pO_SigningProcessService.selectempandrank(poid, Polistsranks-1);
					if(xsz1!=null) {
						PO_SignSendRank.add(xsz1);
					}
			}
		}
	if(PO_SignBack==null) {
			
		}else {
			for(int i=0;i<PO_SignBack.size();i++) {
				PO_SigningProcessBean xsz=new PO_SigningProcessBean();
				xsz=PO_SignBack.get(i);			
				Polistsbackranks=xsz.getSig_rank();
					String poid = xsz.getPo_id();
					PO_SigningProcessBean xsz1 =pO_SigningProcessService.selectempandrank(poid, Polistsbackranks+1);
					if(xsz1!=null) {
						PO_SignBackRank.add(xsz1);
					}
			}
		}
		if(PO_SignSend!=null||PO_SignBack!=null){
			model.addAttribute("PO_SignSend", PO_SignSend);
			model.addAttribute("PO_SignSendRank", PO_SignSendRank);
			model.addAttribute("PO_SignBack", PO_SignBack);
			model.addAttribute("PO_SignBackRank", PO_SignBackRank);			
			model.addAttribute("Polistsranks", Polistsranks);
			model.addAttribute("Polistsbackranks", Polistsbackranks);
			return "PoSignerProcess.to";
		}else{
			model.addAttribute("nopolist", "無待簽核表單");
			return "PoSignerProcess.to";
		}
		
	}
	@RequestMapping("/Po/POManagerSignertosign.controller") // 採購單審核頁面按下開始簽核
	public String POManagerSignertosign(Model model, HttpSession session,String po_manger
			,String po_sta,String po_id, String send) {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
		PO_MainBean pomain=pO_MainService.select(po_id);
		Set<PO_DetailBean> podetail=pomain.getpO_DetailBean();//採購細項
		Set<PO_SigningProcessBean> posignprocess=pomain.getpO_SigningProcessBean();//簽核流程
		Set<PO_QueryBean> poquery=pomain.getpO_QueryBean();//詢價紀錄
		
		
//		for(PO_SigningProcessBean x:posignprocess) {
//			if(x.getSig_rank()!=3||x.getSig_rank()!=4||x.getSig_rank()!=5) {
//				posignprocess.remove(x);
//				if(x.getSig_rank()==3&&x.getPo_sta().equals("詢價中")) {
//					posignprocess.remove(x);
//				}
//				if(x.getSig_rank()==5&&x.getPo_sta().equals("未下單")) {
//					posignprocess.remove(x);
//				}
//			}
//		}		
		if(send.equals("sendok")) {//按下簽核中表單
			PO_SigningProcessBean xs = new PO_SigningProcessBean();
			PO_SigningProcessBean xs1 = new PO_SigningProcessBean();
			for(PO_SigningProcessBean x:posignprocess) {
				if(x.getPo_manger().equals(empid)&&x.getSig_sta().equals("簽核中")&&x.getPo_sta().equals("主管審核完成")) {
					//總經理或採購主管按下完成
					xs=x;
					for(PO_SigningProcessBean xz:posignprocess) {
						if(xz.getSig_rank()==x.getSig_rank()-1)	{
							xs1=xz;
						}
					
					}

					model.addAttribute("thispro", xs);//本次簽核流程
					model.addAttribute("beforepro", xs1);//本次簽核流程的前一次
					model.addAttribute("sendsubmit1", "採購單審核完成");
					model.addAttribute("sendsubmit2", "退回");
				}else if(x.getPo_manger().equals(empid)&&x.getSig_sta().equals("簽核中")&&x.getPo_sta().equals("主管審核中")) {
					//採購主管點給總經理
					xs=x;
					for(PO_SigningProcessBean xz:posignprocess) {
						if(xz.getSig_rank()==x.getSig_rank()-1)	{
							xs1=xz;
						}
					
					}
					model.addAttribute("thispro", xs);//本次簽核流程
					model.addAttribute("beforepro", xs1);//本次簽核流程的前一次
					model.addAttribute("sendsubmit1", "送出");
					model.addAttribute("sendsubmit2", "退回");
				}
			}				
		}else {//按下退回中表單
			PO_SigningProcessBean xs = new PO_SigningProcessBean();
			//PO_SigningProcessBean xs1 = new PO_SigningProcessBean();
			PO_SigningProcessBean xs1 = new PO_SigningProcessBean();
			for(PO_SigningProcessBean x:posignprocess) {
			if(x.getPo_manger().equals(empid)&&x.getSig_sta().equals("退回中")&&x.getPo_sta().equals("主管審核中")) {
			//總經理退採購主管時
				xs=x;
				for(PO_SigningProcessBean xz:posignprocess) {
					if(xz.getSig_rank()==x.getSig_rank()+1)	{
						xs1=pO_SigningProcessService.selectempandrank(xz.getPo_id(), xz.getSig_rank());
					}
				
				}
				model.addAttribute("nothispro", xs);//本次退回流程
				model.addAttribute("nobeforepro", xs1);//本次退回流程上一個
				model.addAttribute("sendsubmit1", "送出");
				model.addAttribute("sendsubmit2", "退回");
	
				}else if(x.getPo_manger().equals(empid)&&x.getSig_sta().equals("退回中")&&x.getPo_sta().equals("詢價中")) {
					//採購主管退給採購時
					xs=x;
					for(PO_SigningProcessBean xz:posignprocess) {
						if(xz.getSig_rank()==x.getSig_rank()+1)	{
							xs1=pO_SigningProcessService.selectempandrank(xz.getPo_id(), xz.getSig_rank());
						}
					
					}
					model.addAttribute("nothispro", xs);//本次退回流程
					model.addAttribute("nobeforepro", xs1);//本次退回流程上一個
					model.addAttribute("sendsubmit1", "送出");
					model.addAttribute("sendsubmit2", "修改詢價單");
				
				}
			}
		}
		model.addAttribute("poid", po_id);//採購單id
		model.addAttribute("podetail", podetail);//採購系項
		model.addAttribute("pomainlist", pomain);//採購主表
		model.addAttribute("poquery", poquery);//採購詢價
		model.addAttribute("posignprocess", posignprocess);//採購簽核
		
		return "PoSignerProcessdetail.to";
		
		
	}
	@RequestMapping("/Po/POManagerSignertosigndetail.controller") // 採購單審核頁面按下開始簽核
	public String POManagerSignertosigndetail(PO_SigningProcessBean Bean,BindingResult bindingResult,
			Model model, HttpSession session
			,String send,String SignSug) throws ParseException {
		java.util.Date date = new java.util.Date();
		java.sql.Date data1 = new java.sql.Date(date.getTime());
		DateFormat dateFormate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now= dateFormate.format(data1);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date dates=sdf.parse(now);
        if(send.equals("送出")) {
PO_SigningProcessBean thissign=pO_SigningProcessService.select(Bean.getPo_sta(),Bean.getPo_id());//這次的流程
PO_SigningProcessBean nextsign=pO_SigningProcessService.selectempandrank(Bean.getPo_id(),Bean.getSig_rank()+1);
//下一個簽核流程
thissign.setSig_sta("已簽核");
thissign.setSig_date(dates);
thissign.setSig_sug(SignSug);

nextsign.setSig_sta("簽核中");



        }
        else if(send.equals("採購單審核完成")) {
        	PO_SigningProcessBean thissign=pO_SigningProcessService.select(Bean.getPo_sta(),Bean.getPo_id());//這次的流程
        	PO_SigningProcessBean nextsign=pO_SigningProcessService.selectempandrank(Bean.getPo_id(),Bean.getSig_rank()+1);
        	//下一個簽核流程
        	thissign.setSig_sta("採購單審核完成");
        	thissign.setSig_date(dates);
        	thissign.setSig_sug(SignSug);

        	nextsign.setSig_sta("下單中");
        }
        else if(send.equals("修改詢價單")) {
        	
        }
        else if(send.equals("退回")) {
        	PO_SigningProcessBean thissign=pO_SigningProcessService.select(Bean.getPo_sta(),Bean.getPo_id());//這次的流程
        	PO_SigningProcessBean beforesign=pO_SigningProcessService.selectempandrank(Bean.getPo_id(),Bean.getSig_rank()-1);
        	//下一個簽核流程
        	thissign.setSig_sta("未簽核");
        	thissign.setSig_date(dates);
        	thissign.setSig_sug(SignSug);

        	beforesign.setSig_sta("退回中");
        }
		return "POlogin.successint";
		
		
	}
}
