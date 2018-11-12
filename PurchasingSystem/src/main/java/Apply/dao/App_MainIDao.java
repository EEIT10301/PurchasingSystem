package Apply.dao;

import java.util.List;

import Apply.model.App_MainBean;

public interface App_MainIDao {
	public abstract App_MainBean select(String id);

	public abstract List<App_MainBean> select();

	public abstract App_MainBean insert(App_MainBean bean);

	public abstract App_MainBean update(App_MainBean bean);

	public abstract boolean delete(String id);
	public abstract App_MainBean lastid();
	public abstract  List<App_MainBean> selectempid(String emp_id);
	
}
