package Apply.model;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import Apply.dao.AppDetailIDao;
import Apply.dao.App_MainIDao;
import Apply.dao.App_SigningProcessIDao;
import misc.SpringJavaConfiguration;
@Component
public class TestApply {
	public static void main(String[] args) {
		ApplicationContext context =
				new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
				SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		//step 1 使用者填寫表單產生請購單主檔
		App_MainIDao productDAO = (App_MainIDao) context.getBean("app_MainDao");
		App_MainBean xs=new App_MainBean("ap20181022001","emp001","零組件",7000);
		productDAO.insert(xs);
		sessionFactory.getCurrentSession().getTransaction().commit();
		sessionFactory.getCurrentSession().beginTransaction();
		//step 2產生請購細項
		AppDetailIDao productDAO1 = (AppDetailIDao) context.getBean("appDetailDao");
		AppDetailBean news= new AppDetailBean("ap20181022001", "part001",100,40);
		AppDetailBean news2= new AppDetailBean("ap20181022001", "part002",100,30);
		productDAO1.insert(news);
		productDAO1.insert(news2);
		sessionFactory.getCurrentSession().getTransaction().commit();
		sessionFactory.getCurrentSession().beginTransaction();
		//step 3產生請購簽核流程
		App_SigningProcessIDao productDAO2 = (App_SigningProcessIDao) context.getBean("app_SigningProcessDao");
		java.util.Date date = new java.util.Date();
		java.sql.Date datas =new java.sql.Date(date.getTime());
		App_SigningProcessBean ss=new App_SigningProcessBean("emp001","申請中","ap20181022001",datas,"已簽核","請核准",1);
		App_SigningProcessBean ss1=new App_SigningProcessBean("emp002","審核完成","ap20181022001",null,"簽核中",null,2);
		productDAO2.insert(ss);
		productDAO2.insert(ss1);
		//productDAO2.delete("申請中", "ap20181022001");
		sessionFactory.getCurrentSession().getTransaction().commit();

		//	step 4-1	//當請購主管按下送出
//		sessionFactory.getCurrentSession().beginTransaction();
//		App_SigningProcessIDao productDAO3 = (App_SigningProcessIDao) context.getBean("app_SigningProcessDao");
//		
//		App_SigningProcessBean ss3=productDAO3.selectsta("emp002", "簽核中");
//		ss3.setSig_date(datas);
//		ss3.setSig_sta("已簽核");
//		ss3.setSig_sug("已核准");
//		sessionFactory.getCurrentSession().getTransaction().commit();

		
		//step 4-2-1主管按下退回
//		sessionFactory.getCurrentSession().beginTransaction();
//		App_SigningProcessIDao productDAO3 = (App_SigningProcessIDao) context.getBean("app_SigningProcessDao");
//		App_SigningProcessBean ss3=productDAO3.selectsta("emp002", "簽核中");
//		
//		
//		ss3.setSig_date(datas);
//		ss3.setSig_sta("未簽核");
//		ss3.setSig_sug("無法核准請改xxx");
//		
//		App_SigningProcessBean ss4=productDAO3.selectrank(ss3.getApp_id(), ss3.getSig_rank()-1);	
//		ss4.setSig_sta("退回中");
//		sessionFactory.getCurrentSession().getTransaction().commit();
		
		
//		//step 4-2-2 判斷請購者被退回表單當請購者重新送出時
//		sessionFactory.getCurrentSession().beginTransaction();
//		App_SigningProcessIDao productDAO4 = (App_SigningProcessIDao) context.getBean("app_SigningProcessDao");
//		App_SigningProcessBean ssq=productDAO4.selectsta("emp001", "退回中");	
//		ssq.setSig_sta("已簽核");
//	
//		
//		App_SigningProcessBean ss5=productDAO4.selectrank(ssq.getApp_id(), ssq.getSig_rank()+1);	
//		ss5.setSig_sta("簽核中");
//		sessionFactory.getCurrentSession().getTransaction().commit();
		
		
		//step 5當請購主管收到後按下送出
//		sessionFactory.getCurrentSession().beginTransaction();
//		App_SigningProcessIDao productDAO3 = (App_SigningProcessIDao) context.getBean("app_SigningProcessDao");
//		
//		App_SigningProcessBean ss3=productDAO3.selectsta("emp002", "簽核中");
//		ss3.setSig_date(datas);
//		ss3.setSig_sta("已簽核");
//		ss3.setSig_sug("已核准");
//		sessionFactory.getCurrentSession().getTransaction().commit();
		
		//當sta條件為審核完成時 將APPSTA改為產生採購單
//		sessionFactory.getCurrentSession().beginTransaction();
//		App_SigningProcessIDao productDAO3 = (App_SigningProcessIDao) context.getBean("app_SigningProcessDao");
//		
//		App_SigningProcessBean ss3=productDAO3.selectfromlastemp("emp002");
//		System.out.println(ss3.getApp_id());
//		App_SigningProcessBean ss4=productDAO3.selectlastrank(ss3.getApp_id());
//		if(ss4.getSig_sta().equals("已簽核")) {
//			ss4.setSig_sta("產生採購單");
//		}else if() {
//			
//		}
//		sessionFactory.getCurrentSession().getTransaction().commit();
		

	

		
	
		
		
		
	
	}
}
