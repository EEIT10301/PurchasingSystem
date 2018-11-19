package Inv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Inv.dao.Inv_DetailIDao;
import Inv.model.Inv_DetailBean;

@Service
//@Transactional
public class Inv_DetailService {
@Autowired
private Inv_DetailIDao inv_DetailIDao;

public List<Inv_DetailBean> selectnv_Part_no(String Inv_Part_no) {
	List<Inv_DetailBean> bean=inv_DetailIDao.selectnv_Part_no(Inv_Part_no);
	if(bean.size()!=0) {
		return bean;
	}
	return null;
}

public Inv_DetailBean select(String Inv_Part_no, String Inv__Date) {
	Inv_DetailBean bean= inv_DetailIDao.select(Inv_Part_no, Inv__Date);
	if(bean!=null) {
		return bean;
	}
	return null;
}

public List<Inv_DetailBean> selectall() {
	List<Inv_DetailBean> bean=inv_DetailIDao.selectall();
	if(bean.size()!=0) {
		return bean;
	}
	return null;
}

public Inv_DetailBean insert(Inv_DetailBean bean) {
	Inv_DetailBean beans= inv_DetailIDao.insert(bean);
	if(beans!=null) {
		return beans;
	}
	return null;
}

public Inv_DetailBean update(Inv_DetailBean bean) {
	Inv_DetailBean beans= inv_DetailIDao.update(bean);
	if(beans!=null) {
		return beans;
	}
	return null;
}

public boolean delete(String Inv_Part_no, String Inv__Date) {
	boolean beans = inv_DetailIDao.delete(Inv_Part_no,Inv__Date);
	return beans;
}
public List<Inv_DetailBean> selectnv_Part_notest(String Inv_Part_no) {
	List<Inv_DetailBean> bean=inv_DetailIDao.selectnv_Part_notest(Inv_Part_no);
	if(bean.size()!=0) {
		return bean;
	}
	return null;
}
}
