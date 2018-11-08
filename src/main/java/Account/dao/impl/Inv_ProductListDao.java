package Account.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Account.dao.Inv_ProductListIDao;
import Account.model.Inv_ProductListBean;
import misc.SpringJavaConfiguration;

@Repository
public class Inv_ProductListDao implements Inv_ProductListIDao{
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

		Inv_ProductListIDao productDAO = (Inv_ProductListIDao) context.getBean("inv_ProductListDao");
		List<Inv_ProductListBean> selects = productDAO.select();
		System.out.println("selects="+selects);
         for(Inv_ProductListBean x:selects) {
        	System.out.println("1.驗收單細項:"+x.getChk_quality());
        	System.out.println("2.驗收單主表:"+x.getInv＿ProductCheckBean().getVender_ID());
        	System.out.println("3.產品主表:"+x.getProductListBean().getPro_name());
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@SuppressWarnings("unchecked")
	@Override
	public Inv_ProductListBean select(String chk_Id, String part_No) {
		List<Inv_ProductListBean> list = null;
		Inv_ProductListBean getone =new Inv_ProductListBean();
		String hgl="FROM Inv_ProductListBean WHERE chk_Id=:id1 AND part_No=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", chk_Id)
				.setParameter("id2", part_No).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(Inv_ProductListBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			 return null;
		 }
	}
	@Override
	public List<Inv_ProductListBean> select() {
		return this.getSession().createQuery(
				"from Inv_ProductListBean", Inv_ProductListBean.class).setMaxResults(50).list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public Inv_ProductListBean insert(Inv_ProductListBean bean) {
		List<Inv_ProductListBean> list = null;
		String chk_Id = bean.getChk_Id();
		String part_No = bean.getPart_No();
		String hgl="FROM Inv_ProductListBean WHERE chk_Id=:id1 AND part_No=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", chk_Id)
				.setParameter("id2", part_No).setMaxResults(50).list();
		 if(list.size()>0) {
			  return null;
		 }else {
			 this.getSession().save(bean);
			 return bean;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public Inv_ProductListBean update(Inv_ProductListBean bean) {
		List<Inv_ProductListBean> list = null;
		String chk_Id = bean.getChk_Id();
		String part_No = bean.getPart_No();
		String hgl="FROM Inv_ProductListBean WHERE chk_Id=:id1 AND part_No=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", chk_Id)
				.setParameter("id2", part_No).setMaxResults(50).list();
		 if(list.size()>0) {
			 for(Inv_ProductListBean getones :list) {
				 getones.setChk_Count(bean.getChk_Count());
					getones.setChk_quality(bean.getChk_quality());
					getones.setChk_Date(bean.getChk_Date());
					getones.setChk_status(bean.getChk_status());
			  }
			return bean;
		 }else {
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String chk_Id, String part_No) {
		List<Inv_ProductListBean> list = null;
		Inv_ProductListBean getone =new Inv_ProductListBean();
		String hgl="FROM Inv_ProductListBean WHERE chk_Id=:id1 AND part_No=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", chk_Id)
				.setParameter("id2", part_No).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(Inv_ProductListBean getones :list) {
				  getone=getones;
			  }
			  this.getSession().delete(getone);
			  return true;
		 }else {
			 return false;
		 }
	}
	

}
