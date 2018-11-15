package Po.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Account.model.PO_Vendor_InfoBean;
import Account.service.PO_Vendor_InfoService;
import Apply.model.ProductListBean;

@Controller
public class POAddVendorController {
	@Autowired
	PO_Vendor_InfoService pO_Vendor_InfoService;

	@RequestMapping(path="/Po/POAddVendorSelectAll.do")
	@ResponseBody
	public JSONArray SelectAllPoVendor() {
		List<PO_Vendor_InfoBean> list = null;
		list = pO_Vendor_InfoService.select();
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(list);
		return new JSONArray(json);
	}

	@RequestMapping(value = "/PO/POAddVendorinsertproduct.do", produces = "text/html; charset=utf-8")
	public @ResponseBody String InsertAJAX(HttpServletRequest request) throws IOException, ParseException {
		String jsonStr = readJSON(request);
		JSONObject jsonObj = new JSONObject(jsonStr);
		String id = jsonObj.getString("id");
		String name = jsonObj.getString("name");
		String person = jsonObj.getString("person");
		String acc = jsonObj.getString("acc");
		String term = jsonObj.getString("term");
		String method = jsonObj.getString("method");
		String email = jsonObj.getString("email");

		PO_Vendor_InfoBean em = new PO_Vendor_InfoBean(id, name, person, acc, term, method, email);
		pO_Vendor_InfoService.insert(em);

		return "1";
	}

	private String readJSON(HttpServletRequest request) throws IOException {
		StringBuilder json = new StringBuilder();
		String line = null;
		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) {
			json.append(line);
		}
		return json.toString();
	};

	@RequestMapping(value = "/PO/POAddVendorupdate.do", produces = "text/html; charset=utf-8")
	public @ResponseBody String UpdateAJAX(HttpServletRequest request) throws IOException, ParseException {
		String jsonStr = readJSON(request);
		JSONObject jsonObj = new JSONObject(jsonStr);
		String id = jsonObj.getString("id");
		String name = jsonObj.getString("name");
		String person = jsonObj.getString("person");
		String acc = jsonObj.getString("acc");
		String term = jsonObj.getString("term");
		String method = jsonObj.getString("method");
		String email = jsonObj.getString("email");
		PO_Vendor_InfoBean em = pO_Vendor_InfoService.select(id);
		// em.setVendor_name(name);
		em.setVendor_contact_person(person);
		em.setVendor_acc(acc);
		em.setPayment_term(term);
		em.setPayment_method(method);
		em.setVendor_email(email);
		return "1";
	}
}
