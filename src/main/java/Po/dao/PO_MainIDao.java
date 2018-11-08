package Po.dao;

import java.util.List;

import Po.model.PO_MainBean;



public interface PO_MainIDao {
	public abstract PO_MainBean select(String po_id);

	public abstract List<PO_MainBean> select();

	public abstract PO_MainBean insert(PO_MainBean bean);

	public abstract PO_MainBean update(PO_MainBean bean);

	public abstract boolean delete(String po_id);
}
