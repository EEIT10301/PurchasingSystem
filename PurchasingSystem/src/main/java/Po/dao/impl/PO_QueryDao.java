package Po.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Po.dao.PO_QueryIDao;
import Po.model.PO_QueryBean;
import misc.SpringJavaConfiguration;
@Repository
public class PO_QueryDao implements PO_QueryIDao{
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
		PO_QueryIDao productDAO = (PO_QueryIDao) context.getBean("PO_QueryDao");
		java.util.Date date = new java.util.Date();
		java.sql.Date datas =new java.sql.Date(date.getTime());
		PO_QueryBean xs =new PO_QueryBean("Po20181013001","ven002",datas,6000);
		productDAO.insert(xs);
		List<PO_QueryBean> selects = productDAO.select();
		System.out.println("selects="+selects);
         for(PO_QueryBean x:selects) {
        	System.out.println("1.詢價檔"+x.getPo_totalprice());
        	System.out.println("2.採購主檔"+x.getpO_MainBean().getVendor_ID());
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}

	@SuppressWarnings("unchecked")
	@Override
	public PO_QueryBean select(String po_id, String vendor_ID) {
		List<PO_QueryBean> list = null;
		PO_QueryBean getone =new PO_QueryBean();
		String hgl="FROM PO_QueryBean WHERE po_id=:id1 AND po_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_id)
				.setParameter("id2", vendor_ID).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(PO_QueryBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			 return null;
		 }
	}

	@Override
	public List<PO_QueryBean> select() {
		return this.getSession().createQuery(
				"from PO_QueryBean", PO_QueryBean.class).setMaxResults(50).list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public PO_QueryBean insert(PO_QueryBean bean) {
		List<PO_QueryBean> list = null;
		String po_id = bean.getPo_ID();
		String vendor_ID = bean.getVendor_ID();
		String hgl="FROM PO_QueryBean WHERE po_id=:id1 AND vendor_ID=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_id)
				.setParameter("id2", vendor_ID).setMaxResults(50).list();
		 if(list.size()>0) {
			  return null;
		 }else {
			 this.getSession().save(bean);
			 return bean;
		 }

	}

	@SuppressWarnings("unchecked")
	@Override
	public PO_QueryBean update(PO_QueryBean bean) {
		List<PO_QueryBean> list = null;
		String po_id = bean.getPo_ID();
		String vendor_ID = bean.getVendor_ID();
		String hgl="FROM PO_QueryBean WHERE po_id=:id1 AND vendor_ID=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_id)
				.setParameter("id2", vendor_ID).setMaxResults(50).list();
		 if(list.size()>0) {
			 for(PO_QueryBean getones :list) {
					getones.setPo_querydate(bean.getPo_querydate());
					getones.setPo_totalprice(bean.getPo_totalprice());
					
			  }
			return bean;
		 }else {
			 return null;
		 }

	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String po_id, String vendor_ID) {
		List<PO_QueryBean> list = null;
		PO_QueryBean getone =new PO_QueryBean();
		String hgl="FROM PO_QueryBean WHERE po_id=:id1 AND po_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_id)
				.setParameter("id2", vendor_ID).setMaxResults(50).list();	 if(list.size()>0) {
			  for(PO_QueryBean getones :list) {
				  getone=getones;
			  }
			  this.getSession().delete(getone);
			  return true;
		 }else {
			 return false;
		 }

	}

}
