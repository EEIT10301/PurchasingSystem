package Po.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Account.service.PO_Vendor_InfoService;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Apply.service.App_MainService;
import Apply.service.EmployeeService;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_DetailService;
import Po.service.PO_InvoiceService;
import Po.service.PO_MainService;
import Po.service.PO_QueryService;
import Po.service.PO_SigningProcessService;

@Controller
public class POUpdateToDoNo {
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
	@Autowired
	PO_InvoiceService pO_InvoiceService;

	@RequestMapping(path = "/Po/LoginSucessSelectPoSignList.do")
	@ResponseBody
	public JSONArray LoginSucessSelectPoSignList(HttpSession session) {
		EmployeeBean bean = (EmployeeBean) session.getAttribute("user");
		String empid = bean.getEmp_id();
		List<PO_SigningProcessBean> queryUndoneList = null;
		queryUndoneList = pO_SigningProcessService.selectempidsend(empid, "詢價中");
		if (queryUndoneList != null) {
			Integer queryUndoneNo = queryUndoneList.size();
			session.setAttribute("queryUndoneNo", queryUndoneNo);
		} else {
			session.removeAttribute("queryUndoneNo");
		} // 待詢價採購單數量

		List<PO_SigningProcessBean> pOUndoListsx1 = pO_SigningProcessService.selectempidsend(empid, "簽核中");
		List<PO_SigningProcessBean> pOUndoListsx2 = pO_SigningProcessService.selectempidsend(empid, "退回中");
		Integer pOUndoListsNo = 0;
		if (pOUndoListsx1 != null) {
			pOUndoListsNo += pOUndoListsx1.size();
		}
		if (pOUndoListsx2 != null) {
			pOUndoListsNo += pOUndoListsx2.size();
		}
		if (pOUndoListsNo != 0) {
			session.setAttribute("pOUndoListsNo", pOUndoListsNo);
		} else {
			session.removeAttribute("pOUndoListsNo");
		} // 待處理採購單數量
		
		List<PO_SigningProcessBean> unPlacedOrderList = null;
		unPlacedOrderList = pO_SigningProcessService.selectmangers(empid, "下單中");
		if (unPlacedOrderList != null) {
			Integer unPlacedOrderNo = unPlacedOrderList.size();
			session.setAttribute("unPlacedOrderNo", unPlacedOrderNo);
		} else {
			session.removeAttribute("unPlacedOrderNo");
		} // 待下單採購單數量
		
		List<PO_SigningProcessBean> unReceivedGoodsList = null;
		unReceivedGoodsList = pO_SigningProcessService.selectmangers(empid, "出貨中");
		if (unReceivedGoodsList != null) {
			Integer unReceivedGoodsNo = unReceivedGoodsList.size();
			session.setAttribute("unReceivedGoodsNo", unReceivedGoodsNo);
		} else {
			session.removeAttribute("unReceivedGoodsNo");
		} // 待收貨採購單數量
		
		
		List<PO_SigningProcessBean> unAssignedEmpList = null;
		unAssignedEmpList = pO_SigningProcessService.selectempidsend(empid, "分派中");
		if (unAssignedEmpList != null) {
			Integer unAssignedEmpNo = unAssignedEmpList.size();
			session.setAttribute("unAssignedEmpNo", unAssignedEmpNo);
		} else {
			session.removeAttribute("unAssignedEmpNo");
		} // 待收貨採購單數量
		
//	List<PO_SigningProcessBean> PO_SignSend=pO_SigningProcessService.selectempidsend(empid, "簽核中");
//	List<PO_SigningProcessBean> PO_SignBack=pO_SigningProcessService.selectempidsend(empid, "退回中");
//	Integer SignPoList=0;
//	if(PO_SignSend!=null) {
//		SignPoList+=PO_SignSend.size();
//	}
//	if(PO_SignBack!=null) {
//		SignPoList+=PO_SignBack.size();
//	}
//	if(SignPoList !=0) {		
//		session.setAttribute("SignPoList",SignPoList);
//	}else {
//		session.removeAttribute("SignPoList");
//	}//待簽核請購單數量

		return null;
	}

}