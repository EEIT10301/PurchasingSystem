package Apply.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

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
import misc.AutoSendEmailByJava;



@Controller
public class ApplySignController {
	@Autowired
	App_SigningProcessService app_SigningProcessService;
	@Autowired
	App_MainService app_MainService;
	@Autowired
	PO_SigningProcessService pO_SigningProcessService;
	@Autowired
	PO_DetailService pO_DetailService;
	@Autowired
	PO_MainService pO_MainService;
	
	@RequestMapping("/Apply/ApplySignpro.controller")
	public String querySignprocess(App_SigningProcessBean bean,BindingResult bindingResult,
	Model model ,HttpSession session) {
		String appid=bean.getApp_id();
		App_MainBean app_Main=app_MainService.select(appid);
		List<App_SigningProcessBean> xs=app_SigningProcessService.selectallappid(appid);
		String poid= "Po"+appid.substring(2);
		List<PO_SigningProcessBean> beans = pO_SigningProcessService.selectpoid(poid);
		if(beans ==null) {
			//beans為空值，加請購單的appid,xs放入addAttribute到前端給apply.querysign
			// 登入用請購員工介面，按請購單狀態
			model.addAttribute("app_Main", app_Main);
			model.addAttribute("appid", appid);
			model.addAttribute("queryprocess", xs);
			return "apply.querysign";
		}else {
			//beans有值，加請購單的appid,xs放入addAttribute到前端給apply.querysign
					//	和採購單的poid,beans放入addAttribute到前端給apply.querysign
					//  登入介面用請購員工，按請購單狀態
			model.addAttribute("app_Main", app_Main);
			model.addAttribute("poid", poid);
			model.addAttribute("queryprocesspo", beans);
			model.addAttribute("appid", appid);
			model.addAttribute("queryprocess", xs);
			return "apply.querysign";
		}
		
		
		
	}
	@RequestMapping("/Apply/ApplySignnerdetail.controller")
	//請參照ApplyMangerSystem.jsp
	public String signerdetail(String app_manger,String app_sta,String app_id,
			Model model ,HttpSession session,String send) {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
				String appid=app_id;
				App_MainBean appmain=app_MainService.select(appid);
				Set<App_SigningProcessBean>  app_Sign=appmain.getApp_SigningProcessBean();
				Set<AppDetailBean> appDetail=appmain.getAppDetailBean();				
	if(send.equals("sendok")) {//按下簽核中表單 1.請購核准 退回 2.送出 退回
		App_SigningProcessBean xs = new App_SigningProcessBean();
		App_SigningProcessBean xs1 = new App_SigningProcessBean();				
		for(App_SigningProcessBean x:app_Sign) {
if(x.getApp_manger().equals(empid)&&x.getSig_sta().equals("簽核中")&&x.getApp_sta().equals("請購核准")) {
				//總經理或請購主管按下完成
				xs=x;
				for(App_SigningProcessBean xz:app_Sign) {
					if(xz.getSig_rank()==x.getSig_rank()-1)	{
						xs1=xz;
					}
				
				}

				model.addAttribute("thispro", xs);//本次簽核流程
				model.addAttribute("beforepro", xs1);//本次簽核流程的前一次
				model.addAttribute("sendsubmit1", "請購核准");
				model.addAttribute("sendsubmit2", "退回");
}else if(x.getApp_manger().equals(empid)&&x.getSig_sta().equals("簽核中")&&x.getApp_sta().equals("請購主管審核中")){
	//採購主管點給總經理
	xs=x;
	for(App_SigningProcessBean xz:app_Sign) {
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
}else {//按下退回中表單 1.送出 註銷請購單 2.送出 退回
	App_SigningProcessBean xs = new App_SigningProcessBean();
	App_SigningProcessBean xs1 = new App_SigningProcessBean();				
for(App_SigningProcessBean x:app_Sign) {
if(x.getApp_manger().equals(empid)&&x.getSig_sta().equals("退回中")&&x.getApp_sta().equals("請購主管審核中"))  {
		//總經理退採購主管時
			xs=x;
			for(App_SigningProcessBean xz:app_Sign) {
				if(xz.getSig_rank()==x.getSig_rank()+1)	{
					xs1=app_SigningProcessService.selectrank(xz.getApp_id(), xz.getSig_rank());
				}
			
			}
			model.addAttribute("nothispro", xs);//本次退回流程
			model.addAttribute("nobeforepro", xs1);//本次退回流程上一個
			model.addAttribute("sendsubmit1", "送出");
			model.addAttribute("sendsubmit2", "退回");

			}else if(x.getApp_manger().equals(empid)&&x.getSig_sta().equals("退回中")&&x.getApp_sta().equals("申請中")) {
				//採購主管退給採購時
				xs=x;
				for(App_SigningProcessBean xz:app_Sign) {
					if(xz.getSig_rank()==x.getSig_rank()+1)	{
						xs1=app_SigningProcessService.selectrank(xz.getApp_id(), xz.getSig_rank());
					}
				
				}
				model.addAttribute("nothispro", xs);//本次退回流程
				model.addAttribute("nobeforepro", xs1);//本次退回流程上一個
				model.addAttribute("sendsubmit1", "送出");
				model.addAttribute("sendsubmit2", "註銷請購單");
			}		
}										
}

	
				model.addAttribute("appid", appid);//請購id
				model.addAttribute("appmain", appmain);//請購主檔
				model.addAttribute("appDetail", appDetail);//請購細項
				model.addAttribute("app_Sign", app_Sign);//請購簽核流程app_Sign
				return "apply.signerdetail";
				
			}
//	@RequestMapping("/Apply/toApplySignnerdetail.controller")
//	public String tosignerdetail(App_SigningProcessBean bean,BindingResult bindingResult,
//			Model model ,HttpSession session) {
//		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
//		String empid=ben.getEmp_id();
//		List<App_SigningProcessBean> Sproductlistsx1 =app_SigningProcessService.selectmangers(empid, "簽核中");;
//		List<App_SigningProcessBean> Sproductlistsx2 =app_SigningProcessService.selectmangers(empid, "退回中");
//		List<App_SigningProcessBean> Sproductlistsx3 =new LinkedList<App_SigningProcessBean>();
//		Integer Applylistsranks =0;
//		Integer nosendranks=0;
//		if(Sproductlistsx1==null) {
//		}else {
//			for(int i=0;i<Sproductlistsx1.size();i++) {
//				App_SigningProcessBean xsz=new App_SigningProcessBean();
//				xsz=Sproductlistsx1.get(i);			
//					Applylistsranks=xsz.getSig_rank();
//					String apid = xsz.getApp_id();
//					App_SigningProcessBean xsz1 =app_SigningProcessService.selectrank(apid, Applylistsranks-1);
//					if(xsz1!=null) {
//						Sproductlistsx3.add(xsz1);
//					}
//			}
//		}
//		if(Sproductlistsx1!=null||Sproductlistsx2!=null){
//			model.addAttribute("Applylistsranks", Applylistsranks);
//			model.addAttribute("nosendranks", nosendranks);
//			model.addAttribute("Applylists", Sproductlistsx1);
//			model.addAttribute("nosend", Sproductlistsx2);
//			model.addAttribute("Applylistsone", Sproductlistsx3);
//			
//			return "apply.mangersign";
//		}else{
//			model.addAttribute("noApplylist", "無待簽核表單");
//			return "apply.mangersign";
//		}				
//			}
	@RequestMapping("/Apply/toApplySignnerdetail.controller")
	public String tosignerdetail(App_SigningProcessBean bean,BindingResult bindingResult,
			Model model ,HttpSession session) {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
		List<App_SigningProcessBean> Sproductlistsx1 =app_SigningProcessService.selectmangers(empid, "簽核中");
		List<App_SigningProcessBean> Sproductlistsxs1=new LinkedList<App_SigningProcessBean>();
		List<App_SigningProcessBean> Sproductlistsx2 =app_SigningProcessService.selectmangers(empid, "退回中");
		List<App_SigningProcessBean> Sproductlistsxs2=new LinkedList<App_SigningProcessBean>();
		List<App_SigningProcessBean> Sproductlistsx3 =new LinkedList<App_SigningProcessBean>();
		List<App_SigningProcessBean> Sproductlistsx4 =new LinkedList<App_SigningProcessBean>();
		Integer Applylistsranks =0;
		Integer nosendranks=0;
		Integer pages=0;
		Integer pagesize=5;
		if(Sproductlistsx1==null) {
		}else {
			pages=Sproductlistsx1.size()/5;
			if(Sproductlistsx1.size()%5>0) {
				pages++;
			}
			Sproductlistsxs1=app_SigningProcessService.selectemppoidsendpages(empid, "簽核中", 0, pagesize);
			for(int i=0;i<Sproductlistsxs1.size();i++) {
				App_SigningProcessBean xsz=new App_SigningProcessBean();
				xsz=Sproductlistsxs1.get(i);			
					Applylistsranks=xsz.getSig_rank();
					String apid = xsz.getApp_id();
					App_SigningProcessBean xsz1 =app_SigningProcessService.selectrank(apid, Applylistsranks-1);
					if(xsz1!=null) {
						Sproductlistsx3.add(xsz1);
					}
			}
		}
		if(Sproductlistsx2!=null) {
			if(pages<=0) {				
				pages=Sproductlistsx2.size()/5;
				if(Sproductlistsx2.size()%5>0) {
					pages++;
				}
			}
			Sproductlistsxs2=app_SigningProcessService.selectemppoidsendpages(empid, "退回中", 0, pagesize);
			for(int i=0;i<Sproductlistsxs2.size();i++) {
				App_SigningProcessBean xsz=new App_SigningProcessBean();
				xsz=Sproductlistsxs2.get(i);			
					Applylistsranks=xsz.getSig_rank();
					String apid = xsz.getApp_id();
					App_SigningProcessBean xsz1 =app_SigningProcessService.selectrank(apid, Applylistsranks+1);
					if(xsz1!=null) {
						Sproductlistsx4.add(xsz1);
					}
			}
		}
		if(Sproductlistsx1!=null||Sproductlistsx2!=null){
			model.addAttribute("pages", pages);
			model.addAttribute("Applylistsranks", Applylistsranks);
			model.addAttribute("nosendranks", nosendranks);
			model.addAttribute("Applylists", Sproductlistsxs1);
			model.addAttribute("nosend", Sproductlistsxs2);
			model.addAttribute("Applylistsone", Sproductlistsx3);
			model.addAttribute("nosendone", Sproductlistsx4);
			return "apply.mangersign";
		}else{
			model.addAttribute("noApplylist", "無待簽核表單");
			return "apply.mangersign";
		}				
			}
	@RequestMapping("/Apply/toApplySignnerdetailpages.controller")
	public String tosignerdetailpage(App_SigningProcessBean bean,BindingResult bindingResult,
			Model model ,HttpSession session,String page) {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
		List<App_SigningProcessBean> Sproductlistsx1 =app_SigningProcessService.selectmangers(empid, "簽核中");
		List<App_SigningProcessBean> Sproductlistsxs1=new LinkedList<App_SigningProcessBean>();
		List<App_SigningProcessBean> Sproductlistsx2 =app_SigningProcessService.selectmangers(empid, "退回中");
		List<App_SigningProcessBean> Sproductlistsxs2=new LinkedList<App_SigningProcessBean>();
		List<App_SigningProcessBean> Sproductlistsx3 =new LinkedList<App_SigningProcessBean>();
		List<App_SigningProcessBean> Sproductlistsx4 =new LinkedList<App_SigningProcessBean>();
		Integer Applylistsranks =0;
		Integer nosendranks=0;
		Integer pages=0;
		Integer thispage =Integer.valueOf(page);
		
		Integer beginindex = (thispage-1)*5;
		Integer pagesize = 5;
		if(Sproductlistsx1==null) {
		}else {
			pages=Sproductlistsx1.size()/5;
			if(Sproductlistsx1.size()%5>0) {
				pages++;
			}
			Sproductlistsxs1=app_SigningProcessService.selectemppoidsendpages(empid, "簽核中", beginindex, pagesize);
			if(Sproductlistsxs1!=null) {		
				for(int i=0;i<Sproductlistsx1.size();i++) {
					App_SigningProcessBean xsz=new App_SigningProcessBean();
					xsz=Sproductlistsx1.get(i);			
					Applylistsranks=xsz.getSig_rank();
					String apid = xsz.getApp_id();
					App_SigningProcessBean xsz1 =app_SigningProcessService.selectrank(apid, Applylistsranks-1);
					if(xsz1!=null) {
						Sproductlistsx3.add(xsz1);
					}
				}
			}
		}
		if(Sproductlistsx2!=null) {
			if(pages<=0) {				
				pages=Sproductlistsx2.size()/5;
				if(Sproductlistsx2.size()%5>0) {
					pages++;
				}
			}
			Sproductlistsxs2=app_SigningProcessService.selectemppoidsendpages(empid, "退回中", beginindex, pagesize);
			if(Sproductlistsxs2!=null) {
				
				for(int i=0;i<Sproductlistsxs2.size();i++) {
					App_SigningProcessBean xsz=new App_SigningProcessBean();
					xsz=Sproductlistsxs2.get(i);			
					Applylistsranks=xsz.getSig_rank();
					String apid = xsz.getApp_id();
					App_SigningProcessBean xsz1 =app_SigningProcessService.selectrank(apid, Applylistsranks+1);
					if(xsz1!=null) {
						Sproductlistsx4.add(xsz1);
					}
				}
			}
		}
		if(Sproductlistsx1!=null||Sproductlistsx2!=null){
			model.addAttribute("pages", pages);
			model.addAttribute("thispage", thispage);
			model.addAttribute("Applylistsranks", Applylistsranks);
			model.addAttribute("nosendranks", nosendranks);
			model.addAttribute("Applylists", Sproductlistsxs1);
			model.addAttribute("nosend", Sproductlistsxs2);
			model.addAttribute("Applylistsone", Sproductlistsx3);
			model.addAttribute("nosendone", Sproductlistsx4);
			return "apply.mangersign";
		}else{
			model.addAttribute("noApplylist", "無待簽核表單");
			return "apply.mangersign";
		}				
			}
	@RequestMapping("/Apply/toApplySignpro.controller")
	//此方法是用在請購員工的頁面，在"請購單進度"的連結上	
	public String toquerySignprocess(App_SigningProcessBean bean,BindingResult bindingResult,
			Model model ,HttpSession session) {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
		if(ben.getEmp_level()==1) {//如果是非主管的員工
			List<App_SigningProcessBean> Sproductlistsx1 =new LinkedList<App_SigningProcessBean>();
			List<App_SigningProcessBean> Sproductlistsx2 =new LinkedList<App_SigningProcessBean>();
			Sproductlistsx2=app_SigningProcessService.selectfromlastemp(empid);
           if(Sproductlistsx2!=null){//查詢是否有請購單號
        	   Integer pages=Sproductlistsx2.size()/5;
        	   if((Sproductlistsx2.size()%5)>0) {
        		   pages++;
        	   }
        	   Integer thissize=0;
        	   if(Sproductlistsx2.size()<5) {
        		   thissize=Sproductlistsx2.size();
        	   }else {
        		   thissize=5;
        	   }
        	   for (int i=0;i<thissize;i++ ){
        		   App_SigningProcessBean x = Sproductlistsx2.get(i);
        		   Sproductlistsx1.add(x);
        	   }
        	   
        	   model.addAttribute("pages",pages);
				model.addAttribute("Applylists", Sproductlistsx1);
				return "apply.sign";
			}else{
				model.addAttribute("noApplylist", "無請購中單號");
				return "apply.sign";
			}	
		}else {
			List<App_SigningProcessBean> Sproductlistsx1 =new LinkedList<App_SigningProcessBean>();
			List<App_SigningProcessBean> Sproductlistsx2 =new LinkedList<App_SigningProcessBean>();
			Sproductlistsx1=app_SigningProcessService.selectfromlastemp1(1);
			if(Sproductlistsx1!=null) {//如果是主管
				Integer thissize=0;
				Integer pages=Sproductlistsx1.size()/5;
				if((Sproductlistsx1.size()%5)>0) {
					pages++;
				}
				if(Sproductlistsx1.size()<5) {
					thissize=Sproductlistsx1.size();
				}else {
					thissize=5;
				}
	        	   for (int i=0;i<thissize;i++  ){
	        		   App_SigningProcessBean x = Sproductlistsx1.get(i);
	        		   Sproductlistsx2.add(x);
	        	   }
	        	   
				model.addAttribute("pages",pages);
				model.addAttribute("Applylists", Sproductlistsx2);
				return "apply.sign";
			}else {
				model.addAttribute("noApplylist", "無請購中單號");
				return "apply.sign";
			}
				
		}
		
			}
	@RequestMapping("/Apply/toApplySignpropage.controller")
	//此方法是用在請購員工的頁面，在"請購單進度"的連結上	
	public String toquerySignprocesspages(App_SigningProcessBean bean,BindingResult bindingResult,
			Model model ,HttpSession session,String page) {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
		Integer thispage =Integer.valueOf(page);
		
		Integer beginindex = (thispage-1)*5+1;
		Integer endindex = (thispage)*5;
		if(ben.getEmp_level()==1) {//如果是非主管的員工
			List<App_SigningProcessBean> Sproductlistsx1 =new LinkedList<App_SigningProcessBean>();
			List<App_SigningProcessBean> Sproductlistsx2 =new LinkedList<App_SigningProcessBean>();
			Sproductlistsx2=app_SigningProcessService.selectfromlastemp(empid);
           if(Sproductlistsx2!=null){//查詢是否有請購單號
        	   Integer pages=Sproductlistsx2.size()/5;
        	   if((Sproductlistsx2.size()%5)>0) {
        		   pages++;
        	   }
        	   if(thispage==pages) {
        		   endindex=Sproductlistsx2.size();
        	   }
        	   for (int i=(beginindex-1);i<endindex;i++ ){
        		   App_SigningProcessBean x = Sproductlistsx2.get(i);
        		   Sproductlistsx1.add(x);
        	   }
        	   
        	   model.addAttribute("pages",pages);
        	   model.addAttribute("thispage",thispage);
				model.addAttribute("Applylists", Sproductlistsx1);
				return "apply.sign";
			}else{
				model.addAttribute("noApplylist", "無請購中單號");
				return "apply.sign";
			}	
		}else {
			List<App_SigningProcessBean> Sproductlistsx1 =new LinkedList<App_SigningProcessBean>();
			List<App_SigningProcessBean> Sproductlistsx2 =new LinkedList<App_SigningProcessBean>();
			Sproductlistsx1=app_SigningProcessService.selectfromlastemp1(1);
			if(Sproductlistsx1!=null) {//如果是主管
				Integer pages=Sproductlistsx1.size()/5;
				if((Sproductlistsx1.size()%5)>0) {
					pages++;
				}
	        	   if(thispage==pages) {
	        		   endindex=Sproductlistsx1.size();
	        	   }
	        	   for (int i=(beginindex-1);i<endindex;i++ ){
	        		   App_SigningProcessBean x = Sproductlistsx1.get(i);
	        		   Sproductlistsx2.add(x);
	        	   }
				model.addAttribute("pages",pages);
				model.addAttribute("thispage",thispage);
				model.addAttribute("Applylists", Sproductlistsx2);
				return "apply.sign";
			}else {
				model.addAttribute("noApplylist", "無請購中單號");
				return "apply.sign";
			}
				
		}
		
			}	
	@RequestMapping("/Apply/applysignss.controller")
	public String applySigner(App_SigningProcessBean bean,BindingResult bindingResult,
			Model model ,HttpSession session,String send,String SignSug) throws ParseException, UnsupportedEncodingException {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
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
		java.util.Date date = new java.util.Date();
		java.sql.Date data1 = new java.sql.Date(date.getTime());
		DateFormat dateFormate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now= dateFormate.format(data1);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date datas=sdf.parse(now);
		    if (send.equals("請購核准")) {//如果按下請購核准就產生採購單
		    	
		  App_SigningProcessBean thissign = app_SigningProcessService.select(bean.getApp_sta(), bean.getApp_id());
		  thissign.setSig_date( datas);
		  thissign.setSig_sta("請購單完成");//請購欄位改為完成
		  thissign.setSig_sug(SignSug);
		  
		  App_MainBean app_MainBean= thissign.getApp_MainBean();
		  
		  Set<AppDetailBean> appDetailBean =thissign.getApp_MainBean().getAppDetailBean();
		 String poid = "Po"+app_MainBean.getApp_id().substring(2);
		 
		 PO_MainBean pO_MainBean=new PO_MainBean(poid,"emp000","ven001",null,null);
		 pO_MainService.insert(pO_MainBean);
		 for(AppDetailBean xs:appDetailBean) {
			 PO_DetailBean sx =new PO_DetailBean(poid,xs.getPart_no(),xs.getPro_price(),null,null,xs.getApp_amount());
			 pO_DetailService.insert(sx);
		 }
		 
		 PO_SigningProcessBean pO_SigningProcessBean =new PO_SigningProcessBean(empid,"產生採購單",poid,datas,"產生採購單",SignSug,1);
		 PO_SigningProcessBean pO_SigningProcessBean1 =new PO_SigningProcessBean("emp005","分派採購者",poid,null,"分派中",null,2);
		 pO_SigningProcessService.insert(pO_SigningProcessBean);
		 pO_SigningProcessService.insert(pO_SigningProcessBean1);
		    }
		    else if(send.equals("送出")) {//如果按下送出就update已簽核
App_SigningProcessBean thissign1 = app_SigningProcessService.select(bean.getApp_sta(), bean.getApp_id());
	thissign1.setSig_date( datas);
	thissign1.setSig_sta("已簽核");
	thissign1.setSig_sug(SignSug);
App_SigningProcessBean thissign2 = app_SigningProcessService.selectrank(bean.getApp_id(), bean.getSig_rank()+1);
String thissendemail = thissign2.getEmployeeBean().getEmp_email();
AutoSendEmailByJava sendemail =new AutoSendEmailByJava();
sendemail.processMemberWishNotice(thissendemail, "待簽核請購單", "您有一張待簽核的請購單 請點下列連結登入"+"http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/MainPage.jsp");
thissign2.setSig_date( null);
thissign2.setSig_sta("簽核中"); 
thissign2.setSig_sug(null);
		    }
            else if(send.equals("退回")) {//如果按下退回就退回給上一位
App_SigningProcessBean thissign1 = app_SigningProcessService.select(bean.getApp_sta(), bean.getApp_id());
            	thissign1.setSig_date(datas);
            	thissign1.setSig_sta("未簽核");
            	thissign1.setSig_sug(SignSug);
App_SigningProcessBean thissign2 = app_SigningProcessService.selectrank(bean.getApp_id(), bean.getSig_rank()-1);
String thissendemail = thissign2.getEmployeeBean().getEmp_email();
AutoSendEmailByJava sendemail =new AutoSendEmailByJava();
sendemail.processMemberWishNotice(thissendemail, "待簽核請購單", "您有一張被退回的請購單 請點下列連結登入"+"http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/MainPage.jsp");
            thissign2.setSig_sta("退回中");  	
		    	
		    }
            else if(send.equals("註銷請購單")) {
           App_SigningProcessBean thissign1 = app_SigningProcessService.select(bean.getApp_sta(), bean.getApp_id());
            	thissign1.setSig_date( datas);
            	thissign1.setSig_sta("已註銷");
            	thissign1.setSig_sug(SignSug);
		    }
		    if(ben.getEmp_job().equals("總經理")) {
		    	return "ceo.login";
		    }
			return "login.success";
			}
}
