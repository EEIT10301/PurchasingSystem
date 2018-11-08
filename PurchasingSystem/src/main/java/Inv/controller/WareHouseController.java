package Inv.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.xml.soap.Detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.dao.impl.Inv_ProductListDao;
import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Account.service.Inv_ProductListService;
import Account.service.Inv＿ProductCheckService;
import Apply.model.ProductListBean;
import Apply.service.ProductListService;
import Inv.model.Inv_DetailBean;
import Inv.model.Inv_MainBean;
import Inv.service.AdditemServie;
import Inv.service.Inv_DetailService;
import Inv.service.Inv_MainSerivce;

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

	@RequestMapping("/Inv/item")
	public String Allitem(Model model , Integer pageSize, Integer pageNo) {
		HashMap<String, String> err = new HashMap<String, String>();
		System.out.println("這是庫存顯示controller");
		pageSize=20; //一頁顯示10筆資料
		List<Inv_MainBean> Mainbean = inv_MainSerivce.selectPage(pageSize, pageNo);
		if(Mainbean!=null&&Mainbean.size()>0) {
		model.addAttribute("Mainbean", Mainbean);
		}else {
			err.put("noFile", "未找到相應資料");
		}
		
		return "invend.item";
	}
	
	@RequestMapping("/Inv/CheckBean")
	private String meth(Model model) {
	List<Inv＿ProductCheckBean> checkAll = additemServie.select();
	model.addAttribute("check", checkAll);
		
	
	return "invend.itemin";

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
		List<Inv_ProductListBean> Count =null ;
		// 加入倒清單內部
		Inv_MainBean bean = null;
		Inv_DetailBean Detailbean = null;
		Count = additemServie.selectCount(CheckPK);
		// 加入倒清單內部
		if (CheckPK != null && Check.getChk_Comment().equals("驗收狀況良好")) {
			if (Count!=null&&Count.size() > 0) {
				for (Inv_ProductListBean getones : Count) {
					if (getones.getChk_status().equals("驗收完畢")) {
						// 新增至庫存MAIN
						bean =new Inv_MainBean();
						bean = inv_MainSerivce.select(getones.getPart_No());
					// 取得驗收單數量+取得目前庫存總數量=>存入庫存MainBean內
					bean.setInv_Amount(
							getones.getChk_Count() + inv_MainSerivce.select(getones.getPart_No()).getInv_Amount());
					// 新增至細項含數量以及時間
					Detailbean = new Inv_DetailBean();
					ProductListBean productlist = productListService.select(getones.getPart_No());
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
					getones.setChk_status("驗收完畢產品已入庫");
//					additemServie.update(getones);
					}else {
						
						i++;
					}
				}
				System.out.println("這是測試看數字的"+i);
				Check.setChk_Comment("已新增至庫存");
//				inv＿ProductCheckService.update(Check);
			}else {
				error.put("notFind", "無法入庫，請重新確認產品內容");
			}
		}
		List<Inv＿ProductCheckBean> checkAll = additemServie.select();
		System.out.println(CheckPK);
		Count =null ;
		Count = additemServie.ViewAddCheckDetail(CheckPK);
		model.addAttribute("check", checkAll);
		model.addAttribute("Detail", Count);
		model.addAttribute("error",error);
		return "invend.itemin";

	}

}
