package Account.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;


import Account.dao.Account_InvoiceIDao;
import Account.dao.Accout_PayableIDao;
import Account.dao.Inv＿ProductCheckIDao;
import Account.dao.impl.Accout_PayableDao;
import Account.dao.impl.Inv＿ProductCheckDao;
import Account.model.Account_InvoiceBean;
import Account.model.Accout_PayableBean;
import Account.model.Inv＿ProductCheckBean;
import Po.dao.PO_SigningProcessIDao;
import misc.SpringJavaConfiguration;

@Service
//@Transactional
public class Accout_PayableService {
	@Autowired
	Accout_PayableIDao accout_PayableIDao;
	@Autowired
	Inv＿ProductCheckIDao inv_ProductCheckIDao;
	@Autowired
	Account_InvoiceIDao account_InvoiceIDao;
	@Autowired
	PO_SigningProcessIDao pO_SigningProcessIDao;
	
	public static void main(String[] args) throws ParseException {
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		Accout_PayableService bean = context.getBean(Accout_PayableService.class);
		//Accout_PayableBean result = bean.createAccountPayable("Ck20181013001");
		Accout_PayableBean result = bean.updateAccountPayable("In20181013001");
		System.out.println(result.toString());
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	
	public Accout_PayableBean createAccountPayable(String chk_id) {
		String ap_id = "Ap"+chk_id.substring(2);
		Inv＿ProductCheckBean chkbean = inv_ProductCheckIDao.select(chk_id);
		Accout_PayableBean bean=new Accout_PayableBean();
		bean.setAccoutpayable_no(ap_id);
		bean.setVendor_ID(chkbean.getVender_ID());
		bean.setAmount_Payable(chkbean.getTotal_price());
		bean.setBooking_Date(new Date());
		bean.setInv_id(chkbean.getpO_MainBean().getAccount_InvoiceBean().getInv_id());
		bean.setChk_Id(chk_id);
		Accout_PayableBean result = accout_PayableIDao.insert(bean);
		 if(bean !=null) {
	       	 return bean;
	        }
			return null;
	}
	
	public Accout_PayableBean updateAccountPayable(String inv_id) throws ParseException {
		Account_InvoiceBean invBean = account_InvoiceIDao.select(inv_id);
		Accout_PayableBean accBean = invBean.getAccout_PayableBean();
		System.out.println(accBean.toString());
		String payment_term=invBean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term();
		Date applicationDate = pO_SigningProcessIDao.select("驗收中",invBean.getpO_MainBean().getPo_id()).getSig_date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = sdf.parse(calcExpirePaymentDate(payment_term,applicationDate));
		accBean.setCheque_no("尚未開票");
		accBean.setExcept_Payment_Date(date);
		accBean.setPayable_Status("尚未付款");
		accBean.setAmount_Paid(0);
		Accout_PayableBean result = accout_PayableIDao.update(accBean);
		 if(result !=null) {
	       	 return result;
	        }
			return null;
	}
	
	
	public String calcExpirePaymentDate(String payment_term,Date applicationDate ) {
		Calendar cal = Calendar.getInstance();
		int payMonth = 0;
		int payDate = 0;
		cal.setTime(applicationDate);
		String term="月結";
		if (payment_term.equals(term)) {
			cal.add(Calendar.MONTH,1);
		} else {
			cal.add(Calendar.MONTH,3);
		}
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		String paymentDate = new SimpleDateFormat("yyyy/MM/dd").format(cal.getTime());
		return paymentDate;
	}
	
	
	
	public Accout_PayableBean select(String id) {
		Accout_PayableBean beans = accout_PayableIDao.select(id);
         if(beans !=null) {
        	 return beans;
         }
		return null;
	}

	
	public List<Accout_PayableBean> select() {
		List<Accout_PayableBean> beans = accout_PayableIDao.select();
        if(beans !=null) {
       	 return beans;
        }
		return null;
	}

	
	public Accout_PayableBean insert(Accout_PayableBean bean) {
		Accout_PayableBean beans = accout_PayableIDao.insert(bean);
        if(beans !=null) {
       	 return beans;
        }
		return null;
	}

	
	public Accout_PayableBean update(Accout_PayableBean bean) {
		Accout_PayableBean beans = accout_PayableIDao.update(bean);
        if(beans !=null) {
       	 return beans;
        }
		return null;
	}

	
	public boolean delete(String id) {
		boolean beans = accout_PayableIDao.delete(id);
    
       	 return beans;
      
	
	}

}
