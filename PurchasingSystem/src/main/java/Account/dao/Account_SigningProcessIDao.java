package Account.dao;

import java.util.List;

import Account.model.Account_SigningProcessBean;

public interface Account_SigningProcessIDao {
	public abstract Account_SigningProcessBean select(String account_Sta,String inv_id);

	public abstract Account_SigningProcessBean selectForRank(String inv_id,Integer sig_Rank);
	
	public abstract List<Account_SigningProcessBean> select();
	
	public abstract List<Account_SigningProcessBean> selectForStatus(String account_Sta);
	
	public abstract List<Account_SigningProcessBean> selectForInvid(String inv_id);

	public abstract Account_SigningProcessBean insert(Account_SigningProcessBean bean);

	public abstract Account_SigningProcessBean update(Account_SigningProcessBean bean);

	public abstract boolean delete(String account_Sta,String inv_id);

	public abstract List<Account_SigningProcessBean> select3send(String emp_id, String sig_sta, Integer sig_rank);

	List<Account_SigningProcessBean> selectTodoSignInvoice(String emp_id, String sig_sta, Integer sig_rank);

	List<Account_SigningProcessBean> selectProcess(String emp_id, String sig_sta, Integer sig_rank);

	List<Account_SigningProcessBean> selectInvidAndRank(String inv_id, Integer sig_rank);

	List<Account_SigningProcessBean> selectStatus(String emp_id);
}
