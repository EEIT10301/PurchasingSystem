package Apply.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Apply.dao.App_SigningProcessIDao;
import Apply.model.App_SigningProcessBean;
import misc.SpringJavaConfiguration;

@Repository
public class App_SigningProcessDao implements App_SigningProcessIDao {
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

		App_SigningProcessIDao productDAO = (App_SigningProcessIDao) context.getBean("app_SigningProcessDao");
		java.util.Date date = new java.util.Date();
		java.sql.Date datas =new java.sql.Date(date.getTime());
		App_SigningProcessBean ss=new App_SigningProcessBean("emp001","申請中","ap20181013001",datas,"已簽核","請核准",1);
		App_SigningProcessBean ss1=new App_SigningProcessBean("emp002","已審核完成","ap20181013001",null,"簽核中",null,2);
		productDAO.insert(ss);
		productDAO.insert(ss1);
		sessionFactory.getCurrentSession().getTransaction().commit();
		sessionFactory.getCurrentSession().beginTransaction();
		List<App_SigningProcessBean> selects = productDAO.select();
		for(App_SigningProcessBean xz:selects) {
        	 System.out.println("1請購簽核表:"+xz.getApp_manger());
        	 System.out.println("1請購簽核表:"+xz.getSig_date());
        	 System.out.println("2請購主檔:"+xz.getApp_MainBean().getApp_price());
        	 System.out.println("3員工表格:"+xz.getEmployeeBean().getEmp_job());
        	 System.out.println("3員工表格:"+xz.getEmployeeBean().getEmp_name());
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@SuppressWarnings("unchecked")
	@Override
	public App_SigningProcessBean select(String app_sta,String app_id) {
		List<App_SigningProcessBean> list = null;
		App_SigningProcessBean getone =new App_SigningProcessBean();
		String hgl="FROM App_SigningProcessBean WHERE app_sta=:id1 AND app_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_sta)
				.setParameter("id2", app_id).setMaxResults(500).list();
		 if(list.size()>0) {
			  for(App_SigningProcessBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			 return null;
		 }
		//return this.getSession().get(App_SigningProcessBean.class, id);
	}

	@Override
	public List<App_SigningProcessBean> select() {
		return this.getSession().createQuery(
				"from App_SigningProcessBean", App_SigningProcessBean.class).setMaxResults(500).list();
	
	}

	@SuppressWarnings("unchecked")
	@Override
	public App_SigningProcessBean insert(App_SigningProcessBean bean) {
		List<App_SigningProcessBean> list = null;
		String app_sta = bean.getApp_sta();
		String app_id = bean.getApp_id();
		String hgl="FROM App_SigningProcessBean WHERE app_sta=:id1 AND app_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_sta)
				.setParameter("id2", app_id).setMaxResults(500).list();
		 if(list.size()>0) {
			 
			  return null;
		 }else {
			 this.getSession().save(bean);
			 return bean;
		 }
	}

	@SuppressWarnings("unchecked")
	@Override
	public App_SigningProcessBean update(App_SigningProcessBean bean) {
		List<App_SigningProcessBean> list = null;
		String app_sta = bean.getApp_sta();
		String app_id = bean.getApp_id();
		String hgl="FROM App_SigningProcessBean WHERE app_sta=:id1 AND app_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_sta)
				.setParameter("id2", app_id).setMaxResults(500).list();
		 if(list.size()>0) {
			 for(App_SigningProcessBean getones :list) {
				  getones.setApp_manger(bean.getApp_manger());
				  getones.setSig_date(bean.getSig_date());
				  getones.setSig_rank(bean.getSig_rank());
				  getones.setSig_sta(bean.getSig_sta());
				  getones.setSig_sug(bean.getSig_sug());
			  }
			return bean;
		 }else {
			 return null;
		 }
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String app_sta,String app_id) {
		//App_SigningProcessBean temp = this.getSession().get(App_SigningProcessBean.class, id);
		List<App_SigningProcessBean> list = null;
		App_SigningProcessBean getone =new App_SigningProcessBean();
		String hgl="FROM App_SigningProcessBean WHERE app_sta=:id1 AND app_id=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_sta)
				.setParameter("id2", app_id).setMaxResults(500).list();
		 if(list.size()>0) {
			  for(App_SigningProcessBean getones :list) {
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
	public App_SigningProcessBean selectsta(String app_Manger,String sig_Sta) {
		List<App_SigningProcessBean> list = null;
		App_SigningProcessBean getone =new App_SigningProcessBean();
		String hgl="FROM App_SigningProcessBean WHERE app_Manger=:id1 AND sig_Sta=:id2";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_Manger)
				.setParameter("id2", sig_Sta).setMaxResults(500).list();
		 if(list.size()>0) {
			 
			 for(App_SigningProcessBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public App_SigningProcessBean selectrank(String app_id,Integer sig_Rank) {
		List<App_SigningProcessBean> list = null;
		App_SigningProcessBean getone =new App_SigningProcessBean();
		String hgl="FROM App_SigningProcessBean WHERE app_id=:id1 AND sig_Rank=:id2 and not Sig_sta ='已註銷' and app_id=:id1 AND sig_Rank=:id2 and not Sig_sta ='已結案' order by App_ID  desc ";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_id)
				.setParameter("id2", sig_Rank).setMaxResults(500).list();
		 if(list.size()>0) {
			 
			 for(App_SigningProcessBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public App_SigningProcessBean selectlastrank(String app_id) {
		List<App_SigningProcessBean> list = null;
		App_SigningProcessBean getone =new App_SigningProcessBean();
		String hgl="FROM App_SigningProcessBean WHERE app_id=:id1 ";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_id)
				.setMaxResults(500).list();
		 if(list.size()>0) {
			 
			 for(App_SigningProcessBean getones :list) {
				  getone=getones;
			  }
			  return getone;
		 }else {
			
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<App_SigningProcessBean> selectfromlastemp(String app_Manger) {
		List<App_SigningProcessBean> list = null;
		App_SigningProcessBean getone =new App_SigningProcessBean();
		String hgl="FROM App_SigningProcessBean  WHERE app_Manger=:id1 and not Sig_sta ='已註銷' and app_Manger=:id1 and not Sig_sta ='已結案' order by App_ID  desc";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_Manger)
				.setMaxResults(500).list();
		 if(list.size()>0) {
			 return list;
			 }
		 else {
			
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<App_SigningProcessBean> selectallappid(String app_id) {
		List<App_SigningProcessBean> list = null;
		
		String hgl="FROM App_SigningProcessBean WHERE app_id=:id1 order by sig_rank";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_id)
				.setMaxResults(500).list();
		 if(list.size()>0) {
			 return list;
			 }
		 else {
			
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<App_SigningProcessBean> selectmangers(String app_Manger, String sig_Sta) {
           List<App_SigningProcessBean> list = null;
		
		String hgl="FROM App_SigningProcessBean WHERE app_Manger=:id1 and sig_Sta=:id2 order by App_ID desc";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_Manger)
				.setParameter("id2", sig_Sta).setMaxResults(500).list();
		 if(list.size()>0) {
			 return list;
			 }
		 else {
			
			 return null;
		 }
	}
//xxx
	@SuppressWarnings("unchecked")
	@Override
	public List<App_SigningProcessBean> selectemppoidsendpages(String app_Manger, String sig_sta, Integer beginindex,
			Integer pagesize) {
	
		List<App_SigningProcessBean> list1 = null;
		// from PO_SigningProcess where PO_Manger='emp005' and Sig_Sta='分派中'
		String hgl = "FROM App_SigningProcessBean where app_Manger=:id1 and sig_sta=:id2 order by App_ID desc";
		@SuppressWarnings("rawtypes")
		Query query = this.getSession().createQuery(hgl).setParameter("id1", app_Manger).setParameter("id2", sig_sta);
		query.setFirstResult(beginindex);
		query.setMaxResults(pagesize);
		list1=query.list();
		if (list1.size() > 0) {
			return list1;
		} else {
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<App_SigningProcessBean> selectfromlastemp1(Integer Sig_Rank) {
		List<App_SigningProcessBean> list = null;
		// from PO_SigningProcess where PO_Manger='emp005' and Sig_Sta='分派中'
		String hgl = "FROM App_SigningProcessBean where Sig_Rank=:id1 and not Sig_sta ='已註銷' and Sig_Rank=:id1 and not Sig_sta ='已結案' order by App_ID desc";
		list =this.getSession().createQuery(hgl).setParameter("id1", Sig_Rank).setMaxResults(500).list();
		 if(list.size()>0) {
			 return list;
			 }
		 else {
			
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<App_SigningProcessBean> selectApp_staandSig_sta(String app_sta, String sig_sta) {
		List<App_SigningProcessBean> list = null;
		String hgl = "FROM App_SigningProcessBean where app_sta=:id1 and  sig_sta=:id2  order by Sig_Date desc";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_sta).setParameter("id2", sig_sta).setMaxResults(500).list();
		 if(list.size()>0) {
			 return list;
			 }
		 else {
			
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<App_SigningProcessBean> selectApp_staandSig_staemp(String app_sta, String sig_sta, String app_Manger) {
		List<App_SigningProcessBean> list = null;
		String hgl = "FROM App_SigningProcessBean where app_sta=:id1 and sig_sta=:id2 and app_Manger=:id3  order by Sig_Date desc";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_sta).setParameter("id2", sig_sta)
				.setParameter("id3", app_Manger).setMaxResults(500).list();
		 if(list.size()>0) {
			 return list;
			 }
		 else {
			
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public App_SigningProcessBean selectApp_idandSig_staAndApp_staEndlist(String app_id, String sig_sta,
			String app_sta) {
		List<App_SigningProcessBean> list = null;
		App_SigningProcessBean thisbean=new App_SigningProcessBean();
		String hgl = "FROM App_SigningProcessBean where app_id=:id1 and sig_sta=:id2 and app_sta=:id3  order by Sig_Date desc";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_id).setParameter("id2", sig_sta)
				.setParameter("id3", app_sta).setMaxResults(500).list();
		 if(list.size()>0) {
			 for(App_SigningProcessBean x:list) {
				 thisbean=x;
			 }
			 return thisbean;
			 }
		 else {
			
			 return null;
		 }
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<App_SigningProcessBean> selectApp_staandSig_staandAppmanger(String app_sta, String sig_sta,
			String app_Manger) {
		List<App_SigningProcessBean> list = null;
		String hgl = "FROM App_SigningProcessBean where app_sta=:id1 and sig_sta=:id2 and app_Manger=:id3 order by Sig_Date desc";
		list =this.getSession().createQuery(hgl).setParameter("id1", app_sta).setParameter("id2", sig_sta).setParameter("id3", app_Manger).setMaxResults(500).list();
		 if(list.size()>0) {
			 return list;
			 }
		 else {
			
			 return null;
		 }
	}
}
