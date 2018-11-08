package Inv.dao;

import java.util.List;

import Inv.model.Inv_MainBean;



public interface Inv_MainIDao {
	public abstract Inv_MainBean select(String id);

	public abstract List<Inv_MainBean> select();

	public abstract Inv_MainBean insert(Inv_MainBean bean);

	public abstract Inv_MainBean update(Inv_MainBean bean);

	public abstract boolean delete(String id);

	List<Inv_MainBean> selectPage(Integer pageSize, Integer pageNo);




}
