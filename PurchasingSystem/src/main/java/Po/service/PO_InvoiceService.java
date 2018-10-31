package Po.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		PO_InvoiceService service = context.getBean(PO_InvoiceService.class);
		List<PO_MainBean> result = service.find("emp004", "驗收完成未請款");
		for(PO_MainBean bean:result ) {
			System.out.println(bean.toString());
		}
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	
	
	public  List<PO_MainBean> find(String emp_id,String sig_sta) {
		
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
	
}
