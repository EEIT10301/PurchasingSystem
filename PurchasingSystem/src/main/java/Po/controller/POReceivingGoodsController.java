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

import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Account.service.Inv_ProductListService;
import Account.service.Inv＿ProductCheckService;
import Account.service.PO_Vendor_InfoService;
import Apply.model.EmployeeBean;
import Apply.service.App_MainService;
import Apply.service.EmployeeService;
import Inv.model.Inv_SigningProcessBean;
import Inv.service.Inv_SigningProcessService;
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
	@Autowired
	Inv＿ProductCheckService inv＿ProductCheckService;
	@Autowired
	Inv_ProductListService inv_ProductListService;
	@Autowired
	Inv_SigningProcessService inv_SigningProcessService;

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
		PO_SigningProcessBean po_Sign = pO_SigningProcessService.select("待收貨", poid);
		Set<PO_DetailBean> poDetail = pm.getpO_DetailBean();
		model.addAttribute("pm", pm);
		model.addAttribute("po_Sign", po_Sign);
		model.addAttribute("poDetail", poDetail);

		return "PlacedOrderDetail.show";

	}

	@RequestMapping("/Po/receivedGoods.controller")
	public String receivedGoods(PO_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session, String send, String signSug, java.util.Date shippingDate) throws ParseException {
		EmployeeBean bean1 = (EmployeeBean) session.getAttribute("user");
		String empid = bean1.getEmp_id();
		java.util.Date date = new java.util.Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String currentDate = dateFormat.format(date1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date dateTime = sdf.parse(currentDate);
		if (send.equals("確認收貨")) {
			PO_SigningProcessBean receivedGoods = pO_SigningProcessService.select(bean.getPo_sta(), bean.getPo_id());
			receivedGoods.setSig_date(shippingDate);
			receivedGoods.setSig_sta("已收貨");
			receivedGoods.setSig_sug(signSug);

			PO_SigningProcessBean insert1 = new PO_SigningProcessBean(empid, "驗收作業", bean.getPo_id(), null, "驗收中", null,
					bean.getSig_rank() + 1);
			PO_SigningProcessBean insert2 = new PO_SigningProcessBean(empid, "請款作業", bean.getPo_id(), null, "未請款", null,
					bean.getSig_rank() + 2);
			pO_SigningProcessService.insert(insert1);
			pO_SigningProcessService.insert(insert2);

			PO_MainBean pO_MainBean = receivedGoods.getpO_MainBean();

			Set<PO_DetailBean> pODetailBean = receivedGoods.getpO_MainBean().getpO_DetailBean();
			String ckid = "CK" + pO_MainBean.getPo_id().substring(2);

			Inv＿ProductCheckBean inv＿ProductCheckBean = new Inv＿ProductCheckBean(ckid, bean.getPo_id(), "emp000",
					pO_MainBean.getTotal_price(), "尚未入庫", null, pO_MainBean.getVendor_ID());
			inv＿ProductCheckService.insert(inv＿ProductCheckBean);
			for (PO_DetailBean pd : pODetailBean) {
				Inv_ProductListBean ip = new Inv_ProductListBean(ckid, pd.getPart_No(), null, null, null,
						null);
				inv_ProductListService.insert(ip);
			}

			Inv_SigningProcessBean inv_SigningProcessBean = new Inv_SigningProcessBean(empid, "貨物狀態", ckid, dateTime,
					"產生驗收單", signSug, 1);
			Inv_SigningProcessBean inv_SigningProcessBean1 = new Inv_SigningProcessBean("emp007", "驗收分派", ckid, null,
					"待分派", null, 2);
			inv_SigningProcessService.insert(inv_SigningProcessBean);
			inv_SigningProcessService.insert(inv_SigningProcessBean1);
		}
		return "POlogin.success";
	}

}
