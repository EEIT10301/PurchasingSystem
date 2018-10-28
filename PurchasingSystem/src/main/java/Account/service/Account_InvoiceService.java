package Account.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Account.dao.Account_InvoiceIDao;
import Account.model.Account_InvoiceBean;

@Service
@Transactional
public class Account_InvoiceService{

	@Autowired
	Account_InvoiceIDao account_InvoiceIDao;
	
	public Account_InvoiceBean select(String id) {
		Account_InvoiceBean beans = account_InvoiceIDao.select(id);
		if(beans !=null) {
			return beans;
		}
		return null;
	}

	public List<Account_InvoiceBean> select() {
		List<Account_InvoiceBean>  beans = account_InvoiceIDao.select();
		if(beans !=null) {
			return beans;
		}
		return null;
	}

	public Account_InvoiceBean insert(Account_InvoiceBean bean) {
		Account_InvoiceBean beans = account_InvoiceIDao.insert(bean);
		if(beans !=null) {
			return beans;
		}
		return null;
	}

	public Account_InvoiceBean update(Account_InvoiceBean bean) {
		Account_InvoiceBean beans = account_InvoiceIDao.update(bean);
		if(beans !=null) {
			return beans;
		}
		return null;
	}

	public boolean delete(String id) {
		boolean beans = account_InvoiceIDao.delete(id);
		
			return beans;
		
	}
	
}
