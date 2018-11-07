package Apply.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Apply.model.AppDetailBean;
import Apply.model.ProductListBean;
import Apply.service.AppDetailService;
import Apply.service.ProductListService;
@Controller
public class ApplyProductController {
	@Autowired
	ProductListService productListService;
	@Autowired
	AppDetailService appDetailService;
	@RequestMapping(path="/SearchCusmvc.do")
	@ResponseBody
	public JSONArray SelectAll() {
		 List<ProductListBean>  list = null;
		list = productListService.selectAll();
//		List<ProductListBean>  lists = new LinkedList<ProductListBean>();
//		lists=list;
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
		String json = gson.toJson(list) ;
		return new JSONArray(json);
	}
	@RequestMapping(value="/SearchCus.do", produces ="text/html; charset=utf-8" )
	public 	@ResponseBody String SelectAllAJAX() throws IOException, ParseException {
		 List<ProductListBean>  list = null;
		list = productListService.selectAll();
//		ProductListBean xz=productListService.select("part001");
//		Set<AppDetailBean>  AppDetail =xz.getAppDetailBean();
//		List<ProductListBean>  lists = new LinkedList<ProductListBean>();
//		lists=list;
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
		String json = gson.toJson(list) ;
	    return json;
	}
	@RequestMapping(value="/RemoveCus.do", produces ="text/html; charset=utf-8" )
	public 	@ResponseBody String UpdateAJAX(HttpServletRequest request) throws IOException, ParseException {
		String jsonStr = readJSON(request);
		JSONObject jsonObj = new JSONObject(jsonStr);
		 ProductListBean em = null;
 
		String partno = jsonObj.getString("id");
		String pro_spe = jsonObj.getString("spe");
		String pro_intro = jsonObj.getString("intro");
		Integer pro_price = Integer.valueOf(jsonObj.getString("price"));
		Integer pro_amount = Integer.valueOf(jsonObj.getString("amount"));
		em=productListService.select(partno);
		java.util.Date date = new java.util.Date();
		java.sql.Date data1 = new java.sql.Date(date.getTime());
		DateFormat dateFormate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now= dateFormate.format(data1);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date datas=sdf.parse(now);
		em.setPro_spe(pro_spe);
		em.setPro_intro(pro_intro);
		em.setPro_price(pro_price);
		em.setPro_amount(pro_amount);
		em.setPro_date(datas);
		return "1";
	}

	private String readJSON(HttpServletRequest request)throws IOException{
		StringBuilder json = new StringBuilder();
		String line = null;
		BufferedReader reader = request.getReader();
		while ((line = reader.readLine())!= null) {json.append(line);}
		return json.toString();
	};
	@RequestMapping(value="/insertproduct.do", produces ="text/html; charset=utf-8" )
	public 	@ResponseBody String InsertAJAX(HttpServletRequest request) throws IOException, ParseException {
		String jsonStr = readJSON(request);
		JSONObject jsonObj = new JSONObject(jsonStr);
		String partno = jsonObj.getString("id");
		String pro_cate = jsonObj.getString("cate");
		String pro_name = jsonObj.getString("name");
		String pro_spe = jsonObj.getString("spe");
		String pro_intro = jsonObj.getString("intro");
		Integer pro_price = Integer.valueOf(jsonObj.getString("price"));
		Integer pro_amount = Integer.valueOf(jsonObj.getString("amount"));
		java.util.Date date = new java.util.Date();
		java.sql.Date data1 = new java.sql.Date(date.getTime());
		DateFormat dateFormate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now= dateFormate.format(data1);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date datas=sdf.parse(now);
		ProductListBean em = new ProductListBean(partno,pro_cate,pro_name,pro_spe,pro_intro,pro_price,pro_amount,null,datas);
		productListService.insert(em);
		
		return "1";
	}
	@RequestMapping(value="/searchproduct.do", produces ="text/html; charset=utf-8" )
	public @ResponseBody String SearchAJAX(HttpServletRequest request) throws IOException, ParseException {
//		String jsonStr = readJSON(request);
//		JSONObject jsonObj = new JSONObject(jsonStr);
//		String partno = jsonObj.getString("id");
//		String pro_cate = jsonObj.getString("cate");
//		String pro_name = jsonObj.getString("name");
//		String pro_spe = jsonObj.getString("spe");
//		String pro_intro = jsonObj.getString("intro");
//		Integer pro_price = Integer.valueOf(jsonObj.getString("price"));
//		Integer pro_amount = Integer.valueOf(jsonObj.getString("amount"));
//		java.util.Date date = new java.util.Date();
//		java.sql.Date data1 = new java.sql.Date(date.getTime());
//		DateFormat dateFormate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		String now= dateFormate.format(data1);
//		SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		Date datas=sdf.parse(now);
//		ProductListBean em = new ProductListBean(partno,pro_cate,pro_name,pro_spe,pro_intro,pro_price,pro_amount,null,datas);
//		productListService.insert(em);
		
		return "indexlogin.return";
	}	
@RequestMapping(path="/UpdateOrDeleteproduct.do")
@ResponseBody
public JSONArray SearchJquery(HttpServletRequest request,String id,String Account
		,String Password,String Button) throws IOException, ParseException {
	List<AppDetailBean>  list = null;
	list = appDetailService.selectpart_no(id);
	Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
	String json = gson.toJson(list) ; 
	JSONArray x =new JSONArray(json);
	return x;	     
	}
	
}
