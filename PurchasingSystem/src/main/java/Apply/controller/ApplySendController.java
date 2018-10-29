package Apply.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import Apply.model.AppDetailBean;
import Apply.model.App_MainBean;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Apply.model.ProductListBean;
import Apply.service.AppDetailService;
import Apply.service.App_MainService;
import Apply.service.App_SigningProcessService;
import Apply.service.EmployeeService;
import Apply.service.ProductListService;


@Controller
public class ApplySendController {
	@Autowired
	private ProductListService productListService;
	@Autowired
	private App_MainService app_MainService;
	@Autowired
	private AppDetailService appDetailService;
	@Autowired
	private App_SigningProcessService app_SigningProcessService;
	@Autowired
	private EmployeeService employeeService;
	@RequestMapping("/Apply/ApplySend.controller")
	public String ChoiceCategorly(String Categorly, Model model ,HttpSession session) {//選擇大項
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		session.removeAttribute("product");
		if(Categorly==null || Categorly.length()==0) {
			
			errors.put("cate", "請選擇大項");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			
			return "app.product";
		}
		//呼叫model
		List<ProductListBean> bean = productListService.selectCate(Categorly);
				
		//根據model執行結果，導向view
				if(bean==null) {
					errors.put("password", "Login failed, please try again.");
					return "app.product";
					
				} else {
					session.setAttribute("Categlory", Categorly);
					session.setAttribute("product", bean);
					return "app.product";
					
				}		
	}
	//ProductListBean productListBean, BindingResult bindingResult,
	@SuppressWarnings("unchecked")
	@RequestMapping("/Apply/ApplyShopping.controller") 
	public String ShoppingCart(ProductListBean bean,BindingResult bindingResult,Model model 
			,HttpSession session,String part_no,String send,String productamount) {//購物車
		 EmployeeBean user =new EmployeeBean();
		 if(session.getAttribute("user")!=null) {
			 user= (EmployeeBean) session.getAttribute("user"); 
			 
		 }
		 EmployeeBean userManger =employeeService.select(user.getEmp_managerid());
		 EmployeeBean boss =employeeService.select(userManger.getEmp_managerid());
		Map<String, String> errors = new HashMap<String, String>();
		List<ProductListBean>  beans =new LinkedList<ProductListBean>();
		if (send.equals("查詢清單")) {
			beans=(List<ProductListBean>) session.getAttribute("cart");
			Integer xs=0;
			if(beans!=null) {
				for(int i=0;i<beans.size();i++) {
					ProductListBean x=beans.get(i);
					xs+=x.getPro_amount()*x.getPro_price();
					
				}
				if(xs>1000000) {
					session.setAttribute("sign2",userManger);
					session.setAttribute("sign3",boss);
				}else {
					 if(session.getAttribute("sign3")!=null) {
						 session.removeAttribute("sign3");
					 }
					session.setAttribute("sign2",userManger);
				}
				session.setAttribute("Listprice",xs);
				
			}
			
		    	return "Apply.List";
		    }
		model.addAttribute("errors", errors);
		//List<ProductListBean> beans=null;
		if(session.getAttribute("cart")==null) {
			session.setAttribute("cart",beans);
		}else {
			beans=(List<ProductListBean>) session.getAttribute("cart");
		}
		Integer proamt =0;
		try {
			 proamt=Integer.valueOf(productamount);
		}catch(NumberFormatException ex) {
			ex.getStackTrace();
			errors.put("cate", "請輸入整數");
			model.addAttribute("errors", errors);
			return "app.product";
		}
		bean.setPro_amount(proamt);
		Integer cartamount=0;
		String Part_no =bean.getPart_no();
		String Pro_cate =bean.getPro_cate();
		if (beans.size()>0) {
			int xz=0;
			for(int i=0;i<beans.size();i++) {
				ProductListBean x=beans.get(i);
				
				if(x.getPart_no().equals(Part_no)) {
					x.setPro_amount(proamt+x.getPro_amount());
					xz++;
				}else if(!(x.getPro_cate().equals(Pro_cate))){
					errors.put("cate", "請選擇相同大項");
					model.addAttribute("errors", errors);
					return "app.product";
				}
			}
			if(xz==0) {
				
				beans.add(bean);
			}
			
		}else {
			beans.add(bean);
			
		}
		cartamount=beans.size();
		session.setAttribute("cart",beans);
//		ProductListBean bean=new ProductListBean();
//		bean.setPart_no(part_no);
//		bean.setPro_cate(pro_cate);
//		bean.setPro_name(pro_name);
//		bean.setPro_spe(pro_spe);
//		bean.setPro_intro(pro_intro);
//		bean.setPro_price(pro_price);
//		bean.setPro_amount(pro_amount);
//		bean.setPro_date(pro_date);
//		beans.add(bean);
		
		
	    	session.setAttribute("cartnumber", cartamount);
	    	return "app.product";
	    
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/Apply/ApplyListsend.controller") 
	public String ApplyList(ProductListBean bean,BindingResult bindingResult,Model model 
		,HttpSession session,String part_no,String send,String productamount, String suggestion,String Sign2Employee) {//產生清單
		 EmployeeBean user =new EmployeeBean();
		 if(session.getAttribute("user")!=null) {
			 user= (EmployeeBean) session.getAttribute("user"); 
			 
		 }
		 EmployeeBean userManger =employeeService.select(user.getEmp_managerid());
		 EmployeeBean boss =employeeService.select(userManger.getEmp_managerid());
		
		Map<String, String> errors = new HashMap<String, String>();
		if(send.equals("刪除此次請購")){//按下刪除此次請購
	    	session.removeAttribute("Categlory");
			session.removeAttribute("product");
			session.removeAttribute("cartnumber");
    		session.removeAttribute("cartamount");
    		session.removeAttribute("cart");
    		session.removeAttribute("Listprice");
    		return "app.product";
	    }
		model.addAttribute("errors", errors);
		List<ProductListBean>  beans =null;
				beans=new LinkedList<ProductListBean>();
		if(session.getAttribute("cart")==null) {
			errors.put("cate", "請選擇相同大項");
			model.addAttribute("errors", errors);
			return "app.product";
		}else {
			beans=(List<ProductListBean>) session.getAttribute("cart");
		}
		Integer proamt =0;
		if(bean.getPro_amount()!=null) {
			
			try {
				proamt=Integer.valueOf(bean.getPro_amount());
			}catch(NumberFormatException ex) {
				ex.getStackTrace();
				errors.put("cate", "請輸入整數");
				model.addAttribute("errors", errors);
				return "app.product";
			}
		}
		
		String Part_no =bean.getPart_no();
		String Pro_cate =bean.getPro_cate();
		
		if (send.equals("修改數量")) {//按下修改數量
			Integer xs=0;
			for(int i=0;i<beans.size();i++) {
				ProductListBean x=beans.get(i);
				
				if(x.getPart_no().equals(Part_no)) {
				       x.setPro_amount(proamt);
				}else if(!(x.getPro_cate().equals(Pro_cate))){
					errors.put("cate", "請選擇相同大項");
					model.addAttribute("errors", errors);
					return "app.product";
				}
				xs+=x.getPro_amount()*x.getPro_price();
				if(xs>1000000) {
					session.setAttribute("sign2",userManger);
					session.setAttribute("sign3",boss);
				}else {
					 if(session.getAttribute("sign3")!=null) {
						 session.removeAttribute("sign3");
					 }
					session.setAttribute("sign2",userManger);
				}
				session.setAttribute("Listprice",xs);//////////
			}
			session.setAttribute("cartnumber",beans.size());
			session.setAttribute("cartamount",beans.size());
			session.setAttribute("cart",beans);
	    	return "Apply.List";
	    }else if(send.equals("刪除此項產品")){//按下刪除商品
	    	Integer xs=0;
	    	for(int i=0;i<beans.size();i++) {
				ProductListBean x=beans.get(i);
				if(x.getPart_no().equals(Part_no)) {
					beans.remove(x);
				}else if(!(x.getPro_cate().equals(Pro_cate))){
					errors.put("cate", "請選擇相同大項");
					model.addAttribute("errors", errors);
					return "app.product";
				}
				if(beans.size()>0) {
					
					xs+=x.getPro_amount()*x.getPro_price();
					session.setAttribute("Listprice",xs);
				}
			}
	    	if (beans.size()<=0) {
	    		session.setAttribute("cartnumber",0);
	    		session.setAttribute("cartamount",0);
	    		session.removeAttribute("Listprice");
	    		errors.put("cate", "已無產品");
	    		return "app.product";
	    	}else {
	    		session.setAttribute("cartnumber",beans.size());
	    		session.setAttribute("cartamount",beans.size());
	    		session.setAttribute("cart",beans);
	    		return "Apply.List";
	    	}
	    }
	    
	    else {
	    	
	    	EmployeeBean emp=(EmployeeBean) session.getAttribute("user");
	    	String apid ="Ap"+getorderid();
	    	String Categlory=(String) session.getAttribute("Categlory");
	    	Integer Listprices =(Integer) session.getAttribute("Listprice");
	    	App_MainBean apmainbean=new App_MainBean(apid,emp.getEmp_id(),Categlory,Listprices);
	    	app_MainService.insert(apmainbean);
	    	
//	    	App_MainBean
//	    	private String app_id;
//	    	private String emp_id;
//	    	private String pro_cate;
//	    	private Integer app_price;
//	    	AppDetailBean
	    	for(int i=0;i<beans.size();i++) {
				ProductListBean x=beans.get(i);
				String no=x.getPart_no();
				Integer amo =x.getPro_amount();
				Integer pri =x.getPro_price();
		
				AppDetailBean qwe=new AppDetailBean(apid,no,pri,amo);
				appDetailService.insert(qwe);
	    	}
	    	if (suggestion==null) {
	    		suggestion="";
	    	}
	    	if (Listprices<=1000000)
	    	{
	    		java.util.Date date = new java.util.Date();
	    		java.sql.Date datas =new java.sql.Date(date.getTime());
	    		App_SigningProcessBean ss=new App_SigningProcessBean(emp.getEmp_id(),"申請中",apid,datas,"已簽核",suggestion,1);
	    		App_SigningProcessBean ss1=new App_SigningProcessBean(Sign2Employee,"請購核准",apid,null,"簽核中",null,2);
	    		app_SigningProcessService.insert(ss);
	    		app_SigningProcessService.insert(ss1);
	    	}else {
	    	java.util.Date date = new java.util.Date();
	    	java.sql.Date datas =new java.sql.Date(date.getTime());
	    	App_SigningProcessBean ss=new App_SigningProcessBean(emp.getEmp_id(),"申請中",apid,datas,"已簽核",suggestion,1);
	    App_SigningProcessBean ss1=new App_SigningProcessBean(Sign2Employee,"請購主管審核中",apid,null,"簽核中",null,2);
	    App_SigningProcessBean ss2=new App_SigningProcessBean("emp003","請購核准",apid,null,"未簽核",null,3);
	    		app_SigningProcessService.insert(ss);
	    		app_SigningProcessService.insert(ss1);
	    		app_SigningProcessService.insert(ss2);
	    	}
	    	//appDetailService
//	    	private String app_id;
//	    	private String part_no;
//	    	private Integer pro_price;
//	    	private Integer app_amount;
	    	
	    	//App_SigningProcessBean
//	    	private String app_manger;
//	    	private String app_sta;
//	    	private String app_id;
//	    	private java.util.Date sig_date;
//	    	private String sig_sta;
//	    	private String sig_sug;
//	    	private Integer sig_rank;
	    	session.removeAttribute("Categlory");
			session.removeAttribute("product");
			session.removeAttribute("cartnumber");
    		session.removeAttribute("cartamount");
    		session.removeAttribute("cart");
    		session.removeAttribute("Listprice");
	    	model.addAttribute("applyok","請購成功");
	    	return "apply.ok";
	    }
		
	}
	private String getorderid() {
		App_MainBean xzz=app_MainService.lastid();
		
		String orderNumber1 =xzz.getApp_id();
		if(orderNumber1 !=null) {//如果有請購id
			
		
		Calendar c1=Calendar.getInstance();
		int year =c1.get(Calendar.YEAR);
		int month =c1.get(Calendar.MONTH)+1;
		int day =c1.get(Calendar.DAY_OF_MONTH);
		//取得今日日期
		String myOrderNumber=""+year;
		if(month<10) {
			myOrderNumber=myOrderNumber+"0"+month;
		}else {
			myOrderNumber=myOrderNumber+month;
		}

		if(day<10) {
			myOrderNumber=myOrderNumber+"0"+day;
		}else {
			myOrderNumber=myOrderNumber+day;
		}
		//today=myOrderNumber;
		String ord2 = orderNumber1.substring(2, 10);
		orderNumber1 =orderNumber1.substring(2);
		//如果資料庫最後一筆日期和今日相同ordid就+1
        if(ord2.equals(myOrderNumber)) {
            long num=Long.valueOf(orderNumber1).longValue();
            num++;
            String num1=Long.toString(num);
        	myOrderNumber=num1;
        	return myOrderNumber;
        	
        }else {
        	myOrderNumber=myOrderNumber+"001";
        	return myOrderNumber;
        }
        
		}else {//如果沒有請購id
			Calendar c1=Calendar.getInstance();
			int year =c1.get(Calendar.YEAR);
			int month =c1.get(Calendar.MONTH)+1;
			int day =c1.get(Calendar.DAY_OF_MONTH);
			//取得今日日期
			String myOrderNumber=""+year;
			if(month<10) {
				myOrderNumber=myOrderNumber+"0"+month;
			}else {
				myOrderNumber=myOrderNumber+month;
			}

			if(day<10) {
				myOrderNumber=myOrderNumber+"0"+day;
			}else {
				myOrderNumber=myOrderNumber+day;
			}
			//today=myOrderNumber;
            
			String a1=myOrderNumber+"001";
			return a1;
		}

	}
	

}
