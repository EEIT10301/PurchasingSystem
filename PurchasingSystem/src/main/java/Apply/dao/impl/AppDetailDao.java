package Apply.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Apply.dao.AppDetailIDao;
import Apply.model.AppDetailBean;
import Apply.model.App_MainBean;
import misc.SpringJavaConfiguration;

@Repository
public class AppDetailDao implements AppDetailIDao{
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

		AppDetailIDao productDAO = (AppDetailIDao) context.getBean("appDetailDao");
		AppDetailBean news= new AppDetailBean("ap20181013001", "part001",100,40);
		productDAO.update(news);
		AppDetailBean select=productDAO.select("ap20181013001", "part001");
		System.out.println("upadte數量:"+select.getApp_amount());
		System.out.println("upadte價格:"+select.getPro_price());
//		select.setPro_price(50);
		List<AppDetailBean> selects = productDAO.select();
		System.out.println("selects="+selects);
         for(AppDetailBean x:selects) {
        	 x.setApp_amount(30);
        	 x.setPro_price(100);
        	 App_MainBean s=new App_MainBean();
        	s=x.getApp_MainBean();
        	 s.setApp_price(6000);
        	 System.out.println("1請購細項:"+x.getApp_amount());
        	 System.out.println("1請購細項:"+x.getPro_price());
        	 System.out.println("2請購主檔:"+x.getApp_MainBean().getApp_id());
        	 System.out.println("3產品表格:"+x.getProductListBean().getPro_cate());
        	 System.out.println("3產品表格:"+x.getProductListBean().getPro_name());
        	 System.out.println("3產品表格:"+x.getProductListBean().getPro_spe());
        	 
         }
       
        
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@SuppressWarnings("unchecked")
	@Override
	public AppDetailBean select(String app_id,String part_no) {
		List<AppDetailBean> list = null;
		AppDetailBean getone =new AppDetailBean();
		String hgl="FROM AppDetailBean WHERE app_id=:id1 AND part_no=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_id)
				.setParameter("id2", part_no).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(AppDetailBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			 return null;
		 }
		//return this.getSession().get(App_SigningProcessBean.class, id);
	}
	@Override
	public List<AppDetailBean> select() {
		return this.getSession().createQuery(
				"from AppDetailBean", AppDetailBean.class).setMaxResults(50).list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public AppDetailBean insert(AppDetailBean bean) {
		List<AppDetailBean> list = null;
		String app_id = bean.getApp_id();
		String part_no = bean.getPart_no();
		String hgl="FROM AppDetailBean WHERE app_id=:id1 AND part_no=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_id)
				.setParameter("id2", part_no).setMaxResults(50).list();
		 if(list.size()>0) {
			  return null;
		 }else {
			 this.getSession().save(bean);
			 return bean;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public AppDetailBean update(AppDetailBean bean) {
		List<AppDetailBean> list = null;
		AppDetailBean getone=new AppDetailBean();
		String app_id = bean.getApp_id();
		String part_no = bean.getPart_no();
		String hgl="FROM AppDetailBean WHERE app_id=:id1 AND part_no=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_id)
				.setParameter("id2", part_no).setMaxResults(50).list();
		 if(list.size()>0) {
			for(AppDetailBean getones:list) {
				getones.setPro_price(bean.getPro_price());
				getones.setApp_amount(bean.getApp_amount());
			}
			return bean;
		 }else {
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String app_id,String part_no) {
		List<AppDetailBean> list = null;
		AppDetailBean getone =new AppDetailBean();
		String hgl="FROM AppDetailBean WHERE app_id=:id1 AND part_no=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_id)
				.setParameter("id2", part_no).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(AppDetailBean getones :list) {
				  getone=getones;
			  }
			  this.getSession().delete(getone);
			  return true;
		 }else {
			 return false;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<AppDetailBean> selectpart_no(String part_no) {
		List<AppDetailBean> list = null;
		String hgl="FROM AppDetailBean WHERE  part_no=:id1";
		list =this.getSession().createQuery(hgl).setParameter("id1", part_no)
				.setMaxResults(50).list();
		if(list.size()>0) {
			 return list;
		}else {
			 return null;
		 }
	
	}
}
