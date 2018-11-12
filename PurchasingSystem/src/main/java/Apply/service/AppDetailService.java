package Apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Apply.dao.AppDetailIDao;
import Apply.model.AppDetailBean;

@Service
//@Transactional
public class AppDetailService {
	@Autowired
	AppDetailIDao appDetailIDao;
	public  AppDetailBean select(String app_id,String part_no) {
		AppDetailBean bean =appDetailIDao.select(app_id,part_no);
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public  List<AppDetailBean> select(){
		List<AppDetailBean> bean =appDetailIDao.select();
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public  AppDetailBean insert(AppDetailBean bean) {
		AppDetailBean beans = appDetailIDao.insert(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  AppDetailBean update(AppDetailBean bean) {
		AppDetailBean beans = appDetailIDao.update(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  boolean delete(String app_id,String part_no) {
		boolean beans = appDetailIDao.delete(app_id,part_no);
		return beans;
		
	}
	public  List<AppDetailBean> selectpart_no(String part_no){
		List<AppDetailBean> bean =appDetailIDao.selectpart_no(part_no);
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public List<AppDetailBean> selectapp_id(String app_id){
		List<AppDetailBean> bean =appDetailIDao.selectapp_id(app_id);
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	
}
