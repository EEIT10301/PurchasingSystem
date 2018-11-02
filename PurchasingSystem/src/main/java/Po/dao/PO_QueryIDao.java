package Po.dao;

import java.util.List;

import Po.model.PO_QueryBean;

public interface PO_QueryIDao {
	public abstract PO_QueryBean select(String po_id,String vendor_ID);

	public abstract List<PO_QueryBean> select();
	public abstract List<PO_QueryBean> selectQueryBean(String po_id);

	public abstract PO_QueryBean insert(PO_QueryBean bean);

	public abstract PO_QueryBean update(PO_QueryBean bean);

	public abstract boolean delete(String po_id,String vendor_ID);
}
