package Po.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import Account.model.Account_InvoiceBean;
import Account.model.Account_SigningProcessBean;
import Apply.model.EmployeeBean;
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
	Account_SigningProcessIDao account_SigningProcessIDao;

	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		PO_SigningProcessIDao poSigningDao = context.getBean(PO_SigningProcessIDao.class);
		PO_SigningProcessBean bean = poSigningDao.select("驗收中", "Po20181013001");
		String paymentterm = bean.getpO_MainBean().getpO_Vendor_InfoBean().getPayment_term();
		System.out.println(paymentterm);
		Date date = bean.getSig_date();
		System.out.println(date);
		 PO_InvoiceService service = context.getBean(PO_InvoiceService.class);
		 String paydate = service.calcExpirePaymentDate(paymentterm, date);
		 System.out.println(paydate);
		sessionFactory.getCurrentSession().getTransaction().commit();
		
	}
	

	
	
	
	public  List<PO_MainBean> findNeedApplicationInvoice(String emp_id,String sig_sta) {
		List<PO_SigningProcessBean> list = pO_SigningProcessIDao.selectempidsend(emp_id, sig_sta);
		List<PO_MainBean> result=new ArrayList<>();
			if (list!=null) {
				for(PO_SigningProcessBean x: list) {
					PO_MainBean bean = pO_MainIDao.select(x.getPo_id());
					result.add(bean);
				}
				return result;
			}
			return null;
		}

	public Account_InvoiceBean selectInvoice(String Inv_id) {
		Account_InvoiceBean result = account_InvoiceIDao.select(Inv_id);
		if(result !=null) {
			return result;
		}
		return null;
	}
	
	public PO_SigningProcessBean selectForOneProcessbyPoSign(String po_sta,String po_id) {
		PO_SigningProcessBean process = pO_SigningProcessIDao.select(po_sta, po_id);
		if(process !=null) {
			return process;
		}
		return null;
	}
	
	public Account_SigningProcessBean selectForOneProcessbyAccountSign(String inv_id,Integer sig_Rank) {
		Account_SigningProcessBean process = account_SigningProcessIDao.selectForRank(inv_id, sig_Rank);
		if(process !=null) {
			return process;
		}
		return null;
	}
	
	public List<Account_SigningProcessBean> selectInvidAndRankLower(String inv_id,Integer sig_rank) {
		List<Account_SigningProcessBean> process = account_SigningProcessIDao.selectInvidAndRank(inv_id, sig_rank);
		if(process !=null) {
			return process;
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
	
	
	public void updatePoSigningProcess(String po_id,String comment) {
		Date applicationDate = new Date();
		PO_SigningProcessBean bean = pO_SigningProcessIDao.select("請款中", po_id);
		bean.setSig_sta("請款中");
		bean.setSig_date(applicationDate);
		bean.setSig_sug(comment);
	}
	
	
	public void insertAccountSigningProcess(String inv_id,String emp_id,String emp_managerid,String comment) {
		java.util.Set<Account_SigningProcessBean> processList = new java.util.HashSet<>();
		Date today = new Date();
		processList.add(new Account_SigningProcessBean(emp_id,"採購請款",inv_id,today,"已申請",comment,1));
		processList.add(new Account_SigningProcessBean(emp_managerid, "採購主管審核",inv_id, null,"簽核中",null, 2));
		processList.add(new Account_SigningProcessBean("emp009", "財務經理分派",inv_id, null, null, null, 3));
		processList.add(new Account_SigningProcessBean("emp000", "財務審核",inv_id, null, null, null, 4));
		processList.add(new Account_SigningProcessBean("emp009", "財務經理審核",inv_id, null, null, null, 5));
		
		for(Account_SigningProcessBean bean:processList) {
			account_SigningProcessIDao.insert(bean);
		}
	}
	
	public Account_InvoiceBean updateInvoiceData(Account_InvoiceBean newBean){
		Account_InvoiceBean oldBean = account_InvoiceIDao.select(newBean.getInv_id());
		oldBean.setRecript_date(newBean.getRecript_date());
		Account_InvoiceBean result = account_InvoiceIDao.update(oldBean);
		return result;
	}
	
	public void updateAccountSigningProcess(String inv_id,Integer sig_Rank ,String sig_Sta1, String sig_Sta2,String sig_Sug ) {
		Account_SigningProcessBean bean1 = account_SigningProcessIDao.selectForRank(inv_id, sig_Rank);
		bean1.setSig_Date(new Date());
		bean1.setSig_Sta(sig_Sta1);
		bean1.setSig_Sug(sig_Sug);
		Account_SigningProcessBean result1 = account_SigningProcessIDao.update(bean1);
		Account_SigningProcessBean bean2 = account_SigningProcessIDao.selectForRank(inv_id, sig_Rank+1);
		bean2.setSig_Sta(sig_Sta2);
		Account_SigningProcessBean result2 = account_SigningProcessIDao.update(bean2);
	}
	
	public List<Account_InvoiceBean> findProcessCorrect(String emp_id, String sig_sta, Integer sig_rank) {
		List<Account_SigningProcessBean> list = account_SigningProcessIDao.selectProcess(emp_id, sig_sta,sig_rank);
		List<Account_InvoiceBean> result = new ArrayList<>();
		if (list != null) {
			for (Account_SigningProcessBean x : list) {
				Account_InvoiceBean bean =account_InvoiceIDao.select(x.getInv_id());
				result.add(bean);
			}
			return result;
		}
		return null;
	}
	
//	public List<Account_InvoiceBean> find3(String emp_id, String sig_sta, Integer sig_rank) {
//		List<Account_SigningProcessBean> list = account_SigningProcessIDao.selectProcess(emp_id, sig_sta,sig_rank);
//		List<Account_InvoiceBean> result = null;
//		result = new LinkedList<Account_InvoiceBean>();
//		if (list != null) {
//			for (Account_SigningProcessBean x : list) {
//				Account_InvoiceBean bean =account_InvoiceIDao.select(x.getInv_id());
//				result.add(bean);
//			}
//			return result;
//		}
//		return null;
//	}
//	
	public List<Account_InvoiceBean> findTodoSignInv(String emp_id, String sig_sta, Integer sig_rank) {
		List<Account_SigningProcessBean> list = account_SigningProcessIDao.selectTodoSignInvoice(emp_id, sig_sta, sig_rank);
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
	

}
