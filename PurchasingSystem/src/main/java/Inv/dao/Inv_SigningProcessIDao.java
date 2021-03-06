package Inv.dao;

import java.util.List;

import Inv.model.Inv_SigningProcessBean;
import Po.model.PO_SigningProcessBean;

public interface Inv_SigningProcessIDao {
	public abstract Inv_SigningProcessBean select(String inv_Sta, String chk_Id );

	public abstract List<Inv_SigningProcessBean> select();

	public abstract Inv_SigningProcessBean insert(Inv_SigningProcessBean bean);

	public abstract Inv_SigningProcessBean update(Inv_SigningProcessBean bean);

	public abstract boolean delete(String inv_Sta, String chk_Id);
	public abstract List<Inv_SigningProcessBean> selectempidsend(String inv_manger,String sig_sta);

	public abstract List<Inv_SigningProcessBean> selectchk_Id(String chk_Id);
}
