package Apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Apply.dao.App_MainIDao;
import Apply.model.App_MainBean;


@Service
@Transactional
public class App_MainService {
	@Autowired
	App_MainIDao app_MainIDao;
	public  App_MainBean select(String id) {
		App_MainBean bean =app_MainIDao.select(id);
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public  List<App_MainBean> select(){
		List<App_MainBean> bean =app_MainIDao.select();
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public  App_MainBean insert(App_MainBean bean) {
		App_MainBean beans = app_MainIDao.insert(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	
	public  App_MainBean update(App_MainBean bean) {
		App_MainBean beans = app_MainIDao.update(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  boolean delete(String id) {
		boolean beans = app_MainIDao.delete(id);
		return beans;
		
	}
	public  App_MainBean lastid() {
		App_MainBean beans = app_MainIDao.lastid();
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  List<App_MainBean> selectempid(String emp_id) {
		List<App_MainBean> beans = app_MainIDao.selectempid(emp_id);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
}
