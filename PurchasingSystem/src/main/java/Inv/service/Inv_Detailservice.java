package Inv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Apply.model.AppDetailBean;
import Inv.dao.impl.Inv_DetailDao;
import Inv.model.Inv_DetailBean;

@Service
@Transactional
public class Inv_Detailservice {
	@Autowired
	Inv_DetailDao inv_DetailDao;
	public List<Inv_DetailBean> find() {
		List<Inv_DetailBean> bean =inv_DetailDao.select();
		
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public  Inv_DetailBean select(String Inv_Part_no, String Inv__Date) {
		Inv_DetailBean bean =inv_DetailDao.select(Inv_Part_no, Inv__Date);
		if(bean!=null) {
			return bean;
		}
		return null;
	}
}
