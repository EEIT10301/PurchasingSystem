package Inv.dao.impl;

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
	public static void main(String[] args) {
		ApplicationContext context =
				new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		Inv_DetailIDao productDAO = (Inv_DetailIDao) context.getBean("inv_DetailDao");
		List<Inv_DetailBean> selects = productDAO.select();
		System.out.println("selects="+selects);
         for(Inv_DetailBean x:selects) {
        	System.out.println("1.驗收單主表: "+x.getInv_MainBean().getInv_Part_no());
        	System.out.println("2.驗收單細項: "+x.getInv_Part());
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Inv_DetailBean> select(String Inv_Part_no) {
		List<Inv_DetailBean> list = null;
		Inv_DetailBean getone =new Inv_DetailBean();
		String hgl="FROM Inv_DetailBean WHERE Inv_Part_no=:id1 ";
		list =this.getSession().createQuery(hgl).setParameter("id1",Inv_Part_no).setMaxResults(500).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Inv_DetailBean select(String Inv_Part_no, String Inv__Date) {
		List<Inv_DetailBean> list = null;
		Inv_DetailBean getone =new Inv_DetailBean();
		String hgl="FROM Inv_DetailBean WHERE Inv_Part_no=:id1 AND Inv__Date=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", Inv_Part_no)
				.setParameter("id2", Inv__Date).setMaxResults(50).setMaxResults(500).list();
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
		String hgl="FROM Inv_DetailBean WHERE Inv_Part_no=:id1 AND Inv__Date=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", Inv_Part_no)
				.setParameter("id2", Inv__Date).setMaxResults(50).list();
		 if(list.size()>0) {
			  return null;
		 }else {
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
