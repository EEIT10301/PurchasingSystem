package Account.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Account.dao.Account_InvoiceIDao;
import Account.dao.Accout_PayableIDao;
import Account.model.Account_InvoiceBean;
import Account.model.Accout_PayableBean;
import misc.SpringJavaConfiguration;

@Repository
public class Accout_PayableDao implements Accout_PayableIDao {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	public static void main(String[] args) throws ParseException {
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);

		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
//		----test:select()----- 	
//		Accout_PayableIDao productDAO = (Accout_PayableIDao) context.getBean("accout_PayableDao");
//		List<Accout_PayableBean> selects = productDAO.select();
//		System.out.println("selects="+selects);
//		for(Accout_PayableBean x:selects) {
//			System.out.println("1.Accout_PayableBean物件:"+x.getInv_id());
//          System.out.println("2.EmployeeBean物件:"+x.getAccount_InvoiceBean().getEmployeeBean().getEmp_hiredate());
//			System.out.println("3.Inv＿ProductCheckBean物件:"+x.getInv＿ProductCheckBean().getChk_Id());
//		}
//		-----test:select(String id)-----	
//		Accout_PayableIDao dao = context.getBean(Accout_PayableDao.class);
//		Accout_PayableBean bean = dao.select("Ac20181024001");
//		System.out.println(bean.toString());

//		-----test:insert()-----	
//		Accout_PayableIDao apdao = context.getBean(Accout_PayableDao.class);
//		Accout_PayableBean apvo = new Accout_PayableBean();
//		Inv＿ProductCheckBean ipvo = new Inv＿ProductCheckBean();
//		Inv＿ProductCheckIDao ipdao = context.getBean(Inv＿ProductCheckDao.class);
//		Date today = new Date();
//		ipvo.setChk_Id("Ck20181025001");
//		ipvo.setPo_ID("Po20181025001");
//		ipvo.setEmp_ID("emp006");
//		ipvo.setChk_Money(50000);
//		ipvo.setChk_Comment("test");
//		ipvo.setTotal_price(50000);
//		ipvo.setVender_ID("ven003");
//		ipdao.insert(ipvo);
//		apvo.setAccoutpayable_no("Ac20181025001");
//		apvo.setChk_Id(ipvo.getChk_Id());
//		apvo.setAmount_Payable(ipvo.getChk_Money());
//		apvo.setBooking_Date(today);
//		Accout_PayableBean bean = apdao.insert(apvo);
//		System.out.println(bean.toString());

//		-----test:update()-----	
		Accout_PayableIDao apdao = context.getBean(Accout_PayableDao.class);
		Accout_PayableBean apvo = null;
		Account_InvoiceIDao aidao = context.getBean(Account_InvoiceDao.class);
		Account_InvoiceBean aivo = new Account_InvoiceBean();
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date payment_date = dateFormat.parse("2018-11-25");
		aivo.setInv_id("In20181025001");
		aivo.setPo_id("Po20181025001");
		aivo.setRecript_date(today);
		aivo.setRecript_pic("1025invoice");
		aivo.setEmp_id("emp008");
		aivo.setTotal_price(50000);
		aidao.insert(aivo);
		apvo = apdao.select("Ac20181025001");
		apvo.setExcept_Payment_Date(payment_date);
		apvo.setPayable_Status("尚未付款");
		apvo.setInv_id(aivo.getInv_id());
		apvo.setAmount_Paid(0);
		Accout_PayableBean bean = apdao.update(apvo);
		System.out.println(bean.toString());

//		-----test:delete()-----			
//		Accout_PayableIDao apdao = context.getBean(Accout_PayableDao.class);
//		boolean result = apdao.delete("Ac20181025001");
//		if(result==true) {
//			System.out.println("已刪除完成");
//		}else {
//			System.out.println("刪除失敗");
//		}
		sessionFactory.getCurrentSession().getTransaction().commit();
	}

	@Override
	public Accout_PayableBean select(String id) {
		return this.getSession().get(Accout_PayableBean.class, id);
	}

	@Override
	public List<Accout_PayableBean> select() {
		return this.getSession().createQuery("from Accout_PayableBean", Accout_PayableBean.class).setMaxResults(50)
				.list();
	}

	@Override
	public Accout_PayableBean insert(Accout_PayableBean bean) {
		if (bean != null) {
			Accout_PayableBean temp = this.getSession().get(Accout_PayableBean.class, bean.getAccoutpayable_no());
			if (temp == null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public Accout_PayableBean update(Accout_PayableBean bean) {
		this.getSession().merge(bean);
		return bean;
//		Accout_PayableBean temp = this.getSession().get(Accout_PayableBean.class, bean.getAccoutpayable_no());
//		if(temp!=null) {
//			temp=bean;
//		}
//		return temp;
	}

	@Override
	public boolean delete(String id) {
		Accout_PayableBean temp = this.getSession().get(Accout_PayableBean.class, id);
		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

}
