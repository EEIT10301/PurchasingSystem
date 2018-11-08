package Account.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Account.dao.Inv＿ProductCheckIDao;
import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Inv.model.Inv_SigningProcessBean;
import misc.SpringJavaConfiguration;
@Repository
public class Inv＿ProductCheckDao implements Inv＿ProductCheckIDao{
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

		Inv＿ProductCheckIDao productDAO = (Inv＿ProductCheckIDao) context.getBean("inv＿ProductCheckDao");
		
		Inv＿ProductCheckBean aa = productDAO.select("01");
		System.out.println(aa.getChk_Id());
		
//		List<Inv＿ProductCheckBean> selects = productDAO.select();
//		System.out.println("selects="+selects);
//		for(Inv＿ProductCheckBean x:selects) {
//		    System.out.println("1.Inv＿ProductCheckBean物件:"+x.getChk_Id());
//		    System.out.println("2.EmployeeBean物件:"+x.getEmployeeBean().getEmp_email());
//		    System.out.println("3.Accout_PayableBean物件:"+x.getAccout_PayableBean().getAccoutpayable_no());
//		 System.out.println("4.採購單主檔:"+x.getpO_MainBean().getVendor_ID());
//		 System.out.println("5.廠商主檔:"+x.getpO_Vendor_InfoBean().getVendor_name());
//		   for(Inv_SigningProcessBean xs:x.getInv_SigningProcessBean()) {
//			   System.out.println("6.驗收單簽核檔:"+xs.getInv_Manger());
//		   }
//		   for(Inv_ProductListBean xs:x.getInv_ProductListBean()) {
//			   System.out.println("7.驗收單細項"+xs.getChk_Date());
//		   }
//		}
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@Override
	public Inv＿ProductCheckBean select(String id) {
		return this.getSession().get(Inv＿ProductCheckBean.class, id);
	}

	@Override
	public List<Inv＿ProductCheckBean> select() {
		return this.getSession().createQuery(
				"from Inv＿ProductCheckBean", Inv＿ProductCheckBean.class).setMaxResults(50).list();
	}

	@Override
	public Inv＿ProductCheckBean insert(Inv＿ProductCheckBean bean) {
		if(bean!=null) {
			Inv＿ProductCheckBean temp = this.getSession().get(Inv＿ProductCheckBean.class, bean.getChk_Id());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public Inv＿ProductCheckBean update(Inv＿ProductCheckBean bean) {
		this.getSession().merge(bean);
		return bean;
//		Inv＿ProductCheckBean temp = this.getSession().get(Inv＿ProductCheckBean.class, bean.getChk_Id());
//		if(temp!=null) {
//			temp=bean;
//		}
//		return temp;
	}

	@Override
	public boolean delete(String id) {
		Inv＿ProductCheckBean temp = this.getSession().get(Inv＿ProductCheckBean.class, id);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}
	

}
