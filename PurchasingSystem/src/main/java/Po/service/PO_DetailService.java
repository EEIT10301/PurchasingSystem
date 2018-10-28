package Po.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Po.dao.PO_DetailIDao;
import Po.model.PO_DetailBean;

@Service
@Transactional
public class PO_DetailService {
	@Autowired
	PO_DetailIDao pO_DetailIDao;
	
	public  PO_DetailBean select(String po_id,String part_No) {
		PO_DetailBean beans=pO_DetailIDao.select(po_id, part_No);
		if (beans !=null) {
			return beans;
		}
		return null;
	}

	public  List<PO_DetailBean> select(){
		 List<PO_DetailBean> beans=pO_DetailIDao.select();
		if (beans !=null) {
			return beans;
		}
		return null;
	}

	public  PO_DetailBean insert(PO_DetailBean bean) {
		PO_DetailBean beans=pO_DetailIDao.insert(bean);
		if (beans !=null) {
			return beans;
		}
		return null;
	}

	public  PO_DetailBean update(PO_DetailBean bean) {
		PO_DetailBean beans=pO_DetailIDao.update(bean);
		if (beans !=null) {
			return beans;
		}
		return null;
	}

	public  boolean delete(String po_id,String part_No) {
		boolean beans=pO_DetailIDao.delete(po_id, part_No);
			return beans;
	}
}
