package Account.model;

import java.util.List;

public interface Inv_ProductListIDao {
	public abstract Inv_ProductListBean select(String chk_Id,String part_No);

	public abstract List<Inv_ProductListBean> select();

	public abstract Inv_ProductListBean insert(Inv_ProductListBean bean);

	public abstract Inv_ProductListBean update(Inv_ProductListBean bean);

	public abstract boolean delete(String chk_Id,String part_No);
}
