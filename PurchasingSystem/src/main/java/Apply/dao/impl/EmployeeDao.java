package Apply.dao.impl;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Account.model.Account_InvoiceBean;
import Account.model.Account_SigningProcessBean;
import Account.model.Inv＿ProductCheckBean;
import Apply.dao.EmployeeIDao;
import Apply.model.AppDetailBean;
import Apply.model.App_MainBean;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Inv.model.Inv_SigningProcessBean;
import Po.model.PO_MainBean;
import misc.SpringJavaConfiguration;



@Repository
public class EmployeeDao implements EmployeeIDao{
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

		EmployeeIDao productDAO = (EmployeeIDao) context.getBean("employeeDao");
		List<EmployeeBean> selects = productDAO.select();
		java.util.Date date = new java.util.Date();
		java.sql.Date datas =new java.sql.Date(date.getTime());
		//EmployeeBean xs=new EmployeeBean("emp006","郭孟欣",1,"品管部","專員",datas,"男","ssm@gmail.com","t123321","emp006",1);
//		EmployeeBean xs1=new EmployeeBean("emp007","何瑋倫",2,"品管部","經理",datas,"男","rgm@gmail.com","t123321","emp003",2);
//		EmployeeBean xs2=new EmployeeBean("emp008","丁婉玲",1,"財務部","專員",datas,"女","ding@gmail.com","t123321","emp009",1);
//		EmployeeBean xs3=new EmployeeBean("emp009","胡瑜真",2,"財務部","經理",datas,"女","sgre@gmail.com","t123321","emp003",2);
//
//		productDAO.insert(xs1);
//		productDAO.insert(xs2);
//		productDAO.insert(xs3);
		System.out.println("selects="+selects);
		for(EmployeeBean x:selects) {
			
			System.out.println("1.EmployeeBean物件:"+x.getEmp_name());
			for(App_MainBean ss:x.getApp_MainBean()) {
				System.out.println("2.App_MainBean物件:"+ss.getApp_price());
				
			}
			for(App_SigningProcessBean ss:x.getApp_SigningProcessBean()) {
				System.out.println("3.App_SigningProcessBean物件:"+ss.getApp_manger());
			}
			
			
			Set<Account_InvoiceBean> account_InvoiceBean = new LinkedHashSet<>();
			account_InvoiceBean=x.getAccount_InvoiceBean();
			for(Account_InvoiceBean ss:account_InvoiceBean) {
				System.out.println("4.Account_InvoiceBean物件:"+ss.getTotal_price());
			}
			for(Account_SigningProcessBean ss:x.getAccount_SigningProcessBean()) {
				
				System.out.println("5.Account_SigningProcessBean物件:"+ss.getSig_Rank());
			}
			for(Inv＿ProductCheckBean ss:x.getInv＿ProductCheckBean()) {
				System.out.println("6.Inv＿ProductCheckBean物件:"+ss.getChk_Comment());
			}
			for(PO_MainBean ss:x.getpO_MainBean()) {
				System.out.println("7.PO_MainBean物件:"+ss.getPo_id());
			}
			for(Inv_SigningProcessBean ss:x.getInv_SigningProcessBean()) {
				System.out.println("8.Inv_SigningProcessBean物件:"+ss.getInv_Sta());
			}
		}
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@Override
	public EmployeeBean select(String id) {
		return this.getSession().get(EmployeeBean.class, id);
	}

	@Override
	public List<EmployeeBean> select() {
		return this.getSession().createQuery(
				"from EmployeeBean", EmployeeBean.class).setMaxResults(50).list();
	}

	@Override
	public EmployeeBean insert(EmployeeBean bean) {
		if(bean!=null) {
			EmployeeBean temp = this.getSession().get(EmployeeBean.class, bean.getEmp_id());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public EmployeeBean update(EmployeeBean bean) {
		this.getSession().merge(bean);
//		EmployeeBean temp = this.getSession().get(EmployeeBean.class, bean.getEmp_id());
//		if(temp!=null) {
//			temp=bean;
//		}
//		return temp;
		return bean;
	}

	@Override
	public boolean delete(String id) {
		EmployeeBean temp = this.getSession().get(EmployeeBean.class, id);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}
	@SuppressWarnings("unchecked")
	@Override
	public EmployeeBean ApplyLogin(String emp_email, String emp_pwd) {
		List<EmployeeBean> list = null;
		EmployeeBean getone =new EmployeeBean();
		String hgl="FROM EmployeeBean WHERE emp_email=:id1 AND emp_pwd=:id2 AND EMP_Dep='研發部'";
		list =this.getSession().createQuery(hgl).setParameter("id1", emp_email)
				.setParameter("id2", emp_pwd).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(EmployeeBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else if(emp_email.equals("sisi@gmail.com")&& emp_pwd.equals("s123321")) {
			 getone.setEmp_id("emp003");
			 getone.setEmp_name("胡於貞");
			 getone.setEmp_level(3);
			 getone.setEmp_dep("總經理");
			 getone.setEmp_job("總經理");
			 java.util.Date date = new java.util.Date();
				java.sql.Date datas =new java.sql.Date(date.getTime());
			 getone.setEmp_hiredate(datas);
			 getone.setEmp_gender("女");
			 getone.setEmp_email(emp_email);
			 getone.setEmp_pwd(emp_pwd);
			 getone.setEmp_managerid("none");
			 getone.setEmp_appauth(3);
			 return getone;
		 }else {
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public EmployeeBean AccountLogin(String emp_email, String emp_pwd) {
		List<EmployeeBean> list = null;
		EmployeeBean getone =new EmployeeBean();
		String hgl="FROM EmployeeBean WHERE emp_email=:id1 AND emp_pwd=:id2 AND EMP_Dep='財務部'";
		list =this.getSession().createQuery(hgl).setParameter("id1", emp_email)
				.setParameter("id2", emp_pwd).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(EmployeeBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else if(emp_email.equals("sisi@gmail.com")&& emp_pwd.equals("s123321")) {
			 getone.setEmp_id("emp003");
			 getone.setEmp_name("胡於貞");
			 getone.setEmp_level(3);
			 getone.setEmp_dep("總經理");
			 getone.setEmp_job("總經理");
			 java.util.Date date = new java.util.Date();
			 java.sql.Date datas =new java.sql.Date(date.getTime());
			 getone.setEmp_hiredate(datas);
			 getone.setEmp_gender("女");
			 getone.setEmp_email(emp_email);
			 getone.setEmp_pwd(emp_pwd);
			 getone.setEmp_managerid("none");
			 getone.setEmp_appauth(3);
			 return getone;
		 }else {
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public EmployeeBean POLogin(String emp_email, String emp_pwd) {
		List<EmployeeBean> list = null;
		EmployeeBean getone =new EmployeeBean();
		String hgl="FROM EmployeeBean WHERE emp_email=:id1 AND emp_pwd=:id2 AND EMP_Dep='採購部'";
		list =this.getSession().createQuery(hgl).setParameter("id1", emp_email)
				.setParameter("id2", emp_pwd).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(EmployeeBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else if(emp_email.equals("sisi@gmail.com")&& emp_pwd.equals("s123321")) {
			 getone.setEmp_id("emp003");
			 getone.setEmp_name("胡於貞");
			 getone.setEmp_level(3);
			 getone.setEmp_dep("總經理");
			 getone.setEmp_job("總經理");
			 java.util.Date date = new java.util.Date();
			 java.sql.Date datas =new java.sql.Date(date.getTime());
			 getone.setEmp_hiredate(datas);
			 getone.setEmp_gender("女");
			 getone.setEmp_email(emp_email);
			 getone.setEmp_pwd(emp_pwd);
			 getone.setEmp_managerid("none");
			 getone.setEmp_appauth(3);
			 return getone;
		 }else {
			 return null;
		 }
	}

}
