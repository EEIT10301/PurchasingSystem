package Apply.dao.impl;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Apply.dao.App_MainIDao;
import Apply.model.AppDetailBean;
import Apply.model.App_MainBean;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import misc.SpringJavaConfiguration;
@Repository
public class App_MainDao implements App_MainIDao{
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	public static void main(String[] args) {

		ApplicationContext context =
				new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();

		App_MainIDao productDAO = (App_MainIDao) context.getBean("app_MainDao");
		//App_MainBean xs=new App_MainBean("ap20181013001","emp001","零組件",6000);
		
		//productDAO.update(xs);
		sessionFactory.getCurrentSession().getTransaction().commit();
		sessionFactory.getCurrentSession().beginTransaction();
		App_MainBean select =productDAO.select("ap20181013001");
       System.out.println(select.getApp_price());
		List<App_MainBean> selects = productDAO.select();
		
		System.out.println("selects="+selects);
		Set<App_SigningProcessBean> item = new LinkedHashSet<>();
		Set<AppDetailBean> items = new LinkedHashSet<>();
         for(App_MainBean x:selects) {
        	 item=x.getApp_SigningProcessBean();
        	 for(App_SigningProcessBean xsa:item) {
        		 System.out.println("1請購簽核table:"+xsa.getApp_sta());
        	 }
        	 
        	 EmployeeBean  xt=x.getEmployeeBean();
        	 x.setPro_cate("零組件");
        	 xt.setEmp_name("劉亮廷");
        	 System.out.println("2採購主檔table:"+x.getEmp_id());
        	 System.out.println("3員工table:"+x.getEmployeeBean().getEmp_dep());
        	 System.out.println("3員工table:"+x.getEmployeeBean().getEmp_name());
        	 System.out.println("2採購主檔table:"+x.getApp_id());
        	 System.out.println("2採購主檔table:"+x.getPro_cate());
        	 System.out.println("3員工table:"+x.getEmployeeBean().getEmp_job());
        	 items=x.getAppDetailBean();
        	 for(AppDetailBean xsa:items) {
        		 System.out.println("4請購細項table:"+xsa.getPart_no());
        		 System.out.println("4請購細項table:"+xsa.getPro_price());
        	 }
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@Override
	public App_MainBean select(String id) {
		return this.getSession().get(App_MainBean.class, id);
	}
	@Override
	public List<App_MainBean> select() {
		return this.getSession().createQuery(
				"from App_MainBean", App_MainBean.class).setMaxResults(500).list();
	}
	@Override
	public App_MainBean insert(App_MainBean bean) {
		if(bean!=null) {
			App_MainBean temp = this.getSession().get(App_MainBean.class, bean.getApp_id());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	@Override
	public App_MainBean update(App_MainBean bean) {
		 this.getSession().merge(bean);
//		App_MainBean temp = this.getSession().get(App_MainBean.class, bean.getApp_id());
//		if(temp!=null) {
//			temp.setApp_price(bean.getApp_price());
//			temp.setEmp_id(bean.getEmp_id());
//			temp.setPro_cate(bean.getPro_cate());
//		}
		return bean;
	}
	@Override
	public boolean delete(String id) {
		App_MainBean temp = this.getSession().get(App_MainBean.class, id);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}
	@Override
	public App_MainBean lastid() {
		List<App_MainBean> x=this.getSession().createQuery(
				"from App_MainBean ORDER BY app_id DESC ", App_MainBean.class).setMaxResults(1).list();
		App_MainBean xsz=new App_MainBean();
		for(App_MainBean s:x) {
			xsz=s;
		}
		return xsz;
	}
	@SuppressWarnings("unchecked")
	@Override
	public  List<App_MainBean> selectempid(String emp_id) {
		List<App_MainBean> list = null;
		String hgl="FROM App_MainBean WHERE emp_id=:id1 ";
		list =this.getSession().createQuery(hgl).setParameter("id1", emp_id)
				.setMaxResults(5000).list();
		if(list.size()>0) {
			
			return list;
		}else {
			return null;
		}
	}
	
	
}
