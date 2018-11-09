package Apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Apply.dao.App_SigningProcessIDao;
import Apply.model.App_SigningProcessBean;

@Service
//@Transactional
public class App_SigningProcessService {
	@Autowired
	App_SigningProcessIDao app_SigningProcessIDao;
	public  App_SigningProcessBean select(String app_sta,String app_id) {
		App_SigningProcessBean bean =app_SigningProcessIDao.select(app_sta,app_id);
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public  List<App_SigningProcessBean> select(){
		List<App_SigningProcessBean> bean =app_SigningProcessIDao.select();
		if(bean!=null) {
			return bean;
		}
		return null;
	}
	public  App_SigningProcessBean insert(App_SigningProcessBean bean) {
		App_SigningProcessBean beans =app_SigningProcessIDao.insert(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  App_SigningProcessBean update(App_SigningProcessBean bean) {
		App_SigningProcessBean beans =app_SigningProcessIDao.update(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  boolean delete(String app_sta,String app_id) {
		boolean beans =app_SigningProcessIDao.delete(app_sta,app_id);

			return beans;
	}
	public  App_SigningProcessBean selectsta(String app_Manger,String sig_Sta) {
		App_SigningProcessBean beans =app_SigningProcessIDao.selectsta(app_Manger,sig_Sta);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  App_SigningProcessBean selectrank(String app_id,Integer sig_Rank) {
		App_SigningProcessBean beans =app_SigningProcessIDao.selectrank(app_id,sig_Rank);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  App_SigningProcessBean selectlastrank(String app_id) {
		App_SigningProcessBean beans =app_SigningProcessIDao.selectlastrank(app_id);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  List<App_SigningProcessBean> selectfromlastemp(String app_Manger) {
		List<App_SigningProcessBean> beans =app_SigningProcessIDao.selectfromlastemp(app_Manger);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  List<App_SigningProcessBean> selectallappid(String app_id) {
		List<App_SigningProcessBean> beans =app_SigningProcessIDao.selectallappid(app_id);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public List<App_SigningProcessBean> selectmangers(String app_Manger, String sig_Sta) {
		List<App_SigningProcessBean> beans =app_SigningProcessIDao.selectmangers(app_Manger,sig_Sta);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public List<App_SigningProcessBean> selectemppoidsendpages(String app_Manger, String sig_sta ,Integer beginindex,Integer pagesize) {
		List<App_SigningProcessBean> beans =app_SigningProcessIDao.selectemppoidsendpages(app_Manger,sig_sta,beginindex,pagesize);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public List<App_SigningProcessBean> selectfromlastemp1(Integer Sig_Rank) {
		List<App_SigningProcessBean> beans =app_SigningProcessIDao.selectfromlastemp1(Sig_Rank);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  List<App_SigningProcessBean> selectApp_staandSig_sta(String app_sta,String sig_sta){
		List<App_SigningProcessBean> beans =app_SigningProcessIDao.selectApp_staandSig_sta(app_sta,sig_sta);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
}
