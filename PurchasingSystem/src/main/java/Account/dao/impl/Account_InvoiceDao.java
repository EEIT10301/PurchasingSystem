package Account.dao.impl;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Account.dao.Account_InvoiceIDao;
import Account.model.Account_InvoiceBean;
import Account.model.Account_SigningProcessBean;
import Apply.dao.EmployeeIDao;
import Apply.model.EmployeeBean;
import misc.SpringJavaConfiguration;

@Repository
public class Account_InvoiceDao implements Account_InvoiceIDao {

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

		Account_InvoiceIDao productDAO = (Account_InvoiceIDao) context.getBean("account_InvoiceDao");
		List<Account_InvoiceBean> selects = productDAO.select();
		System.out.println("selects="+selects);
		for(Account_InvoiceBean x:selects) {
		
			System.out.println("1.Account_InvoiceBean物件:"+x.getInv_id());
			System.out.println("2.EmployeeBean物件:"+x.getEmployeeBean().getEmp_dep());
			
           
	           System.out.println("3.Accout_PayableBean物件:"+x.getAccout_PayableBean().getAccoutpayable_no());
			for( Account_SigningProcessBean ssz:x.getAccount_SigningProcessBean()) {
				System.out.println("4.Account_SigningProcessBean物件:"+ssz.getSig_Rank());
			}
			System.out.println("5.採購單:"+x.getpO_MainBean().getVendor_ID());
		}
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	
	@Override
	public Account_InvoiceBean select(String id) {
		return this.getSession().get(Account_InvoiceBean.class, id);
	}

	@Override
	public List<Account_InvoiceBean> select() {
		return this.getSession().createQuery(
				"from Account_InvoiceBean", Account_InvoiceBean.class).setMaxResults(50).list();
	}

	@Override
	public Account_InvoiceBean insert(Account_InvoiceBean bean) {
		if(bean!=null) {
			Account_InvoiceBean temp = this.getSession().get(Account_InvoiceBean.class, bean.getInv_id());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public Account_InvoiceBean update(Account_InvoiceBean bean) {
		this.getSession().merge(bean);
		return bean;
//		Account_InvoiceBean temp = this.getSession().get(Account_InvoiceBean.class, bean.getInv_id());
//		if(temp!=null) {
//			temp=bean;
//		}
//		return temp;
	}

	@Override
	public boolean delete(String id) {
		Account_InvoiceBean temp = this.getSession().get(Account_InvoiceBean.class, id);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

}
