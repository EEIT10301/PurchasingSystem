package Account.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Account.dao.Account_SigningProcessIDao;
import Account.model.Account_SigningProcessBean;
import misc.SpringJavaConfiguration;



@Repository
public class Account_SigningProcessDao implements Account_SigningProcessIDao {
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

		Account_SigningProcessIDao productDAO = (Account_SigningProcessIDao) context.getBean("account_SigningProcessDao");
		java.util.Date date = new java.util.Date();
		java.sql.Date datas =new java.sql.Date(date.getTime());
		Account_SigningProcessBean ss=new Account_SigningProcessBean("emp001","申請中","In20181013001",datas,"已簽核","請核准",1);
		Account_SigningProcessBean ss1=new Account_SigningProcessBean("emp002","已審核完成","In20181013001",null,"簽核中",null,2);
		productDAO.insert(ss);
		productDAO.insert(ss1);
		sessionFactory.getCurrentSession().getTransaction().commit();
		sessionFactory.getCurrentSession().beginTransaction();
		List<Account_SigningProcessBean> selects = productDAO.select();
		for(Account_SigningProcessBean xz:selects) {
			System.out.println("Account_SigningProcessBean物件:"+xz.getAccount_Manger());
        	System.out.println("Account_InvoiceBean物件:"+xz.getAccount_InvoiceBean().getPo_id());
        	System.out.println("EmployeeBean物件:"+xz.getEmployeeBean().getEmp_name());
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@SuppressWarnings("unchecked")
	@Override
	public Account_SigningProcessBean select(String account_Sta, String inv_id) {
		List<Account_SigningProcessBean> list = null;
		Account_SigningProcessBean getone =new Account_SigningProcessBean();
		String hgl="FROM Account_SigningProcessBean WHERE account_Sta=:id1 AND inv_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", account_Sta)
				.setParameter("id2", inv_id).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(Account_SigningProcessBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			 return null;
		 }
		//return this.getSession().get(App_SigningProcessBean.class, id);
	}

	@Override
	public List<Account_SigningProcessBean> select() {
		return this.getSession().createQuery(
				"from Account_SigningProcessBean", Account_SigningProcessBean.class).setMaxResults(50).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Account_SigningProcessBean insert(Account_SigningProcessBean bean) {
		List<Account_SigningProcessBean> list = null;
		String account_Sta = bean.getAccount_Sta();
		String inv_id = bean.getInv_id();
		String hgl="FROM Account_SigningProcessBean WHERE account_Sta=:id1 AND inv_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", account_Sta)
				.setParameter("id2", inv_id).setMaxResults(50).list();
		 if(list.size()>0) {
			  return null;
		 }else {
			 this.getSession().save(bean);
			 return bean;
		 }
	}

	@SuppressWarnings("unchecked")
	@Override
	public Account_SigningProcessBean update(Account_SigningProcessBean bean) {
		List<Account_SigningProcessBean> list = null;
		String account_Sta = bean.getAccount_Sta();
		String inv_id = bean.getInv_id();
		String hgl="FROM Account_SigningProcessBean WHERE account_Sta=:id1 AND inv_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", account_Sta)
				.setParameter("id2", inv_id).setMaxResults(50).list();
		 if(list.size()>0) {
			 for(Account_SigningProcessBean getones :list) {
				  getones.setAccount_Manger(getones.getAccount_Manger());
				  getones.setSig_Date(getones.getSig_Date());
				  getones.setSig_Rank(getones.getSig_Rank());
				  getones.setSig_Sta(getones.getSig_Sta());
				  getones.setSig_Sug(getones.getSig_Sug());
			  }
			return bean;
		 }else {
			 return null;
		 }
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String account_Sta, String inv_id) {
		//App_SigningProcessBean temp = this.getSession().get(App_SigningProcessBean.class, id);
				List<Account_SigningProcessBean> list = null;
				Account_SigningProcessBean getone =new Account_SigningProcessBean();
				String hgl="FROM Account_SigningProcessBean WHERE account_Sta=:id1 AND inv_id=:id2";
				list =this.getSession().createQuery(hgl).setParameter("id1", account_Sta)
						.setParameter("id2", inv_id).setMaxResults(50).list();
				 if(list.size()>0) {
					  for(Account_SigningProcessBean getones :list) {
						  getone=getones;
					  }
					  this.getSession().delete(getone);
					  return true;
				 }else {
					 return false;
				 }
	}

}
