package Po.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Po.dao.PO_DetailIDao;
import Po.model.PO_DetailBean;
import misc.SpringJavaConfiguration;

@Repository
public class PO_DetailDao implements PO_DetailIDao{
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

		PO_DetailIDao productDAO = (PO_DetailIDao) context.getBean("PO_DetailDao");
		List<PO_DetailBean> selects = productDAO.select();
		System.out.println("selects="+selects);
         for(PO_DetailBean x:selects) {
        	System.out.println("1.PO_Detail物件:"+x.getPo_id());
        	System.out.println("2.PO_Main物件:"+x.getpO_MainBean().getVendor_ID());
        	System.out.println("3.Product物件:"+x.getProductListBean().getPro_name());
        	System.out.println("3.Product物件:"+x.getProductListBean().getPro_intro());
        	System.out.println("3.Product物件:"+x.getProductListBean().getPro_img());
//        	for(PO_DetailBean ss:x.getpO_DetailBean()) {
//        		
//        		System.out.println("3.PO_DetailBean物件:"+ss.getMat_Name());
//        	}
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@SuppressWarnings("unchecked")
	@Override
	public PO_DetailBean select(String po_id, String part_No) {
		List<PO_DetailBean> list = null;
		PO_DetailBean getone =new PO_DetailBean();
		String hgl="FROM PO_DetailBean WHERE po_id=:id1 AND part_No=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_id)
				.setParameter("id2", part_No).setMaxResults(500).list();
		 if(list.size()>0) {
			  for(PO_DetailBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			 return null;
		 }
	}

	@Override
	public List<PO_DetailBean> select() {
		return this.getSession().createQuery(
				"from PO_DetailBean", PO_DetailBean.class).setMaxResults(500).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public PO_DetailBean insert(PO_DetailBean bean) {
		List<PO_DetailBean> list = null;
		String po_id = bean.getPo_id();
		String part_No = bean.getPart_No();
		String hgl="FROM PO_DetailBean WHERE po_id=:id1 AND part_No=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_id)
				.setParameter("id2", part_No).setMaxResults(500).list();
		 if(list.size()>0) {
			  return null;
		 }else {
			 this.getSession().save(bean);
			 return bean;
		 }
	}

	@SuppressWarnings("unchecked")
	@Override
	public PO_DetailBean update(PO_DetailBean bean) {
		List<PO_DetailBean> list = null;
		String po_id = bean.getPo_id();
		String part_No = bean.getPart_No();
		String hgl="FROM PO_DetailBean WHERE po_id=:id1 AND part_No=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_id)
				.setParameter("id2", part_No).setMaxResults(500).list();
		 if(list.size()>0) {
			 for(PO_DetailBean getones :list) {
					getones.setMarket_Price(bean.getMarket_Price());				
					getones.setQuotation(bean.getQuotation());
					getones.setTotal_Price(bean.getTotal_Price());
					getones.setTotal_Qty(bean.getTotal_Qty());
			  }
			return bean;
		 }else {
			 return null;
		 }
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String po_id, String part_No) {
		List<PO_DetailBean> list = null;
		PO_DetailBean getone =new PO_DetailBean();
		String hgl="FROM PO_DetailBean WHERE po_id=:id1 AND part_No=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_id)
				.setParameter("id2", part_No).setMaxResults(500).list();
		 if(list.size()>0) {
			  for(PO_DetailBean getones :list) {
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
	public List<PO_DetailBean> selectpo_id(String po_id) {
		List<PO_DetailBean> list = null;
		String hgl="FROM PO_DetailBean WHERE po_id=:id1 ";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_id)
				.setMaxResults(500).list();
		 if(list.size()>0) {
			 return list;
		 }
		 return null;
	}

}
