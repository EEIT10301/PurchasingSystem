package Po.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Po.dao.PO_MainIDao;
import Po.model.PO_MainBean;

@Service
@Transactional
public class PO_MainService {
	@Autowired
	PO_MainIDao pO_MainIDao;
	public  PO_MainBean select(String po_id) {
		PO_MainBean beans=pO_MainIDao.select(po_id);
		if (beans!=null) {
			
			return beans;
		}
		return null;
	}

	public  List<PO_MainBean> select(){
		 List<PO_MainBean> beans =pO_MainIDao.select();
		 if (beans!=null) {
				
				return beans;
			}
			return null;
	}

	public  PO_MainBean insert(PO_MainBean bean) {
		PO_MainBean beans =pO_MainIDao.insert(bean);
		 if (beans!=null) {
				
				return beans;
			}
			return null;
	}

	public  PO_MainBean update(PO_MainBean bean) {
		PO_MainBean beans =pO_MainIDao.update(bean);
		 if (beans!=null) {
				
				return beans;
			}
			return null;
	}

	public  boolean delete(String po_id) {
		boolean beans =pO_MainIDao.delete(po_id);
		
				return beans;
			
	}
}
