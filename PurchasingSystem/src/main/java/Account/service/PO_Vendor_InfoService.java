package Account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Account.dao.PO_Vendor_InfoIDao;
import Account.model.PO_Vendor_InfoBean;

@Service
@Transactional
public class PO_Vendor_InfoService {

	@Autowired
	PO_Vendor_InfoIDao pO_Vendor_InfoIDao;
	
	public PO_Vendor_InfoBean select(String id) {
		PO_Vendor_InfoBean beans = pO_Vendor_InfoIDao.select(id);
		if(beans !=null) {
			return beans;
		}
		return null;
	}

	public List<PO_Vendor_InfoBean> select() {
		List<PO_Vendor_InfoBean>  beans = pO_Vendor_InfoIDao.select();
		if(beans !=null) {
			return beans;
		}
		return null;
	}

	public PO_Vendor_InfoBean insert(PO_Vendor_InfoBean bean) {
		PO_Vendor_InfoBean beans = pO_Vendor_InfoIDao.insert(bean);
		if(beans !=null) {
			return beans;
		}
		return null;
	}

	public PO_Vendor_InfoBean update(PO_Vendor_InfoBean bean) {
		PO_Vendor_InfoBean beans = pO_Vendor_InfoIDao.update(bean);
		if(beans !=null) {
			return beans;
		}
		return null;
	}

	public boolean delete(String id) {
		boolean beans = pO_Vendor_InfoIDao.delete(id);
		
			return beans;
		
	}
}
