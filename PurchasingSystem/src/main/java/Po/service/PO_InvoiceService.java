package Po.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;

import Account.dao.Account_InvoiceIDao;
import Account.dao.Account_SigningProcessIDao;
import Account.dao.impl.Account_SigningProcessDao;
import Account.model.Account_InvoiceBean;
import Account.model.Account_SigningProcessBean;
import Po.dao.PO_MainIDao;
import Po.dao.PO_SigningProcessIDao;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;
import misc.SpringJavaConfiguration;

@Service

public class PO_InvoiceService {
	@Autowired
	PO_SigningProcessIDao pO_SigningProcessIDao;
	@Autowired
	PO_MainIDao pO_MainIDao;
	@Autowired
	Account_InvoiceIDao account_InvoiceIDao;
	@Autowired
	Account_SigningProcessDao account_SigningProcessDao;
	@Autowired
	Account_SigningProcessIDao account_SigningProcessIDao;

	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		PO_InvoiceService service = context.getBean(PO_InvoiceService.class);
		service.insertAccountSigningProcess("Po20181013001", "emp005", "agree");
		sessionFactory.getCurrentSession().getTransaction().commit();
	}

	
	public List<PO_MainBean> find(String emp_id, String sig_sta) {
		List<PO_SigningProcessBean> list = pO_SigningProcessIDao.selectempidsend(emp_id, sig_sta);
		List<PO_MainBean> result = null;
		result = new LinkedList<PO_MainBean>();
		if (list != null) {
			for (PO_SigningProcessBean x : list) {
				PO_MainBean bean = pO_MainIDao.select(x.getPo_id());
				result.add(bean);
			}
			return result;
		}
		return null;
	}
	public List<Account_InvoiceBean> find3(String emp_id, String sig_sta, Integer sig_rank) {
		List<Account_SigningProcessBean> list = account_SigningProcessIDao.select3send(emp_id, sig_sta,sig_rank);
		List<Account_InvoiceBean> result = null;
		result = new LinkedList<Account_InvoiceBean>();
		if (list != null) {
			for (Account_SigningProcessBean x : list) {
				Account_InvoiceBean bean =account_InvoiceIDao.select(x.getInv_id());
				result.add(bean);
			}
			return result;
		}
		return null;
	}
	
	

	public String calcExpirePaymentDate(String payment_term) {
		Date applicationDate = new Date();
		Calendar cal = Calendar.getInstance();
		int payMonth = 0;
		int payDate = 0;
		cal.setTime(applicationDate);
		if (payment_term == "月結") {
			payMonth = cal.get(Calendar.MONTH) + 1;
		} else {
			payMonth = cal.get(Calendar.MONTH) + 3;
		}
		cal.set(Calendar.MONTH, payMonth);
		payDate = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, payDate);
		String paymentDate = new SimpleDateFormat("yyyy/MM/dd").format(cal.getTime());
		return paymentDate;
	}
	
	
	public void updatePoSigningProcess(String po_id,String comment) {
		Date applicationDate = new Date();
		PO_SigningProcessBean bean = pO_SigningProcessIDao.select("請款中", po_id);
		bean.setSig_sta("請款中");
		bean.setSig_date(applicationDate);
		bean.setSig_sug(comment);
	}
	
	
	public void insertAccountSigningProcess(String inv_id,String emp_managerid,String comment) {
		Account_InvoiceBean accBean = account_InvoiceIDao.select(inv_id);
		Account_SigningProcessBean accSignbean = new Account_SigningProcessBean();
		java.util.Set<Account_SigningProcessBean> processList = new java.util.HashSet<>();
		Date today = new Date();
		processList.add(new Account_SigningProcessBean(accBean.getEmp_id(),"採購請款",inv_id,today,"已申請",comment,1));
		processList.add(new Account_SigningProcessBean(emp_managerid, "採購主管審核",inv_id, null, null, "簽核中", 2));
		processList.add(new Account_SigningProcessBean("emp009", "財務經理分派",inv_id, null, null, null, 3));
		processList.add(new Account_SigningProcessBean("emp000", "財務審核",inv_id, null, null, null, 4));
		processList.add(new Account_SigningProcessBean("emp009", "財務經理審核",inv_id, null, null, null, 5));
		
		for(Account_SigningProcessBean bean:processList) {
			account_SigningProcessDao.insert(bean);
		}
	}
	
	
	

}
