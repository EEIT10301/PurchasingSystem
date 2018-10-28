package Apply.dao;

import java.util.List;

import Apply.model.ProductListBean;

public interface ProductListIDAO {
	public abstract ProductListBean select(String id);

	public abstract List<ProductListBean> select();

	public abstract ProductListBean insert(ProductListBean bean);

	public abstract ProductListBean update(ProductListBean bean);

	public abstract boolean delete(String id);
	public abstract List<ProductListBean> selectCate(String pro_cate);
}
