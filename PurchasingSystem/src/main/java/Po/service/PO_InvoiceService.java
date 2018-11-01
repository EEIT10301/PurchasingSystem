package Po.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Po.dao.PO_MainIDao;
import Po.dao.PO_SigningProcessIDao;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;

@Service
@Transactional
public class PO_InvoiceService {
	@Autowired
	PO_SigningProcessIDao pO_SigningProcessIDao;
	@Autowired
	PO_MainIDao pO_MainIDao;
	
	public  List<PO_MainBean> find(String emp_id,String sig_sta) {
		
	List<PO_SigningProcessBean> list = pO_SigningProcessIDao.selectempidsend(emp_id, sig_sta);
	List<PO_MainBean> result=null;
		if (list!=null) {
			for(PO_SigningProcessBean x: list) {
				PO_MainBean bean = pO_MainIDao.select(x.getPo_id());
				result=new LinkedList<PO_MainBean>() ;
				result.add(bean);
			}
			return result;
		}
		return null;
	}
	
}
