package Po.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Po.dao.PO_SigningProcessIDao;
import Po.model.PO_SigningProcessBean;
import misc.SpringJavaConfiguration;



@Repository
public class PO_SigningProcessDao implements PO_SigningProcessIDao{
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

		PO_SigningProcessIDao productDAO = (PO_SigningProcessIDao) context.getBean("PO_SigningProcessDao");
		java.util.Date date = new java.util.Date();
		java.sql.Date datas =new java.sql.Date(date.getTime());
		PO_SigningProcessBean ss=new PO_SigningProcessBean("emp001","申請中","Po20181013001",datas,"已簽核","請核准",1);
		PO_SigningProcessBean ss1=new PO_SigningProcessBean("emp002","已審核完成","Po20181013001",null,"簽核中",null,2);
		productDAO.insert(ss);
		productDAO.insert(ss1);
		sessionFactory.getCurrentSession().getTransaction().commit();
		sessionFactory.getCurrentSession().beginTransaction();
		List<PO_SigningProcessBean> selects = productDAO.select();
		for(PO_SigningProcessBean xz:selects) {
        	System.out.println("1.PO_SigningProcessBean物件: "+xz.getPo_id());
        	System.out.println("2.EmployeeBean物件: "+xz.getEmployeeBean().getEmp_email());
        	System.out.println("3.PO_MainBean物件: "+xz.getpO_MainBean().getVendor_ID());
 
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@SuppressWarnings("unchecked")
	@Override
	public PO_SigningProcessBean select(String po_sta, String po_id) {
		List<PO_SigningProcessBean> list = null;
		PO_SigningProcessBean getone =new PO_SigningProcessBean();
		String hgl="FROM PO_SigningProcessBean WHERE po_sta=:id1 AND po_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_sta)
				.setParameter("id2", po_id).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(PO_SigningProcessBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			 return null;
		 }
	}
	@Override
	public List<PO_SigningProcessBean> select() {
		return this.getSession().createQuery(
				"from PO_SigningProcessBean", PO_SigningProcessBean.class).setMaxResults(50).list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public PO_SigningProcessBean insert(PO_SigningProcessBean bean) {
		List<PO_SigningProcessBean> list = null;
		String po_sta = bean.getPo_sta();
		String po_id = bean.getPo_id();
		String hgl="FROM PO_SigningProcessBean WHERE po_sta=:id1 AND po_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_sta)
				.setParameter("id2", po_id).setMaxResults(50).list();
		 if(list.size()>0) {
			 
			  return null;
		 }else {
			 this.getSession().save(bean);
			 return bean;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public PO_SigningProcessBean update(PO_SigningProcessBean bean) {
		List<PO_SigningProcessBean> list = null;
		String po_sta = bean.getPo_sta();
		String po_id = bean.getPo_id();
		String hgl="FROM PO_SigningProcessBean WHERE po_sta=:id1 AND po_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_sta)
				.setParameter("id2", po_id).setMaxResults(50).list();
		 if(list.size()>0) {
			 for(PO_SigningProcessBean getones :list) {
				  getones.setPo_manger(bean.getPo_manger());
				  getones.setSig_date(bean.getSig_date());
				  getones.setSig_rank(bean.getSig_rank());
				  getones.setSig_sta(bean.getSig_sta());
				  getones.setSig_sug(bean.getSig_sug());
			  }
			return bean;
		 }else {
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String po_sta, String po_id) {
		List<PO_SigningProcessBean> list = null;
		PO_SigningProcessBean getone =new PO_SigningProcessBean();
		String hgl="FROM PO_SigningProcessBean WHERE po_sta=:id1 AND po_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_sta)
				.setParameter("id2", po_id).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(PO_SigningProcessBean getones :list) {
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
	public List<PO_SigningProcessBean> selectpoid(String po_id) {
		List<PO_SigningProcessBean> list = null;
		String hgl="FROM PO_SigningProcessBean WHERE po_id=:id1 order by sig_rank";
		list =this.getSession().createQuery(hgl).setParameter("id1", po_id).setMaxResults(50).list();
		 if(list.size()>0) {
			  return list;
		 }else {
			 return null;
		 }
	}

	

}
