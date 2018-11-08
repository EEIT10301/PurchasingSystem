package Po.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Po.dao.PO_MainIDao;
import Po.model.PO_DetailBean;
import Po.model.PO_MainBean;
import Po.model.PO_QueryBean;
import Po.model.PO_SigningProcessBean;
import misc.SpringJavaConfiguration;


@Repository
public class PO_MainDao implements PO_MainIDao{
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

		PO_MainIDao productDAO = (PO_MainIDao) context.getBean("PO_MainDao");
		List<PO_MainBean> selects = productDAO.select();
//		java.util.Date date = new java.util.Date();
// 		java.sql.Date datas =new java.sql.Date(date.getTime());
//		PO_MainBean xs =new PO_MainBean("Po20181013002","emp001","ven002",datas,6000);
//		productDAO.update(xs);
		System.out.println("selects="+selects);
         for(PO_MainBean x:selects) {
        	System.out.println("1.PO_MainBean物件:"+x.getVendor_ID());
        	System.out.println("2.EmployeeBean物件:"+x.getEmployeeBean().getEmp_name());
        	for(PO_DetailBean ss:x.getpO_DetailBean()) {
        		
        		System.out.println("3.PO_DetailBean物件:"+ss.getMarket_Price());
        	}
        	for(PO_SigningProcessBean ss:x.getpO_SigningProcessBean()) {
        		System.out.println("4.PO_SigningProcessBean物件:"+ss.getSig_rank());
        	}
        	System.out.println("5.請款單:"+x.getAccount_InvoiceBean().getInv_id());
        	System.out.println("6.驗收單:"+x.getInv＿ProductCheckBean().getVender_ID());
        	System.out.println("7.廠商主檔:"+x.getpO_Vendor_InfoBean().getVendor_email());
       	for(PO_QueryBean ss:x.getpO_QueryBean()) {
        		System.out.println("8.詢價紀錄物件:"+ss.getVendor_ID());
       	}
        	
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@Override
	public PO_MainBean select(String po_id) {
		return this.getSession().get(PO_MainBean.class, po_id);
	}

	@Override
	public List<PO_MainBean> select() {
		return this.getSession().createQuery(
				"from PO_MainBean", PO_MainBean.class).setMaxResults(50).list();
	}

	@Override
	public PO_MainBean insert(PO_MainBean bean) {
		if(bean!=null) {
			PO_MainBean temp = this.getSession().get(PO_MainBean.class, bean.getPo_id());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public PO_MainBean update(PO_MainBean bean) {
		 this.getSession().merge(bean);
		 return bean;
		//		PO_MainBean temp = this.getSession().get(PO_MainBean.class, bean.getPo_id());
//		if(temp!=null) {
//			
//		}
//		return temp;
	}

	@Override
	public boolean delete(String po_id) {
		PO_MainBean temp = this.getSession().get(PO_MainBean.class, po_id);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

}
