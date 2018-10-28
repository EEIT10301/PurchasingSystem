package Inv.model;

import java.util.List;

public interface Inv_DetailIDao {
	public abstract Inv_DetailBean select(String Inv_Part_no,String Inv__Date);

	public abstract List<Inv_DetailBean> select();

	public abstract Inv_DetailBean insert(Inv_DetailBean bean);

	public abstract Inv_DetailBean update(Inv_DetailBean bean);

	public abstract boolean delete(String Inv_Part_no,String Inv__Date);
}
