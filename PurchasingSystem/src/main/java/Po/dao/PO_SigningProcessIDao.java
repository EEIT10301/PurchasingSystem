package Po.dao;

import java.util.List;

import Po.model.PO_SigningProcessBean;

public interface PO_SigningProcessIDao {
	
	public abstract PO_SigningProcessBean select(String po_sta,String po_id);

	public abstract List<PO_SigningProcessBean> select();

	public abstract PO_SigningProcessBean insert(PO_SigningProcessBean bean);

	public abstract PO_SigningProcessBean update(PO_SigningProcessBean bean);

	public abstract boolean delete(String po_sta,String po_id);
	
	public abstract List<PO_SigningProcessBean> selectpoid(String po_id);

	public abstract List<PO_SigningProcessBean> selectempidsend(String po_manger,String Sig_Sta);
	public abstract PO_SigningProcessBean selectempandrank(String po_id,Integer Sig_rank);
}
