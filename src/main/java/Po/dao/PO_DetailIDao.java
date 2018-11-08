package Po.dao;

import java.util.List;

import Po.model.PO_DetailBean;

public interface PO_DetailIDao {
	public abstract PO_DetailBean select(String po_id,String part_No);

	public abstract List<PO_DetailBean> select();

	public abstract PO_DetailBean insert(PO_DetailBean bean);

	public abstract PO_DetailBean update(PO_DetailBean bean);

	public abstract boolean delete(String po_id,String part_No);
}
