package Inv.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Account.service.Inv＿ProductCheckService;
import Apply.model.ProductListBean;
import Apply.service.ProductListService;
import Inv.model.Inv_DetailBean;
import Inv.model.Inv_MainBean;
import Inv.model.Inv_SigningProcessBean;
import Inv.service.AdditemServie;
import Inv.service.Inv_DetailService;
import Inv.service.Inv_MainSerivce;
import Inv.service.Inv_SigningProcessService;

@Controller
public class WareHouseController {
	@Autowired
	AdditemServie additemServie;
	@Autowired
	Inv_DetailService inv_Detailservice;
	@Autowired
	Inv_MainSerivce inv_MainSerivce;
	@Autowired
	ProductListService productListService;
	@Autowired
	Inv＿ProductCheckService inv＿ProductCheckService;
	@Autowired
	Inv_SigningProcessService inv_SigningProcessService;

	@RequestMapping("/Inv/item")
	public String Allitem(Model model , Integer pageSize, Integer pageNo) {
		HashMap<String, String> err = new HashMap<String, String>();
		System.out.println("這是庫存顯示controller");
		pageSize=15; //一頁顯示15筆資料
		List<ProductListBean> Mainbean = productListService.selectPage( pageSize, pageNo);
//		List<Inv_MainBean> Mainbean = inv_MainSerivce.selectPage(pageSize, pageNo);
		if(Mainbean!=null&&Mainbean.size()>0) {
		model.addAttribute("Mainbean", Mainbean);
		}else {
			err.put("noFile", "未找到相應資料");
		}
		return "invend.item";
	}
	
	//驗收單查詢細項
	@RequestMapping("/Inv/CheckDetail")
	private String CheckDetail(String CHPK ,Model model) {	
		System.out.println(CHPK);
	 List<Inv_ProductListBean> Count = additemServie.selectCount(CHPK);
	 model.addAttribute("CheckDetail", Count);
	return "InvCheckDeatil.show";
	}	
	
	@RequestMapping("/Inv/CheckBean")
	private String meth(Model model , String flag) {	
//		System.out.println("這是controller"+flag);
//		System.out.println((""+flag).equals("in"));
		HashMap<String, String> error = new HashMap<String, String>();
		List<Inv＿ProductCheckBean> ShowCount = additemServie.selectSize();
		if(ShowCount==null) {
			error.put("NoData", "目前無待入庫驗收單");
		}else {
		Integer Count =ShowCount.size();
		model.addAttribute("Count", Count);	
		}
		if((""+flag).equals("in")) {
			ShowCount=null;
			 ShowCount = additemServie.select();
//			List<Inv＿ProductCheckBean> checkAll = additemServie.select();
			model.addAttribute("check", ShowCount);	
			flag=null;
			return "InvInProduct.show";
		}
//		System.out.println(flag.toString().equals("true"));
	List<Inv＿ProductCheckBean> checkAll = additemServie.select();
	model.addAttribute("DisItem", error);	
	model.addAttribute("check", checkAll);	
	return "invend.itemins";
	}
	
	@RequestMapping("/Inv/DetailView")
	private String DetailView(Model model , String MainbeanPK) {
		System.out.println("這是顯示產品細項的controller");
		List<Inv_DetailBean> bean = inv_Detailservice.select(MainbeanPK);
		System.out.println(bean);
		model.addAttribute("detailbean", bean);
		return "DetailView.Show";
	}

	@RequestMapping("/Inv/itemin")
	private String Itemin(Model model, String CheckPK) {
		int i = 0;
		System.out.println("這是庫存增加controller");
		HashMap<String, String> error = new HashMap<String, String>();
		Inv＿ProductCheckBean Check = additemServie.selectCheck(CheckPK);
		Inv_SigningProcessBean signing = inv_SigningProcessService.select("驗收", CheckPK);//.getSig_sta取得流程"驗收成功"
		List<Inv_ProductListBean> Count =null ;
		// 加入倒清單內部
//		Inv_MainBean bean = null;
		Inv_DetailBean Detailbean = null;
		Count = additemServie.selectCount(CheckPK);
		// 加入倒清單內部
		if(signing!=null && signing.getSig_Sta().equals("驗收成功")) {
//		if (CheckPK != null && Check.getChk_Comment().equals("驗收狀況良好")) {
			if (Count!=null&&Count.size() > 0) {
				for (Inv_ProductListBean getones : Count) {
//					if (getones.getChk_status().equals("驗收完畢")) {
						// 新增至庫存MAIN
//						bean =new Inv_MainBean();
						ProductListBean productlist = productListService.select(getones.getPart_No());
//						bean = inv_MainSerivce.select(getones.getPart_No());
					// 取得驗收單數量+取得目前庫存總數量=>存入庫存MainBean內
						productlist.setPro_amount(
//					bean.setInv_Amount(
								getones.getChk_Count() + productListService.select(getones.getPart_No()).getPro_amount());
//							getones.getChk_Count() + inv_MainSerivce.select(getones.getPart_No()).getInv_Amount());
					// 新增至細項含數量以及時間
					Detailbean = new Inv_DetailBean();
					Detailbean.setInv_Part_no(getones.getPart_No());
					Detailbean.setInv_Part(getones.getPart_No());
					Detailbean.setInv_Amount(getones.getChk_Count());
					Detailbean.setInv__Date(getones.getChk_Date());
					Detailbean.setInv_Intr(productlist.getPro_intro());
					Detailbean.setInv_Spe(productlist.getPro_spe());
					Detailbean.setInv_Name(productlist.getPro_name());
					Detailbean.setInv_Amounts(null);
					inv_Detailservice.insert(Detailbean);
//					inv_MainSerivce.update(bean);	
				//	getones.setChk_status("驗收完畢產品已入庫");
//					additemServie.update(getones);
					}
//				}
				Check.setChk_Comment("已加入庫存");
//				inv＿ProductCheckService.update(Check);			
			}
		}else {
			error.put("notFind", "無法入庫，請重新確認產品內容");	
		}
		if(signing!=null && signing.getSig_Sta().equals("驗收成功")){
			Count =null ;
			Count = additemServie.ViewAddCheckDetail(CheckPK);
		}else {
			Count =null ;
		}
		List<Inv＿ProductCheckBean> checkAll = additemServie.select();
		model.addAttribute("Detail", Count);		
		model.addAttribute("check", checkAll);
		model.addAttribute("error",error);
		return "invend.itemins";
	}
}

