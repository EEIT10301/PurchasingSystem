package Account.model;

import java.util.List;

public interface Inv＿ProductCheckIDao {
	public abstract Inv＿ProductCheckBean select(String id);

	public abstract List<Inv＿ProductCheckBean> select();

	public abstract Inv＿ProductCheckBean insert(Inv＿ProductCheckBean bean);

	public abstract Inv＿ProductCheckBean update(Inv＿ProductCheckBean bean);

	public abstract boolean delete(String id);
}
