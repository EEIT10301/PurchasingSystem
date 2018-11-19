package Po.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Po.dao.PO_SigningProcessIDao;
import Po.model.PO_SigningProcessBean;
import misc.SpringJavaConfiguration;

@Repository
public class PO_SigningProcessDao implements PO_SigningProcessIDao {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);

		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		PO_SigningProcessIDao productdao = (PO_SigningProcessIDao)context.getBean("PO_SigningProcessDao");

//		java.util.Date date = new java.util.Date();
//		java.sql.Date datas = new java.sql.Date(date.getTime());
//		PO_SigningProcessBean ss = new PO_SigningProcessBean("emp001", "申請中", "Po20181013001", datas, "已簽核", "請核准", 1);
//		PO_SigningProcessBean ss1 = new PO_SigningProcessBean("emp002", "已審核完成", "Po20181013001", null, "簽核中", null, 2);
//		productDAO.insert(ss);
//		productDAO.insert(ss1);
//		sessionFactory.getCurrentSession().getTransaction().commit();
//		sessionFactory.getCurrentSession().beginTransaction();
//		List<PO_SigningProcessBean> selects = productDAO.selectempidsend("emp004", "驗收完成未請款");
//		for(PO_SigningProcessBean xz:selects) {
//        	System.out.println(xz.getPo_id());
//        	System.out.println(xz.getpO_MainBean().getVendor_ID());
//
//         }
		
		
//		PO_SigningProcessBean a = productdao.selectorderdetail("Po20181013001");
//		System.out.println(a.getPo_id());
//		System.out.println(a.getPo_manger());
//		System.out.println(a.getPo_sta());
		
		
		
//		java.util.Date date = new java.util.Date();
//		java.sql.Date datas = new java.sql.Date(date.getTime());
//		PO_SigningProcessBean bean = new PO_SigningProcessBean(datas,"dvsvsds");
//		productdao.update(bean);
		
		
//		List<PO_SigningProcessBean> aa = productdao.selectempID("emp004");
//		for(int i=0;i<aa.size();i++) {
//			PO_SigningProcessBean ss = aa.get(i);
//			System.out.println(ss.getPo_sta());
//			System.out.println(ss.getPo_manger());
//			System.out.println(ss.getPo_id());
//		}
		

		 sessionFactory.getCurrentSession().getTransaction().commit();
	}

	@SuppressWarnings("unchecked")
	@Override
	public PO_SigningProcessBean select(String po_sta, String po_id) {
		List<PO_SigningProcessBean> list = null;
		PO_SigningProcessBean getone = new PO_SigningProcessBean();
		String hgl = "FROM PO_SigningProcessBean WHERE po_sta=:id1 AND po_id=:id2 order by po_id desc";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_sta).setParameter("id2", po_id)
				.setMaxResults(100).list();
		if (list.size() > 0) {
			for (PO_SigningProcessBean getones : list) {
				getone = getones;
			}
			return getone;
		} else {
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	@Override
	public PO_SigningProcessBean selectsigsta(String sig_sta, String po_id) {
		List<PO_SigningProcessBean> list = null;
		PO_SigningProcessBean getone = new PO_SigningProcessBean();
		String hgl = "FROM PO_SigningProcessBean WHERE sig_sta=:id1 AND po_id=:id2";
		list = this.getSession().createQuery(hgl).setParameter("id1", sig_sta).setParameter("id2", po_id)
				.setMaxResults(100).list();
		if (list.size() > 0) {
			for (PO_SigningProcessBean getones : list) {
				getone = getones;
			}
			return getone;
		} else {
			return null;
		}
	}

	@Override
	public List<PO_SigningProcessBean> select() {
		return this.getSession().createQuery("from PO_SigningProcessBean order by sig_date desc", PO_SigningProcessBean.class)
				.setMaxResults(50).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public PO_SigningProcessBean insert(PO_SigningProcessBean bean) {
		List<PO_SigningProcessBean> list = null;
		String po_sta = bean.getPo_sta();
		String po_id = bean.getPo_id();
		String hgl = "FROM PO_SigningProcessBean WHERE po_sta=:id1 AND po_id=:id2";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_sta).setParameter("id2", po_id)
				.setMaxResults(50).list();
		if (list.size() > 0) {

			return null;
		} else {
			this.getSession().save(bean);
			return bean;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public PO_SigningProcessBean update(PO_SigningProcessBean bean) {
		List<PO_SigningProcessBean> list = null;
		String po_sta = bean.getPo_sta();
		String po_id = bean.getPo_id();
		String hgl = "FROM PO_SigningProcessBean WHERE po_sta=:id1 AND po_id=:id2";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_sta).setParameter("id2", po_id)
				.setMaxResults(50).list();
		if (list.size() > 0) {
			for (PO_SigningProcessBean getones : list) {
				getones.setPo_manger(bean.getPo_manger());
				getones.setSig_date(bean.getSig_date());
				getones.setSig_rank(bean.getSig_rank());
				getones.setSig_sta(bean.getSig_sta());
				getones.setSig_sug(bean.getSig_sug());
			}
			return bean;
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String po_sta, String po_id) {
		List<PO_SigningProcessBean> list = null;
		PO_SigningProcessBean getone = new PO_SigningProcessBean();
		String hgl = "FROM PO_SigningProcessBean WHERE po_sta=:id1 AND po_id=:id2";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_sta).setParameter("id2", po_id)
				.setMaxResults(50).list();
		if (list.size() > 0) {
			for (PO_SigningProcessBean getones : list) {
				getone = getones;
			}
			this.getSession().delete(getone);
			return true;
		} else {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PO_SigningProcessBean> selectpoid(String po_id) {
		List<PO_SigningProcessBean> list = null;
		String hgl = "FROM PO_SigningProcessBean WHERE po_id=:id1 order by sig_rank";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_id).setMaxResults(50).list();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PO_SigningProcessBean> selectpo_sta(String po_sta) {
		List<PO_SigningProcessBean> list = null;
		String hgl = "FROM PO_SigningProcessBean WHERE po_sta=:id1 order by sig_date desc";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_sta).setMaxResults(50).list();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<PO_SigningProcessBean> selectempidsend(String po_manger, String sig_sta) {
		List<PO_SigningProcessBean> list = null;
		// from PO_SigningProcess where PO_Manger='emp005' and Sig_Sta='分派中'
		String hgl = "FROM PO_SigningProcessBean where PO_Manger=:id1 and sig_sta=:id2 order by sig_date desc";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_manger).setParameter("id2", sig_sta)
				.setMaxResults(50).list();

		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public PO_SigningProcessBean selectempandrank(String po_id, Integer Sig_rank) {
		List<PO_SigningProcessBean> list = null;
		PO_SigningProcessBean getone = new PO_SigningProcessBean();
		String hgl = "FROM PO_SigningProcessBean where po_id=:id1 and Sig_rank=:id2";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_id).setParameter("id2", Sig_rank)
				.setMaxResults(50).list();

		if (list.size() > 0) {
			for (PO_SigningProcessBean getones : list) {
				getone = getones;
			}
			return getone;
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PO_SigningProcessBean> selectmangers(String po_manger, String sig_Sta) {
		List<PO_SigningProcessBean> list = null;
		String hgl = "FROM PO_SigningProcessBean WHERE po_manger=:id1 and sig_Sta= :id2 order by sig_date desc";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_manger).setParameter("id2", sig_Sta)
				.setMaxResults(500).list();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")//select POID 對應的狀態sig_sta
	@Override
	public List<PO_SigningProcessBean> selectSigSta(String sig_Sta,String po_id) {
		List<PO_SigningProcessBean> list = null;
		String hgl = "FROM PO_SigningProcessBean WHERE sig_sta=:id1 and po_id=:id2 order by sig_date desc";
		list = this.getSession().createQuery(hgl).setParameter("id1", sig_Sta).setParameter("id2", po_id).setMaxResults(50).list();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public PO_SigningProcessBean selectrank(String po_id, Integer sig_rank) {
		List<PO_SigningProcessBean> list = null;
		PO_SigningProcessBean getRank = new PO_SigningProcessBean();
		String hgl = "FROM PO_SigningProcessBean WHERE po_id=:id1 AND sig_Rank=:id2 order by sig_date desc";

		list = this.getSession().createQuery(hgl).setParameter("id1", po_id).setParameter("id2", sig_rank)

				.setMaxResults(50).list();
		if (list.size() > 0) {
			for (PO_SigningProcessBean getRanks : list) {
				getRank = getRanks;
			}
			return getRank;
		} else {
			return null;
		}

	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PO_SigningProcessBean> selectempidsendpages(String po_manger, String sig_sta ,Integer beginindex,Integer pagesize) {
		List<PO_SigningProcessBean> list1 = null;
		// from PO_SigningProcess where PO_Manger='emp005' and Sig_Sta='分派中'
		String hgl = "FROM PO_SigningProcessBean where PO_Manger=:id1 and sig_sta=:id2 order by sig_date desc";
		@SuppressWarnings("rawtypes")
		Query query = this.getSession().createQuery(hgl).setParameter("id1", po_manger).setParameter("id2", sig_sta);
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
	public PO_SigningProcessBean selectorderdetail(String po_id,String po_manger,String po_sta) {
		List<PO_SigningProcessBean> list = null;
		PO_SigningProcessBean getone = new PO_SigningProcessBean();
		String hgl = "FROM PO_SigningProcessBean WHERE po_id=:id1 and po_manger=:id2 and po_sta=:id3";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_id).setParameter("id2", po_manger)
				.setParameter("id3", po_sta).setMaxResults(100).list();
		if (list.size() > 0) {
			for (PO_SigningProcessBean getones : list) {
				getone = getones;
			}
			return getone;
		} else {
			return null;
		}
	}
	
	
	
	
	
	@SuppressWarnings("unchecked")
	public List<PO_SigningProcessBean> selectempID(String po_manger){
		List<PO_SigningProcessBean> list = null;
		String hgl = "FROM PO_SigningProcessBean WHERE po_manger=:id1 order by Sig_Date desc";
		list = this.getSession().createQuery(hgl).setParameter("id1", po_manger)
				.setMaxResults(50).list();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
}

	@SuppressWarnings("unchecked")
	@Override
	public List<PO_SigningProcessBean> selectonlySigSta(String sig_Sta) {
		List<PO_SigningProcessBean> list = null;
		String hgl = "FROM PO_SigningProcessBean WHERE sig_Sta=:id1 order by sig_date desc";
		list = this.getSession().createQuery(hgl).setParameter("id1", sig_Sta)
				.setMaxResults(500).list();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}
	
	

	
	
}