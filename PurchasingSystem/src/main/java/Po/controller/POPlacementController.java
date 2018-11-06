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

 @RequestMapping("/Po/signedorder.controller")
 public String signedOrder(PO_SigningProcessBean bean, BindingResult bindingResult, Model model,
   HttpSession session) {
  EmployeeBean bean1 = (EmployeeBean) session.getAttribute("user");
  String empid = bean1.getEmp_id();
  String managerId = bean1.getEmp_managerid();
  EmployeeBean mId = employeeService.select(managerId);

  List<PO_SigningProcessBean> signedOrderList1 = new LinkedList<PO_SigningProcessBean>();
  List<PO_SigningProcessBean> signedOrderList2 = new LinkedList<PO_SigningProcessBean>();
  List<PO_SigningProcessBean> signedOrderList3 = new LinkedList<PO_SigningProcessBean>();

  signedOrderList1 = pO_SigningProcessService.selectmangers(empid, "下單中");
  signedOrderList2 = pO_SigningProcessService.selectmangers(empid, "退回中");
  Integer orderListsRanks = 0;
  Integer noSendRanks = 0;
  if (signedOrderList1 != null && signedOrderList1.size() > 0) {
   for (int i = 0; i < signedOrderList1.size(); i++) {
    PO_SigningProcessBean xsz = new PO_SigningProcessBean();
    xsz = signedOrderList1.get(i);
    orderListsRanks = xsz.getSig_rank();
    String poid = xsz.getPo_id();
    PO_SigningProcessBean xsz1 = pO_SigningProcessService.selectrank(poid, orderListsRanks - 1);
    if (xsz1 != null) {
     signedOrderList3.add(xsz1);
    }
   }
  }

  if (signedOrderList1 != null || signedOrderList2 != null) {
   model.addAttribute("Applylistsranks", orderListsRanks);
   model.addAttribute("nosendranks", noSendRanks);
   model.addAttribute("signedOrderList", signedOrderList1);
   model.addAttribute("nosend", signedOrderList2);
   model.addAttribute("signedOrderListM_Info", signedOrderList3);
   model.addAttribute("managerID", mId);

   return "SignedOrder.show";
  } else {
   model.addAttribute("noSignedOrderList", "無待簽核表單");
   return "SignedOrder.show";
  }
 }


	@RequestMapping("/Po/signedOrderDetail.controller")
	public String signedOrderDetail(PO_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session) {
		String poid = bean.getPo_id();

		PO_MainBean pm = pO_MainService.select(poid);
//		Set<PO_SigningProcessBean> po_Sign = pm.getpO_SigningProcessBean();
		PO_SigningProcessBean po_Sign = pO_SigningProcessService.select("下單中", poid);
		Set<PO_DetailBean> poDetail = pm.getpO_DetailBean();
		model.addAttribute("pm", pm);
		model.addAttribute("po_Sign", po_Sign);
		model.addAttribute("poDetail", poDetail);
		return "SignedOrderDetail.show";

 }


	@RequestMapping("/Po/signedOrderSubmit.controller")
	public String signedOrderSubmit(PO_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session, String send, String signSug, java.util.Date shippingDate) throws ParseException {
		EmployeeBean bean1 = (EmployeeBean) session.getAttribute("user");
		String empid = bean1.getEmp_id();
		java.util.Date date = new java.util.Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String currentDate = dateFormat.format(date1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date dateTime = sdf.parse(currentDate);
		if (send.equals("送出")) {
			PO_SigningProcessBean placeOrder = pO_SigningProcessService.select(bean.getPo_sta(), bean.getPo_id());
			placeOrder.setSig_date(dateTime);
			placeOrder.setSig_sta("已下單");
			placeOrder.setSig_sug(signSug);
			PO_SigningProcessBean placeOrder1 = pO_SigningProcessService.select("待收貨", bean.getPo_id());
			placeOrder1.setSig_sta("出貨中");
			PO_MainBean shippingUpdate = pO_MainService.select(bean.getPo_id());
			shippingUpdate.setShipping_Date(shippingDate);
		}
		return "POlogin.success";
	}
}

