package Inv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Account.dao.Inv＿ProductCheckIDao;
import Account.dao.impl.Inv＿ProductCheckDao;
import Account.model.Inv＿ProductCheckBean;
import Apply.dao.ProductListIDAO;
import Apply.model.ProductListBean;
import Inv.model.Inv_DetailBean;

@Service
@Transactional
public class AdditemServie {
	@Autowired
	Inv＿ProductCheckDao inv＿ProductCheckDao;
	@Autowired
	ProductListIDAO productListIDAO;

	public ProductListBean ItemAdd(String id) {

		ProductListBean bean = productListIDAO.select(id);
		if (bean != null) {
			return bean;
		}
		return null;
	}

	public Inv＿ProductCheckBean select(String id) {
		Inv＿ProductCheckBean beans = inv＿ProductCheckDao.select(id);
		if (beans != null) {
			return beans;
		}
		return null;
	}
	public  List<Inv＿ProductCheckBean> select() {
		 List<Inv＿ProductCheckBean> bean = inv＿ProductCheckDao.select();
		
		if(bean!=null) {
			return bean;
		}
		return null;
	}

}
