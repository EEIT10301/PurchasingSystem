package Inv.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Inv.dao.Inv_SigningProcessIDao;
import Inv.model.Inv_SigningProcessBean;
import misc.SpringJavaConfiguration;
@Repository
public class Inv_SigningProcessDao implements Inv_SigningProcessIDao{
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
	public static void main(String[] args) {
		ApplicationContext context =
				new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();

		Inv_SigningProcessIDao Inv_SigningProcessDAO = (Inv_SigningProcessIDao) context.getBean("inv_SigningProcessDao");
		 List<Inv_SigningProcessBean> ddd = Inv_SigningProcessDAO.selectempidsend("emp000", "待驗收");
		 for(int i=0;i<ddd.size();i++) {
			 Inv_SigningProcessBean aaa = ddd.get(i);
//			 System.out.println(aaa.getChk_Id());
		 }		
		 //		java.util.Date date = new java.util.Date();
//		java.sql.Date datas =new java.sql.Date(date.getTime());
//		Inv_SigningProcessBean ss=new Inv_SigningProcessBean("emp001","申請中","Ck20181013001",datas,"已簽核","請核准",1);
//		Inv_SigningProcessBean ss1=new Inv_SigningProcessBean("emp002","已審核完成","Ck20181013001",datas,"已簽核","OK",2);
//		productDAO.update(ss);
//		productDAO.update(ss1);
//		sessionFactory.getCurrentSession().getTransaction().commit();
//		sessionFactory.getCurrentSession().beginTransaction();
//		List<Inv_SigningProcessBean> selects = productDAO.select();
//		for(Inv_SigningProcessBean xz:selects) {
//             System.out.println("1.驗收單流程:"+xz.getSig_Date());
//             System.out.println("2.員工表格:"+xz.getEmployeeBean().getEmp_name());
//             System.out.println("3.請款表格:"+xz.getInv＿ProductCheckBean().getEmp_ID());
//         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@SuppressWarnings("unchecked")
	@Override
	public Inv_SigningProcessBean select(String inv_Sta, String chk_Id) {
		List<Inv_SigningProcessBean> list = null;
		Inv_SigningProcessBean getone =new Inv_SigningProcessBean();
		String hgl="FROM Inv_SigningProcessBean WHERE inv_Sta=:id1 AND chk_Id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", inv_Sta)
				.setParameter("id2", chk_Id).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(Inv_SigningProcessBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			 return null;
		 }
	}

	@Override
	public List<Inv_SigningProcessBean> select() {
		return this.getSession().createQuery(
				"from Inv_SigningProcessBean", Inv_SigningProcessBean.class).setMaxResults(50).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Inv_SigningProcessBean insert(Inv_SigningProcessBean bean) {
		List<Inv_SigningProcessBean> list = null;
		String inv_Sta = bean.getInv_Sta();
		String  chk_Id = bean.getChk_Id();
		String hgl="FROM Inv_SigningProcessBean WHERE inv_Sta=:id1 AND chk_Id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", inv_Sta)
				.setParameter("id2", chk_Id).setMaxResults(50).list();
		 if(list.size()>0) {
			  return null;
		 }else {
			 this.getSession().save(bean);
			 return bean;
		 }
	}

	@SuppressWarnings("unchecked")
	@Override
	public Inv_SigningProcessBean update(Inv_SigningProcessBean bean) {
		List<Inv_SigningProcessBean> list = null;
		Inv_SigningProcessBean getone=new Inv_SigningProcessBean();
		String inv_Sta = bean.getInv_Sta();
		String  chk_Id = bean.getChk_Id();
		String hgl="FROM Inv_SigningProcessBean WHERE inv_Sta=:id1 AND chk_Id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", inv_Sta)
				.setParameter("id2", chk_Id).setMaxResults(50).list();
		 if(list.size()>0) {
			for(Inv_SigningProcessBean getones:list) {
				getones.setInv_Manger(bean.getInv_Manger());
				getones.setSig_Date(bean.getSig_Date());
				getones.setSig_Sta(bean.getSig_Sta());
				getones.setSig_Sug(bean.getSig_Sug());
				getones.setSig_Rank(bean.getSig_Rank());
			}
			return bean;
		 }else {
			 return null;
		 }
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String inv_Sta, String chk_Id) {
		List<Inv_SigningProcessBean> list = null;
		Inv_SigningProcessBean getone =new Inv_SigningProcessBean();
		String hgl="FROM Inv_SigningProcessBean WHERE inv_Sta=:id1 AND chk_Id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", inv_Sta)
				.setParameter("id2", chk_Id).setMaxResults(50).list();
		 if(list.size()>0) {
			  for(Inv_SigningProcessBean getones :list) {
				  getone=getones;
			  }
			  this.getSession().delete(getone);
			  return true;
		 }else {
			 return false;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Inv_SigningProcessBean> selectempidsend(String inv_manger, String sig_sta) {
		List<Inv_SigningProcessBean> list = null;
		//from Inv_SigningProcess where Inv_Manger='emp005' and Sig_Sta='分派中'
		String hgl="FROM Inv_SigningProcessBean where inv_manger=:id1 and sig_sta=:id2 order by Sig_Date asc";
		list =this.getSession().createQuery(hgl).setParameter("id1",inv_manger).setParameter("id2", sig_sta).setMaxResults(50).list();	
		if(list.size()>0) {
			  return list;
		 }else {
			 return null;
		 }
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Inv_SigningProcessBean> selectchk_Id(String chk_Id) {
		List<Inv_SigningProcessBean> list = null;
		//from Inv_SigningProcess where Inv_Manger='emp005' and Sig_Sta='分派中'
		String hgl="FROM Inv_SigningProcessBean where chk_Id=:id1 ";
		list =this.getSession().createQuery(hgl).setParameter("id1",chk_Id).setMaxResults(50).list();	
		if(list.size()>0) {
			  return list;
		 }else {
			 return null;
		 }
	}

}
