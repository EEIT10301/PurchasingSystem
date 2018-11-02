package Po.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Po.dao.PO_QueryIDao;
import Po.model.PO_QueryBean;
@Service
//@Transactional
public class PO_QueryService {
    @Autowired
    PO_QueryIDao pO_QueryIDao;

	public PO_QueryBean select(String po_id, String vendor_ID) {
		PO_QueryBean beans =pO_QueryIDao.select(po_id, vendor_ID);
		if(beans!=null) {
			return beans;
		}
		// TODO Auto-generated method stub
		return null;
	}

	
	public List<PO_QueryBean> select() {
		List<PO_QueryBean> beans=pO_QueryIDao.select();
		if(beans!=null) {
			return beans;
		}
		return null;
	}


	public PO_QueryBean insert(PO_QueryBean bean) {
		PO_QueryBean beans=pO_QueryIDao.insert(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}


	public PO_QueryBean update(PO_QueryBean bean) {
		PO_QueryBean beans=pO_QueryIDao.update(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}


	public boolean delete(String po_id, String vendor_ID) {
		boolean beans =pO_QueryIDao.delete(po_id, vendor_ID);
		
			return beans;
		
	}

}
