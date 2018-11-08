package Inv.dao.impl;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Apply.model.AppDetailBean;
import Inv.dao.Inv_DetailIDao;
import Inv.model.Inv_DetailBean;
import misc.SpringJavaConfiguration;
@Repository
public class Inv_DetailDao implements Inv_DetailIDao{
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	public static void main(String[] args) throws ParseException {
		ApplicationContext context =
				new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		Inv_DetailBean bea = new Inv_DetailBean();
		Inv_DetailIDao productDAO = (Inv_DetailIDao) context.getBean("inv_DetailDao");
		List<Inv_DetailBean> selects = productDAO.select();
		System.out.println("selects="+selects);
         for(Inv_DetailBean x:selects) {
        	System.out.println("1.驗收單主表: "+x.getInv_MainBean().getInv_Part_no());
        	System.out.println("2.驗收單細項: "+x.getInv_Part());
        	System.out.println("測試內容1 "+x.getInv_Name());
        	System.out.println("測試內容2 "+x.getInv_Spe());
        	System.out.println("測試內容3 "+x.getInv__Date());
        	bea.setInv__Date(x.getInv__Date());
         }
         System.out.println(bea.getInv__Date()+"---"+bea.getInv__Date().getClass().getTypeName());
//		---------------------------------
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date today = dateFormat.parse("2005-12-25");
//		Inv_DetailBean bean = new Inv_DetailBean("part002","記憶卡",30, bea.getInv__Date(),"良好","part001","良好",null);
//		Inv_DetailBean a = productDAO.insert(bean);
//		System.out.println(a);
		sessionFactory.getCurrentSession().getTransaction().commit();
	}


	
//new
	@SuppressWarnings("unchecked")
	@Override
	public List<Inv_DetailBean> select(String Inv_Part_no) {
		List<Inv_DetailBean> list = null;
		Inv_DetailBean getone =new Inv_DetailBean();
		String hgl="FROM Inv_DetailBean WHERE Inv_Part_no=:id1";
		list =this.getSession().createQuery(hgl).setParameter("id1",Inv_Part_no).list();
		
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Inv_DetailBean select(String Inv_Part_no, String Inv__Date) {
		List<Inv_DetailBean> list = null;
		Inv_DetailBean getone =new Inv_DetailBean();
		String hgl="FROM Inv_DetailBean WHERE Inv_Part_no=:id1 AND Inv__Date=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", Inv_Part_no)
				.setParameter("id2", Inv__Date).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(Inv_DetailBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			 return null;
		 }
	}
	@Override
	public List<Inv_DetailBean> select() {
		return this.getSession().createQuery(
				"from Inv_DetailBean", Inv_DetailBean.class).setMaxResults(50).list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public Inv_DetailBean insert(Inv_DetailBean bean) {
		List<Inv_DetailBean> list = null;
		String Inv_Part_no = bean.getInv_Part_no();
		java.util.Date Inv__Date = bean.getInv__Date();
//		bean.setInv_Part_no("part001");
//		bean.setInv__Date(java.sql.Date.valueOf("2018-11-01 00:00:00.000"));
		String hgl="FROM Inv_DetailBean WHERE Inv_Part_no=:id1 AND Inv__Date=:id2";

		System.out.println("此為值"+bean);
		list =this.getSession().createQuery(hgl).setParameter("id1", Inv_Part_no)
				.setParameter("id2", Inv__Date).setMaxResults(50).list();
		System.out.println("此為值"+bean);
		
		 if(list.size()>0) {
			 System.out.println("此為值"+bean);
			  return null;
		 }else {
			 System.out.println("此為值"+bean);
			 this.getSession().save(bean);
			 return bean;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public Inv_DetailBean update(Inv_DetailBean bean) {
		List<Inv_DetailBean> list = null;
		Inv_DetailBean getone=new Inv_DetailBean();
		String Inv_Part_no = bean.getInv_Part_no();
		java.util.Date Inv__Date = bean.getInv__Date();
		String hgl="FROM Inv_DetailBean WHERE Inv_Part_no=:id1 AND Inv__Date=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", Inv_Part_no)
				.setParameter("id2", Inv__Date).setMaxResults(50).list();
		 if(list.size()>0) {
			for(Inv_DetailBean getones:list) {
				getones.setInv_Amount(bean.getInv_Amount());
				getones.setInv_Amounts(bean.getInv_Amounts());
				getones.setInv_Intr(bean.getInv_Intr());
				getones.setInv_Name(bean.getInv_Name());
				getones.setInv_Part(bean.getInv_Part());
				getones.setInv_Spe(bean.getInv_Spe());
			}
			return bean;
		 }else {
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String Inv_Part_no, String Inv__Date) {
		List<Inv_DetailBean> list = null;
		Inv_DetailBean getone =new Inv_DetailBean();
		String hgl="FROM Inv_DetailBean WHERE Inv_Part_no=:id1 AND Inv__Date=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", Inv_Part_no)
				.setParameter("id2", Inv__Date).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(Inv_DetailBean getones :list) {
				  getone=getones;
			  }
			  this.getSession().delete(getone);
			  return true;
		 }else {
			 return false;
		 }
	}
	

}
