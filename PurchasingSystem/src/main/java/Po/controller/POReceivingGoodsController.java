package Po.controller;

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
public class POReceivingGoodsController {
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

	@RequestMapping("/Po/placedOrder.controller")
	public String placedOrder(PO_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session) {
		EmployeeBean bean1 = (EmployeeBean) session.getAttribute("user");
		String empid = bean1.getEmp_id();

		List<PO_SigningProcessBean> placedOrderList1 = new LinkedList<PO_SigningProcessBean>();
		List<PO_SigningProcessBean> placedOrderList2 = new LinkedList<PO_SigningProcessBean>();
		List<PO_SigningProcessBean> placedOrderList3 = new LinkedList<PO_SigningProcessBean>();

		placedOrderList1 = pO_SigningProcessService.selectmangers(empid, "出貨中");
		placedOrderList2 = pO_SigningProcessService.selectmangers(empid, "退回中");

		Integer orderListsRanks = 0;
		Integer noSendRanks = 0;

		if (placedOrderList1 != null && placedOrderList1.size() > 0) {
			for (int i = 0; i < placedOrderList1.size(); i++) {
				PO_SigningProcessBean pspb = new PO_SigningProcessBean();
				pspb = placedOrderList1.get(i);
				orderListsRanks = pspb.getSig_rank();
				String poid = pspb.getPo_id();
				PO_SigningProcessBean pspb1 = pO_SigningProcessService.selectrank(poid, orderListsRanks - 1);
				if (pspb1 != null) {
					placedOrderList3.add(pspb1);
				}

			}
		}
		if (placedOrderList1 != null || placedOrderList2 != null) {
			model.addAttribute("placedOrderList", placedOrderList1);
			model.addAttribute("nosend", placedOrderList2);
			model.addAttribute("placedOrderListInfo", placedOrderList3);
			return "PlacedOrder.show";
		} else {
			model.addAttribute("noPlacedOrderList", "無待收貨表單");
			return "PlacedOrder.show";
		}
	}

	@RequestMapping("/Po/placedOrderDetail.controller")
	public String placedOrderDetail(PO_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session) {
		String poid = bean.getPo_id();
		PO_MainBean pm = pO_MainService.select(poid);
		PO_SigningProcessBean po_Sign = pO_SigningProcessService.select("出貨中", poid);
		Set<PO_DetailBean> poDetail = pm.getpO_DetailBean();
		model.addAttribute("pm", pm);
		model.addAttribute("po_Sign", po_Sign);
		model.addAttribute("poDetail", poDetail);

		return "PlacedOrderDetail.show";

	}

}
