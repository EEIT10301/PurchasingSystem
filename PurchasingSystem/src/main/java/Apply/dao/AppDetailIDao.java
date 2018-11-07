package Apply.dao;

import java.util.List;

import Apply.model.AppDetailBean;

public interface AppDetailIDao {
	public abstract AppDetailBean select(String app_id,String part_no);

	public abstract List<AppDetailBean> select();

	public abstract AppDetailBean insert(AppDetailBean bean);

	public abstract AppDetailBean update(AppDetailBean bean);

	public abstract boolean delete(String app_id,String part_no);
	public abstract List<AppDetailBean> selectpart_no(String part_no);
}
