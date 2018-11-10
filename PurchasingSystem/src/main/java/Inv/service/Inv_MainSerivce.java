package Inv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Inv.dao.Inv_MainIDao;
import Inv.model.Inv_MainBean;

@Service
//@Transactional
public class Inv_MainSerivce {
@Autowired
private Inv_MainIDao inv_MainIDao;

public Inv_MainBean select(String id) {
	Inv_MainBean bean= inv_MainIDao.select(id);
	if(bean!=null) {
		return bean;
	}
	return null;
}

public List<Inv_MainBean> select() {
	List<Inv_MainBean> bean=inv_MainIDao.select();
	if(bean.size()!=0) {
		return bean;
	}
	return null;
}

public Inv_MainBean insert(Inv_MainBean bean) {
	Inv_MainBean beans= inv_MainIDao.insert(bean);
	if(beans!=null) {
		return beans;
	}
	return null;
}

public Inv_MainBean update(Inv_MainBean bean) {
	Inv_MainBean beans= inv_MainIDao.update(bean);
	if(beans!=null) {
		return beans;
	}
	return null;
}

public boolean delete(String id) {
	boolean beans = inv_MainIDao.delete(id);
	return beans;
}

}
