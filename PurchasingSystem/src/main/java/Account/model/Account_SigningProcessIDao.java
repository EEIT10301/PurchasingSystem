package Account.model;

import java.util.List;

public interface Account_SigningProcessIDao {
	public abstract Account_SigningProcessBean select(String account_Sta,String inv_id);

	public abstract List<Account_SigningProcessBean> select();

	public abstract Account_SigningProcessBean insert(Account_SigningProcessBean bean);

	public abstract Account_SigningProcessBean update(Account_SigningProcessBean bean);

	public abstract boolean delete(String account_Sta,String inv_id);
}
