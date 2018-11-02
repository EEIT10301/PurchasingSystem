package Account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Account.dao.Accout_PayableIDao;
import Account.model.Accout_PayableBean;
@Service
//@Transactional
public class Accout_PayableService {
	@Autowired
	Accout_PayableIDao accout_PayableIDao;
	
	public Accout_PayableBean select(String id) {
		Accout_PayableBean beans = accout_PayableIDao.select(id);
         if(beans !=null) {
        	 return beans;
         }
		return null;
	}

	
	public List<Accout_PayableBean> select() {
		List<Accout_PayableBean> beans = accout_PayableIDao.select();
        if(beans !=null) {
       	 return beans;
        }
		return null;
	}

	
	public Accout_PayableBean insert(Accout_PayableBean bean) {
		Accout_PayableBean beans = accout_PayableIDao.insert(bean);
        if(beans !=null) {
       	 return beans;
        }
		return null;
	}

	
	public Accout_PayableBean update(Accout_PayableBean bean) {
		Accout_PayableBean beans = accout_PayableIDao.update(bean);
        if(beans !=null) {
       	 return beans;
        }
		return null;
	}

	
	public boolean delete(String id) {
		boolean beans = accout_PayableIDao.delete(id);
    
       	 return beans;
      
	
	}

}
