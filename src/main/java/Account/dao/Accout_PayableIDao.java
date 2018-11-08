package Account.dao;

import java.util.List;

import Account.model.Accout_PayableBean;

public interface Accout_PayableIDao {
	public abstract Accout_PayableBean select(String id);

	public abstract List<Accout_PayableBean> select();

	public abstract Accout_PayableBean insert(Accout_PayableBean bean);

	public abstract Accout_PayableBean update(Accout_PayableBean bean);

	public abstract boolean delete(String id);
}
