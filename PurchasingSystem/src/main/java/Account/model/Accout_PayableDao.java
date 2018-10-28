package Account.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import misc.SpringJavaConfiguration;

@Repository
public class Accout_PayableDao implements Accout_PayableIDao{
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

		Accout_PayableIDao productDAO = (Accout_PayableIDao) context.getBean("accout_PayableDao");
		List<Accout_PayableBean> selects = productDAO.select();
		System.out.println("selects="+selects);
		for(Accout_PayableBean x:selects) {
			
			System.out.println("1.Accout_PayableBean物件:"+x.getInv_id());
          System.out.println("2.EmployeeBean物件:"+x.getAccount_InvoiceBean().getEmployeeBean().getEmp_hiredate());
			System.out.println("3.Inv＿ProductCheckBean物件:"+x.getInv＿ProductCheckBean().getChk_Id());
		}
		
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	
	@Override
	public Accout_PayableBean select(String id) {
		return this.getSession().get(Accout_PayableBean.class, id);
	}

	@Override
	public List<Accout_PayableBean> select() {
		return this.getSession().createQuery(
				"from Accout_PayableBean", Accout_PayableBean.class).setMaxResults(50).list();
	}

	@Override
	public Accout_PayableBean insert(Accout_PayableBean bean) {
		if(bean!=null) {
			Accout_PayableBean temp = this.getSession().get(Accout_PayableBean.class, bean.getAccoutpayable_no());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public Accout_PayableBean update(Accout_PayableBean bean) {
		this.getSession().merge(bean);
		return 	bean;
//		Accout_PayableBean temp = this.getSession().get(Accout_PayableBean.class, bean.getAccoutpayable_no());
//		if(temp!=null) {
//			temp=bean;
//		}
//		return temp;
	}

	@Override
	public boolean delete(String id) {
		Accout_PayableBean temp = this.getSession().get(Accout_PayableBean.class, id);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

}
