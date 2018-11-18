package Apply.dao;

import java.util.List;

import Apply.model.ProductListBean;
import Inv.model.Inv_MainBean;

public interface ProductListIDAO {
	public abstract ProductListBean select(String id);

	public abstract List<ProductListBean> select();

	public abstract ProductListBean insert(ProductListBean bean);

	public abstract ProductListBean update(ProductListBean bean);

	public abstract boolean delete(String id);
	public abstract List<ProductListBean> selectCate(String pro_cate);
	public abstract List<ProductListBean> selectAll();
	
	public abstract List<ProductListBean> selectPage(Integer pageSize, Integer pageNo);
}
