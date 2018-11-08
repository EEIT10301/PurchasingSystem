package Apply.controller;

import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Apply.model.App_SigningProcessBean;
import Apply.model.ProductListBean;
import Apply.service.AppDetailService;
import Apply.service.App_MainService;
import Apply.service.App_SigningProcessService;
import Apply.service.ProductListService;

@Controller
public class ApplySearchEndListController {
	@Autowired
	App_SigningProcessService app_SigningProcessService;
	@Autowired
	App_MainService app_MainService;
	@Autowired
	ProductListService productListService;
	@Autowired
	AppDetailService appDetailService;
	@RequestMapping(path="/Apply/SelectAllEndList.do")
	@ResponseBody
	public JSONArray SelectAllEndList() {
		 List<App_SigningProcessBean>  list = null;
		list = app_SigningProcessService.selectApp_staandSig_sta("請購核准","請購單完成");
        if(list!=null) {
        	
        	Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
        	String json = gson.toJson(list) ;
        	return new JSONArray(json);
        }
        return null;
	}	
	@RequestMapping(path="/Apply/SelectAllEndListdetail.do")
	@ResponseBody
	public JSONArray SelectAllEndListdetail(String appid,String appsta) {
		 List<App_SigningProcessBean>  list = null;
		list = app_SigningProcessService.selectallappid(appid);
        if(list!=null) {
        	Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
        	String json = gson.toJson(list) ;
        	return new JSONArray(json);
        }
        return null;
	}	
	
}
