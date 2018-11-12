package Inv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Account.dao.Inv_ProductListIDao;
import Account.dao.Inv＿ProductCheckIDao;
import Account.dao.impl.Inv＿ProductCheckDao;
import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Account.service.Inv_ProductListService;
import Apply.dao.ProductListIDAO;
import Apply.model.App_MainBean;
import Apply.model.ProductListBean;
import Inv.model.Inv_DetailBean;

@Service
@Transactional
public class AdditemServie {
	@Autowired
	Inv_ProductListIDao inv_ProductListIDao;
	@Autowired
	Inv_ProductListService inv_ProductListService;
	@Autowired
	Inv＿ProductCheckDao inv＿ProductCheckDao;
	@Autowired
	ProductListIDAO productListIDAO;

	public ProductListBean ItemAdd(String id) {
		inv_ProductListService.select();
		ProductListBean bean = productListIDAO.select(id);
		if (bean != null) {
			return bean;
		}
		return null;
	}
		
	public Inv＿ProductCheckBean selectCheck(String id) {
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
	

	
	//新增new
	public List<Inv_ProductListBean> ViewAddCheckDetail(String chk_Id) {
		List<Inv_ProductListBean> beans = inv_ProductListIDao.ViewAddCheckDetail(chk_Id);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	//新增new
	public List<Inv_ProductListBean> selectCount(String chk_Id) {
		 List<Inv_ProductListBean> beans = inv_ProductListIDao.select(chk_Id);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  Inv_ProductListBean update(Inv_ProductListBean bean) {
		Inv_ProductListBean beans = inv_ProductListIDao.update(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}

}
