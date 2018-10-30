package Inv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Account.model.Account_SigningProcessBean;
import Inv.dao.Inv_SigningProcessIDao;
import Inv.model.Inv_SigningProcessBean;

@Service
@Transactional
public class Inv_SigningProcessService {
@Autowired
Inv_SigningProcessIDao inv_SigningProcessIDao;

public Inv_SigningProcessBean select(String inv_Sta, String chk_Id) {
	Inv_SigningProcessBean bean =inv_SigningProcessIDao.select(inv_Sta,chk_Id);
	if(bean!=null) {
		return bean;
	}
	return null;
}

public List<Inv_SigningProcessBean> select() {
	List<Inv_SigningProcessBean> bean =inv_SigningProcessIDao.select();
	if(bean!=null) {
		return bean;
	}
	return null;
}

public Inv_SigningProcessBean insert(Inv_SigningProcessBean bean) {
	Inv_SigningProcessBean beans = inv_SigningProcessIDao.insert(bean);
	if(beans!=null) {
		return beans;
	}
	return null;
}

public Inv_SigningProcessBean update(Inv_SigningProcessBean bean) {
	Inv_SigningProcessBean beans = inv_SigningProcessIDao.update(bean);
	if(beans!=null) {
		return beans;
	}
	return null;
}

public boolean delete(String inv_Sta, String chk_Id) {
	boolean beans = inv_SigningProcessIDao.delete(inv_Sta,chk_Id);
	return beans;
}

}
