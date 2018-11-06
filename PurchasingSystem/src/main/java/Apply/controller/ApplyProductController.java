package Apply.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Apply.model.ProductListBean;
import Apply.service.ProductListService;
@Controller
public class ApplyProductController {
	@Autowired
	ProductListService productListService;
	@RequestMapping(path="/SearchCusmvc.do")
	@ResponseBody
	public JSONArray SelectAll() {
		 List<ProductListBean>  list = null;
		list = productListService.selectAll();
		List<ProductListBean>  lists = new LinkedList<ProductListBean>();
		lists=list;
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
		String json = gson.toJson(lists) ;
		return new JSONArray(json);
	}
	@RequestMapping(value="/SearchCus.do", produces ="text/html; charset=utf-8" )
	public 	@ResponseBody String SelectAllAJAX() throws IOException, ParseException {
		//response.setContentType("text/html;charset=UTF-8");
		 List<ProductListBean>  list = null;
		list = productListService.selectAll();
		List<ProductListBean>  lists = new LinkedList<ProductListBean>();
//		for(int i=0;i<list.size();i++) {
//			ProductListBean xs= list.get(i);
//			DateFormat dateFormate =new SimpleDateFormat("yyyy/MM/dd");
//			String now= dateFormate.format(xs.getPro_date());
//			SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd");
//			Date datas=sdf.parse(now);
//			xs.setPro_date(datas);
//			lists.add(xs);
//		}	
		lists=list;
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create() ; 
		String json = gson.toJson(lists) ;
	    return json;
	}
	@RequestMapping(value="/RemoveCus.do", produces ="text/html; charset=utf-8" )
	public 	@ResponseBody String UpdateAJAX(HttpServletRequest request) throws IOException, ParseException {
		String jsonStr = readJSON(request);
		JSONObject jsonObj = new JSONObject(jsonStr);
		 ProductListBean em = null;
		String partno = jsonObj.getString("id");
//		String pro_cate = jsonObj.getString("name");
//		String pro_name = jsonObj.getString("email");
//		String pro_spe = jsonObj.getString("pwd");
		Integer pro_price = Integer.valueOf(jsonObj.getString("tel"));
		Integer pro_amount = Integer.valueOf(jsonObj.getString("adr"));
		em=productListService.select(partno);
		java.util.Date date = new java.util.Date();
		java.sql.Date data1 = new java.sql.Date(date.getTime());
		DateFormat dateFormate =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now= dateFormate.format(data1);
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date datas=sdf.parse(now);
//		em.setPro_cate(pro_cate);
//		em.setPro_name(pro_name);
//		em.setPro_spe(pro_spe);
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
}
