package Apply.dao;

import java.util.List;

import Apply.model.App_SigningProcessBean;
import Po.model.PO_SigningProcessBean;

public interface App_SigningProcessIDao {
	public abstract App_SigningProcessBean select(String app_sta,String app_id);

	public abstract List<App_SigningProcessBean> select();

	public abstract App_SigningProcessBean insert(App_SigningProcessBean bean);

	public abstract App_SigningProcessBean update(App_SigningProcessBean bean);

	public abstract boolean delete(String app_sta,String app_id);
	public abstract App_SigningProcessBean selectsta(String app_Manger,String sig_Sta);
	public abstract App_SigningProcessBean selectrank(String app_id,Integer sig_Rank);
	public abstract App_SigningProcessBean selectlastrank(String app_id);
	public abstract List<App_SigningProcessBean> selectfromlastemp(String app_Manger);
	public abstract List<App_SigningProcessBean> selectallappid(String app_id);
	public abstract List<App_SigningProcessBean> selectmangers(String app_Manger,String sig_Sta);
	public abstract List<App_SigningProcessBean> selectemppoidsendpages(String app_Manger, String sig_sta ,Integer beginindex,Integer pagesize);
}
