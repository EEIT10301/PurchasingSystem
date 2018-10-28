package Account.model;

import java.util.List;

public interface Account_InvoiceIDao {
	
	public abstract Account_InvoiceBean select(String id);

	public abstract List<Account_InvoiceBean> select();

	public abstract Account_InvoiceBean insert(Account_InvoiceBean bean);

	public abstract Account_InvoiceBean update(Account_InvoiceBean bean);

	public abstract boolean delete(String id);
}
