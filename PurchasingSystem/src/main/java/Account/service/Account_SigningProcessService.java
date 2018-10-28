package Account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Account.dao.Account_SigningProcessIDao;
import Account.model.Account_SigningProcessBean;


@Service
@Transactional
public class Account_SigningProcessService {
	@Autowired
	Account_SigningProcessIDao account_SigningProcessIDao;
	
	public  Account_SigningProcessBean select(String account_Sta,String inv_id) {
		Account_SigningProcessBean bean =account_SigningProcessIDao.select(account_Sta,inv_id);
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public  List<Account_SigningProcessBean> select(){
		List<Account_SigningProcessBean> bean =account_SigningProcessIDao.select();
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public  Account_SigningProcessBean insert(Account_SigningProcessBean bean) {
		Account_SigningProcessBean beans = account_SigningProcessIDao.insert(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	
	public  Account_SigningProcessBean update(Account_SigningProcessBean bean) {
		Account_SigningProcessBean beans = account_SigningProcessIDao.update(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  boolean delete(String account_Sta,String inv_id) {
		boolean beans = account_SigningProcessIDao.delete(account_Sta,inv_id);
		return beans;
		
	}	
	
}
