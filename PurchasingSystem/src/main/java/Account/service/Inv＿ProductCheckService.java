package Account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Account.dao.Inv＿ProductCheckIDao;
import Account.model.Accout_PayableBean;
import Account.model.Inv＿ProductCheckBean;

@Service
@Transactional
public class Inv＿ProductCheckService {
	@Autowired
	Inv＿ProductCheckIDao inv＿ProductCheckIDao;
	
	public Inv＿ProductCheckBean select(String id) {
		Inv＿ProductCheckBean beans = inv＿ProductCheckIDao.select(id);
         if(beans !=null) {
        	 return beans;
         }
		return null;
	}

	
	public List<Inv＿ProductCheckBean> select() {
		List<Inv＿ProductCheckBean> beans = inv＿ProductCheckIDao.select();
        if(beans !=null) {
       	 return beans;
        }
		return null;
	}

	
	public Inv＿ProductCheckBean insert(Inv＿ProductCheckBean bean) {
		Inv＿ProductCheckBean beans = inv＿ProductCheckIDao.insert(bean);
        if(beans !=null) {
       	 return beans;
        }
		return null;
	}

	
	public Inv＿ProductCheckBean update(Inv＿ProductCheckBean bean) {
		Inv＿ProductCheckBean beans = inv＿ProductCheckIDao.update(bean);
        if(beans !=null) {
       	 return beans;
        }
		return null;
	}

	
	public boolean delete(String id) {
		boolean beans = inv＿ProductCheckIDao.delete(id);
    
       	 return beans;
      
	
	}
}
