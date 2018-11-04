package Po.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Apply.model.App_SigningProcessBean;
import Po.dao.PO_SigningProcessIDao;
import Po.model.PO_SigningProcessBean;

@Service
//@Transactional
public class PO_SigningProcessService {
	@Autowired
	PO_SigningProcessIDao pO_SigningProcessIDao;
	
	public  PO_SigningProcessBean select(String po_sta,String po_id) {
		PO_SigningProcessBean beans =pO_SigningProcessIDao.select(po_sta, po_id);
		if(beans!=null) {
			return beans;
		}
		return null;
	}

	public  List<PO_SigningProcessBean> select(){
		List<PO_SigningProcessBean> beans =pO_SigningProcessIDao.select();
		if(beans!=null) {
			return beans;
		}
		return null;
	}

	public  PO_SigningProcessBean insert(PO_SigningProcessBean bean) {
		PO_SigningProcessBean beans =pO_SigningProcessIDao.insert(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}

	public  PO_SigningProcessBean update(PO_SigningProcessBean bean) {
		PO_SigningProcessBean beans =pO_SigningProcessIDao.update(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
		
	}

	public  boolean delete(String po_sta,String po_id) {
		boolean beans =pO_SigningProcessIDao.delete(po_sta, po_id);
			return beans;
	
	}
	public  List<PO_SigningProcessBean> selectpoid(String po_id){
		List<PO_SigningProcessBean> beans =pO_SigningProcessIDao.selectpoid( po_id);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  List<PO_SigningProcessBean> selectempidsend(String po_manger,String Sig_Sta){
		List<PO_SigningProcessBean> beans =pO_SigningProcessIDao.selectempidsend( po_manger,Sig_Sta);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	public  PO_SigningProcessBean selectempandrank(String po_id,Integer Sig_rank){
		PO_SigningProcessBean beans =pO_SigningProcessIDao.selectempandrank( po_id,Sig_rank);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	
	public List<PO_SigningProcessBean> selectmangers(String po_manger, String sig_Sta) {
		List<PO_SigningProcessBean> beans =pO_SigningProcessIDao.selectmangers(po_manger,sig_Sta);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
	
	public  PO_SigningProcessBean selectrank(String po_id,Integer sig_Rank) {
		PO_SigningProcessBean beans =pO_SigningProcessIDao.selectrank(po_id,sig_Rank);
		if(beans!=null) {
			return beans;
		}
		return null;
	}
}
