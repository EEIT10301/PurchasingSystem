package Account.model;

import java.util.List;

public interface PO_Vendor_InfoIDao {
	
	public abstract PO_Vendor_InfoBean select(String id);

	public abstract List<PO_Vendor_InfoBean> select();

	public abstract PO_Vendor_InfoBean insert(PO_Vendor_InfoBean bean);

	public abstract PO_Vendor_InfoBean update(PO_Vendor_InfoBean bean);

	public abstract boolean delete(String id);
}
