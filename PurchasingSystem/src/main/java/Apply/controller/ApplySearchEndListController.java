package Apply.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Account.model.Inv_ProductListBean;
import Account.service.Inv_ProductListService;
import Apply.model.AppDetailBean;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Apply.service.AppDetailService;
import Apply.service.App_MainService;
import Apply.service.App_SigningProcessService;
import Apply.service.ProductListService;
import Po.model.PO_DetailBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_DetailService;
import Po.service.PO_SigningProcessService;

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
	@Autowired
	PO_SigningProcessService pO_SigningProcessService;
	@Autowired
	PO_DetailService pO_DetailService;
	@Autowired
	Inv_ProductListService inv_ProductListService;
	@RequestMapping(path="/Apply/SelectAllEndList.do")
	@ResponseBody
	public JSONArray SelectAllEndList(HttpSession session) {
		//selectApp_staandSig_staemp
		EmployeeBean user= (EmployeeBean) session.getAttribute("user"); 
		List<App_SigningProcessBean>  list = null;
		if(user.getEmp_level()==1) {
			list = app_SigningProcessService.selectApp_staandSig_staemp("申請中","已結案",user.getEmp_id());
		}else {
			list = app_SigningProcessService.selectApp_staandSig_sta("申請中","已結案");
		}
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
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
		String json =null;
        if(list!=null) {
        	 json = gson.toJson(list) ;
        }
 
        if(json!=null) {
        	return new JSONArray(json);
        }
        return null;
	}
	@RequestMapping(path="/Apply/SelectAllPOEndListdetail.do")
	@ResponseBody
	public JSONArray SelectAllPOEndListdetail(String appid,String appsta) {
		List<PO_SigningProcessBean>  prolist = null;
		String poid="Po"+appid.substring(2);
		prolist =pO_SigningProcessService.selectpoid(poid);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
		String json =null;

         if(prolist!=null){
        	 json = gson.toJson(prolist) ;
        }

        if(json!=null) {
        	return new JSONArray(json);
        }
        return null;
	}
	@RequestMapping(path="/Apply/SelectAppdetail.do")
	@ResponseBody
	public JSONArray SelectAppdetail(String appid,String appsta) {
		List<AppDetailBean>  list = null;
		list = appDetailService.selectapp_id(appid);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
		String json =null;

         if(list!=null){
        	 json = gson.toJson(list) ;
        }

        if(json!=null) {
        	return new JSONArray(json);
        }
        return null;
	}
	@RequestMapping(path="/Apply/SelectPodetail.do")
	@ResponseBody
	public JSONArray Selectpodetail(String appid,String appsta) {
		List<PO_DetailBean>  prolist = null;
		String poid="Po"+appid.substring(2);
		prolist =pO_DetailService.selectpo_id(poid);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
		String json =null;

         if(prolist!=null){
        	 json = gson.toJson(prolist) ;
        }

        if(json!=null) {
        	return new JSONArray(json);
        }
        return null;
	}
	@RequestMapping(path="/Apply/Inv＿ProductCheckdetail.do")
	@ResponseBody
	public JSONArray Inv＿ProductCheckdetail(String appid,String appsta) {
		List<Inv_ProductListBean>  ckidlist = null;
		String ckid="CK"+appid.substring(2);
		ckidlist =inv_ProductListService.ViewAddCheckDetail(ckid);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
		String json =null;
         if(ckidlist!=null){
        	 json = gson.toJson(ckidlist) ;
        }

        if(json!=null) {
        	return new JSONArray(json);
        }
        return null;
	}
	@RequestMapping(path="/Apply/SelectWaitEndAppList.do")
	@ResponseBody
	public JSONArray SelectWaitEndAppList() {
		
		List<App_SigningProcessBean>  prolist = null;
		prolist =app_SigningProcessService.selectApp_staandSig_sta("申請中","待結案");
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
		String json =null;

         if(prolist!=null){
        	 json = gson.toJson(prolist) ;
        }

        if(json!=null) {
        	return new JSONArray(json);
        }
        return null;
	}
	@RequestMapping(value="/Apply/EndAppThisList.do", produces ="text/html; charset=utf-8" )
	public @ResponseBody String EndAppThisList(String appid,String appsta,String end,String signsug) throws ParseException {
		java.util.Date date = new java.util.Date();
		java.sql.Date data1 = new java.sql.Date(date.getTime());
		DateFormat dateFormate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now= dateFormate.format(data1);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date datas=sdf.parse(now);
		App_SigningProcessBean  prolist = null;
		prolist =app_SigningProcessService.select("申請中",appid);
		prolist.setSig_date(datas);
		prolist.setSig_sta(end);
		prolist.setSig_sug(signsug);
		Gson gson = new Gson(); 
		String json =null;
		Map<String, String> message = new HashMap<String, String>();
		
		message.put("endlist", "結案成功");
        	 json = gson.toJson(message) ;
        	 return  json;
	}
	@RequestMapping(path="/Apply/LoginSucessSelectAppSignList.do")
	@ResponseBody
	public JSONArray LoginSucessSelectAppSignList(HttpSession session) {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
		List<App_SigningProcessBean>  prolist = null;
		prolist =app_SigningProcessService.selectApp_staandSig_sta("申請中","待結案");
		if(prolist !=null) {		
			Integer x =prolist.size();
			session.setAttribute("waitendsign",x);
		}else {
			session.removeAttribute("waitendsign");
		}//驗收完成待結案請購單數量
		
	List<App_SigningProcessBean> Sproductlistsx1 =app_SigningProcessService.selectmangers(empid, "簽核中");
	List<App_SigningProcessBean> Sproductlistsx2 =app_SigningProcessService.selectmangers(empid, "退回中");
	Integer SignAppList=0;
	if(Sproductlistsx1!=null) {
		SignAppList+=Sproductlistsx1.size();
	}
	if(Sproductlistsx2!=null) {
		SignAppList+=Sproductlistsx2.size();
	}
	if(SignAppList !=0) {		
		session.setAttribute("SignAppList",SignAppList);
	}else {
		session.removeAttribute("SignAppList");
	}//待簽核請購單數量
		
	if(ben.getEmp_level()==1) {//如果是非主管的員工

		List<App_SigningProcessBean> Appnow =app_SigningProcessService.selectfromlastemp(empid);
		if(Appnow!=null) {
			Integer Appnows=Appnow.size();
			session.setAttribute("Appnow",Appnows);
		}else {
			session.removeAttribute("Appnow");
		}
		
	}else {
		List<App_SigningProcessBean> Appmangernow =app_SigningProcessService.selectfromlastemp1(1);
		if(Appmangernow!=null) {
			Integer Appnows=Appmangernow.size();
			session.setAttribute("Appnow",Appnows);
		}else {
			session.removeAttribute("Appnow");
		}
	}//請購中請購單數量
	List<PO_SigningProcessBean> PO_SignSend=pO_SigningProcessService.selectempidsend(empid, "簽核中");
	List<PO_SigningProcessBean> PO_SignBack=pO_SigningProcessService.selectempidsend(empid, "退回中");
	Integer SignPoList=0;
	if(PO_SignSend!=null) {
		SignPoList+=PO_SignSend.size();
	}
	if(PO_SignBack!=null) {
		SignPoList+=PO_SignBack.size();
	}
	if(SignPoList !=0) {		
		session.setAttribute("SignPoList",SignPoList);
	}else {
		session.removeAttribute("SignPoList");
	}//待簽核請購單數量
	
	return null;
	}
	@RequestMapping(path="/Apply/AppSignListInclude.do",produces ="text/html; charset=utf-8")
	@ResponseBody
	public String AppSignListInclude(HttpSession session) {
		EmployeeBean ben=(EmployeeBean) session.getAttribute("user");
		String empid=ben.getEmp_id();
		Integer waitendsign=0;
		Integer SignAppList=0;
		Integer Appnow=0;
		Map<String, String> Applist = new HashMap<String, String>();
		Applist.put("empid",empid);
		Applist.put("empname",ben.getEmp_name());
		Applist.put("empjob",ben.getEmp_job());
		Applist.put("empdep",ben.getEmp_dep());
		Applist.put("emplevel",""+ben.getEmp_level());
		if(session.getAttribute("waitendsign")!=null) {
			waitendsign=(Integer) session.getAttribute("waitendsign");
			//驗收完成待結案請購單數量
			Applist.put("waitendsign",""+waitendsign);
		}else {
			Applist.put("waitendsign","");
		}
		if(session.getAttribute("SignAppList")!=null) {
			SignAppList=(Integer) session.getAttribute("SignAppList");
			//待簽核請購單數量
			Applist.put("SignAppList",""+SignAppList);
		}else {
			Applist.put("SignAppList",""+"");
		}
		if(session.getAttribute("Appnow")!=null) {
			Appnow=(Integer) session.getAttribute("Appnow");
			Applist.put("Appnow",""+Appnow);
		}else {
			Applist.put("Appnow","");
		}
	
	Gson gson =new Gson();
		String json = gson.toJson(Applist) ;
		return json;
	}	
}
