package Po.dao;

import java.util.List;

import Apply.model.App_SigningProcessBean;
import Po.model.PO_SigningProcessBean;

public interface PO_SigningProcessIDao {
	
	public abstract PO_SigningProcessBean select(String po_sta,String po_id);

	public abstract List<PO_SigningProcessBean> select();

	public abstract PO_SigningProcessBean insert(PO_SigningProcessBean bean);

	public abstract PO_SigningProcessBean update(PO_SigningProcessBean bean);

	public abstract boolean delete(String po_sta,String po_id);
	
	public abstract List<PO_SigningProcessBean> selectpoid(String po_id);

	public abstract List<PO_SigningProcessBean> selectempidsend(String po_manger,String Sig_Sta);
	
	public abstract List<PO_SigningProcessBean> selectmangers(String po_manger,String sig_Sta);
	
	public abstract PO_SigningProcessBean selectrank(String po_id,Integer sig_Rank);
}
