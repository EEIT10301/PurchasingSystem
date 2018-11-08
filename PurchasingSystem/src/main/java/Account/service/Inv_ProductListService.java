package Account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Account.dao.Inv_ProductListIDao;
import Account.dao.impl.Inv_ProductListDao;
import Account.model.Inv_ProductListBean;
@Service
//@Transactional
public class Inv_ProductListService  {
	@Autowired
	Inv_ProductListIDao inv_ProductListIDao;
	@Autowired
	Inv_ProductListDao dd;
	
	

	
	public Inv_ProductListBean select(String chk_Id, String part_No) {
		Inv_ProductListBean beans =inv_ProductListIDao.select(chk_Id, part_No);
		if(beans!=null) {
			return beans;
		}
		return null;
	}

	
	public List<Inv_ProductListBean> select() {
		List<Inv_ProductListBean>  beans =inv_ProductListIDao.select();
		if(beans!=null) {
			return beans;
		}
		return null;
	}

	
	public Inv_ProductListBean insert(Inv_ProductListBean bean) {
		Inv_ProductListBean beans =inv_ProductListIDao.insert(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}

	
	public Inv_ProductListBean update(Inv_ProductListBean bean) {
		Inv_ProductListBean beans =inv_ProductListIDao.update(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}

	
	public boolean delete(String chk_Id, String part_No) {
		boolean beans =inv_ProductListIDao.delete(chk_Id, part_No);
		
			return beans;
	
	}

}
