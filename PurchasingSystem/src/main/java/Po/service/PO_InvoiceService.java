package Po.service;

import java.text.ParseException;
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
import org.springframework.transaction.annotation.Transactional;

import Account.dao.Account_InvoiceIDao;
import Account.model.Account_InvoiceBean;
import Account.model.Account_SigningProcessBean;
import Po.dao.PO_MainIDao;
import Po.dao.PO_SigningProcessIDao;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;
import misc.SpringJavaConfiguration;

@Service
@Transactional
public class PO_InvoiceService {
	@Autowired
	PO_SigningProcessIDao pO_SigningProcessIDao;
	@Autowired
	PO_MainIDao pO_MainIDao;
	
	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		PO_InvoiceService service = context.getBean(PO_InvoiceService.class);
		String date=service.calcExpirePaymentDate("季結");
			System.out.println(date);
		
		}
	
	
	public List<PO_MainBean> find(String emp_id,String sig_sta) {
	List<PO_SigningProcessBean> list = pO_SigningProcessIDao.selectempidsend(emp_id, sig_sta);
	List<PO_MainBean> result=null;
	result=new LinkedList<PO_MainBean>() ;
		if (list!=null) {
			for(PO_SigningProcessBean x: list) {
				PO_MainBean bean = pO_MainIDao.select(x.getPo_id());
				result.add(bean);
			}
			return result;
		}
		return null;
	}
	
	public String calcExpirePaymentDate(String payment_term) {
		
		Date applicationDate = new Date();
		Calendar cal = Calendar.getInstance();
		int payMonth=0;
		int payDate=0;
		cal.setTime(applicationDate);
		if(payment_term=="月結") {
			payMonth = cal.get(Calendar.MONTH)+1;
		}else {
			payMonth = cal.get(Calendar.MONTH)+3;
		}
		cal.set(Calendar.MONTH,payMonth);
		payDate=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH,payDate);
	
		String paymentDate = new SimpleDateFormat("yyyy/MM/dd").format(cal.getTime());
        return paymentDate;
		
	}
	
}
