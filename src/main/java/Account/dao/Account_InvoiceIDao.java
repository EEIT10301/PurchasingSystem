package Account.dao;

import java.util.List;

import Account.model.Account_InvoiceBean;

public interface Account_InvoiceIDao {
	
	public abstract Account_InvoiceBean select(String id);

	public abstract List<Account_InvoiceBean> select();

	public abstract Account_InvoiceBean insert(Account_InvoiceBean bean);

	public abstract Account_InvoiceBean update(Account_InvoiceBean bean);

	public abstract boolean delete(String id);
}
