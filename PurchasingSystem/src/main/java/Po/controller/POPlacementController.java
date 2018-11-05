package Po.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.service.PO_Vendor_InfoService;
import Apply.model.App_MainBean;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Apply.service.App_MainService;
import Apply.service.EmployeeService;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_DetailService;
import Po.service.PO_MainService;
import Po.service.PO_QueryService;
import Po.service.PO_SigningProcessService;


@Controller
public class POPlacementController {
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
	
	@RequestMapping("/Po/SignedOrder.show")
	public String tosignerdetail(PO_SigningProcessBean bean,BindingResult bindingResult,
			Model model ,HttpSession session) {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
		String managerid = ben.getEmp_managerid();
		EmployeeBean aa = employeeService.select(managerid);
		
		List<PO_SigningProcessBean> Sproductlistsx1 =new LinkedList<PO_SigningProcessBean>();
		List<PO_SigningProcessBean> Sproductlistsx2 =new LinkedList<PO_SigningProcessBean>();
		List<PO_SigningProcessBean> Sproductlistsx3 =new LinkedList<PO_SigningProcessBean>();
	System.out.println(ben.getEmp_id());
		Sproductlistsx1=pO_SigningProcessService.selectmangers(empid, "下單中");
		Sproductlistsx2=pO_SigningProcessService.selectmangers(empid, "退回中");
		Integer Applylistsranks =0;
		Integer nosendranks=0;
		if (Sproductlistsx1 !=null && Sproductlistsx1.size()>0) {
			for(int i=0;i<Sproductlistsx1.size();i++) {
				PO_SigningProcessBean xsz=new PO_SigningProcessBean();
				xsz=Sproductlistsx1.get(i);			
					Applylistsranks=xsz.getSig_rank();
					String apid = xsz.getPo_id();
					PO_SigningProcessBean xsz1 =pO_SigningProcessService.selectrank(apid, Applylistsranks-1);
					if(xsz1!=null) {
						Sproductlistsx3.add(xsz1);
					}
			}
		}
//		if(send.equals("簽核")) {
//			model.addAttribute("selectlists", Sproductlistsx1);
//		}
		if(Sproductlistsx1!=null||Sproductlistsx2!=null){
			model.addAttribute("Applylistsranks", Applylistsranks);
			model.addAttribute("nosendranks", nosendranks);
			model.addAttribute("selectlists", Sproductlistsx1);
			model.addAttribute("nosend", Sproductlistsx2);
			model.addAttribute("Applylistsone", Sproductlistsx3);
			model.addAttribute("boss", aa);
			
			return "SignedOrder.show";
		}else{
			model.addAttribute("noApplylist", "無待簽核表單");
			return "SignedOrder.show";
		}				
			}
	
	
	
	

	@RequestMapping("/Po/signOrderDetail.show")
	public String signorderdetail(Model model,HttpSession session
			,PO_SigningProcessBean bean,String send,String SignSug) throws ParseException {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid = ben.getEmp_id();
		String Poid=bean.getPo_id();
		PO_MainBean xs = pO_MainService.select(Poid);
		
		model.addAttribute("Poid", Poid);
		model.addAttribute("productdetail", xs);
		
		
		java.util.Date date = new java.util.Date();
		java.sql.Date dates=new java.sql.Date(date.getTime());
		DateFormat dateFormate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now= dateFormate.format(dates);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date datas=sdf.parse(now);
		
		
			PO_SigningProcessBean selectorder = pO_SigningProcessService.select(bean.getPo_sta(), bean.getPo_id());

			
				selectorder.setSig_sug(SignSug);
				selectorder.setSig_date(datas);

			model.addAttribute("selectorder", selectorder);
		
		
		
		return "signOrderDetail.show";
	}
	
	@RequestMapping("/Po/signOrderDetail.show")
	public String signorderdetail() {
		
		
		
		return "signOrderDetail.show";
	}
	
	
	
	
	
	
}
