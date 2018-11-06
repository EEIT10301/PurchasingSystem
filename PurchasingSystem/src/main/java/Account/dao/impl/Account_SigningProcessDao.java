package Account.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Account.dao.Account_SigningProcessIDao;
import Account.model.Account_SigningProcessBean;
import Po.model.PO_SigningProcessBean;
import misc.SpringJavaConfiguration;

@Repository
public class Account_SigningProcessDao implements Account_SigningProcessIDao {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
//		---------test:select()----------
//		Account_SigningProcessIDao productDAO = (Account_SigningProcessIDao) context.getBean("account_SigningProcessDao");
//		List<Account_SigningProcessBean> selects = productDAO.select();
//		for(Account_SigningProcessBean xz:selects) {
//			System.out.println("Account_SigningProcessBean物件:"+xz.getAccount_Manger());
//        	System.out.println("Account_InvoiceBean物件:"+xz.getAccount_InvoiceBean().getPo_id());
//        	System.out.println("EmployeeBean物件:"+xz.getEmployeeBean().getEmp_name());
//         }

//		--------test:selectForInvid()------------
//		Account_SigningProcessIDao aspDao = context.getBean(Account_SigningProcessDao.class);
//		List<Account_SigningProcessBean> result = aspDao.selectForInvid("In20181013001");
//		if (!result.isEmpty()||result.size()>0) {
//			for (Account_SigningProcessBean bean : result) {
//				System.out.println("account_sta=" + bean.getAccount_Sta());
//				System.out.println("sig_Rank=" + bean.getSig_Rank());
//			}
//		} else {
//			System.out.println("無此紀錄");
//		}

//		--------test:selectForStatus()------------
//		 Account_SigningProcessIDao aspDao = context.getBean(Account_SigningProcessDao.class);
//		 List<Account_SigningProcessBean> result = aspDao.selectForStatus("申請中");
//		 if(!result.isEmpty()||result.size()>0) {
//			 for(Account_SigningProcessBean bean:result) {
//				System.out.println(bean.toString());
//			 }
//		 }else {
//			 System.out.println("查無紀錄");
//		 }

//		----------test:insert()-----------
//		Account_InvoiceIDao aiDao = context.getBean(Account_InvoiceDao.class);
//		Account_InvoiceBean aiVo = aiDao.select("In20181025001");
//		Account_SigningProcessIDao aspDao = context.getBean(Account_SigningProcessDao.class);
//		Set<Account_SigningProcessBean> processList = new HashSet<>();
//		Date today = new Date();
//		processList.add(new Account_SigningProcessBean("emp004", "採購請款",aiVo.getInv_id(), null, today.toString(), "已申請", 1));
//		processList.add(new Account_SigningProcessBean("emp005", "採購主管審核",aiVo.getInv_id(), null, null, "簽核中", 2));
//		processList.add(new Account_SigningProcessBean("emp009", "財務經理分派",aiVo.getInv_id(), null, null, null, 3));
//		processList.add(new Account_SigningProcessBean("emp008", "財務審核",aiVo.getInv_id(), null, null, null, 4));
//		processList.add(new Account_SigningProcessBean("emp009", "請款審核",aiVo.getInv_id(), null, null, null, 5));
//		
//		for(Account_SigningProcessBean bean:processList) {
//			Account_SigningProcessBean result = aspDao.insert(bean);
//			if(result!=null) {
//			System.out.println(result.toString());}
//			System.out.println("新增資料失敗");
//		}

//		----------test:update()-----------		
//		Account_SigningProcessDao aspDao = context.getBean(Account_SigningProcessDao.class);
//		Account_SigningProcessBean aspVo = aspDao.select("採購主管審核", "In20181025001");
//		System.out.println(aspVo.toString());
//		aspVo.setSig_Sta("已核准");
//		aspVo.setSig_Date(new Date());
//		aspVo.setSig_Sug("approval");
//		Account_SigningProcessBean result = aspDao.update(aspVo);
//		if (result != null) {
//			System.out.println(result.toString());
//		} else {
//			System.out.println("更新資料失敗");
//		}
//		----------test:select(String inv_id, Integer sig_Rank)-----------
		Account_SigningProcessDao aspDao = context.getBean(Account_SigningProcessDao.class);
		Account_SigningProcessBean bean = aspDao.selectForRank("In20181013001", 1);
		System.out.println(bean.toString());
		sessionFactory.getCurrentSession().getTransaction().commit();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Account_SigningProcessBean select(String account_Sta, String inv_id) {
		List<Account_SigningProcessBean> list = null;
		Account_SigningProcessBean getone = new Account_SigningProcessBean();
		String hgl = "FROM Account_SigningProcessBean WHERE account_Sta=:id1 AND inv_id=:id2";
		list = this.getSession().createQuery(hgl).setParameter("id1", account_Sta).setParameter("id2", inv_id)
				.setMaxResults(50).list();
		if (list.size() > 0) {
			for (Account_SigningProcessBean getones : list) {
				getone = getones;
			}
			return getone;
		} else {
			return null;
		}
		// return this.getSession().get(App_SigningProcessBean.class, id);
	}

	@Override
	public List<Account_SigningProcessBean> select() {
		return this.getSession().createQuery("from Account_SigningProcessBean", Account_SigningProcessBean.class)
				.setMaxResults(50).list();
	}

	@Override
	public List<Account_SigningProcessBean> selectForStatus(String account_Sta) {
		String hgl = "FROM Account_SigningProcessBean WHERE account_Sta=:id1";
		return this.getSession().createQuery(hgl).setParameter("id1", account_Sta).setMaxResults(50).list();

	}

	@Override
	public List<Account_SigningProcessBean> selectForInvid(String inv_id) {
		String hql = "FROM Account_SigningProcessBean WHERE inv_id=:id2";
		return this.getSession().createQuery(hql).setParameter("id2", inv_id).setMaxResults(50).list();

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Account_SigningProcessBean> selectInvidAndRank(String inv_id,Integer sig_rank) {
		String hql = "FROM Account_SigningProcessBean WHERE inv_id=:id1 and sig_rank<:id2 order by sig_rank";
		return this.getSession().createQuery(hql).setParameter("id1", inv_id).setParameter("id2", sig_rank).setMaxResults(50).list();
//查看前面的簽核意見
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Account_SigningProcessBean> selectStatus(String emp_id) {
		String hql = "FROM Account_SigningProcessBean WHERE account_manger=:id1";
		return this.getSession().createQuery(hql).setParameter("id1", emp_id).setMaxResults(50).list();
//查看請款單狀態********
	}

	@SuppressWarnings("unchecked")
	@Override

	public Account_SigningProcessBean insert(Account_SigningProcessBean bean) {
		List<Account_SigningProcessBean> list = null;
		String account_Sta = bean.getAccount_Sta();
		String inv_id = bean.getInv_id();
		String hgl = "FROM Account_SigningProcessBean WHERE account_Sta=:id1 AND inv_id=:id2";
		list = this.getSession().createQuery(hgl).setParameter("id1", account_Sta).setParameter("id2", inv_id)
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
	public Account_SigningProcessBean update(Account_SigningProcessBean bean) {
		String account_Sta = bean.getAccount_Sta();
		String inv_id = bean.getInv_id();
		String hgl = "FROM Account_SigningProcessBean WHERE account_Sta=:id1 AND inv_id=:id2";
		List<Account_SigningProcessBean> list = this.getSession().createQuery(hgl).setParameter("id1", account_Sta)
				.setParameter("id2", inv_id).setMaxResults(50).list();
		if (list.size() > 0) {
			for (Account_SigningProcessBean getones : list) {
				getones.setAccount_Manger(getones.getAccount_Manger());
				getones.setSig_Date(getones.getSig_Date());
				getones.setSig_Rank(getones.getSig_Rank());
				getones.setSig_Sta(getones.getSig_Sta());
				getones.setSig_Sug(getones.getSig_Sug());
			}
			return bean;
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(String account_Sta, String inv_id) {
		// App_SigningProcessBean temp =
		// this.getSession().get(App_SigningProcessBean.class, id);
		List<Account_SigningProcessBean> list = null;
		Account_SigningProcessBean getone = new Account_SigningProcessBean();
		String hgl = "FROM Account_SigningProcessBean WHERE account_Sta=:id1 AND inv_id=:id2";
		list = this.getSession().createQuery(hgl).setParameter("id1", account_Sta).setParameter("id2", inv_id)
				.setMaxResults(50).list();
		if (list.size() > 0) {
			for (Account_SigningProcessBean getones : list) {
				getone = getones;
			}
			this.getSession().delete(getone);
			return true;
		} else {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override                                   //找流程
	public List<Account_SigningProcessBean> selectProcess(String emp_id, String sig_sta, Integer sig_rank) {
		List<Account_SigningProcessBean> list = null;
		String hgl="FROM Account_SigningProcessBean where account_Manger=:id1 and sig_sta=:id2 and sig_rank=:id3";
		list =this.getSession().createQuery(hgl).setParameter("id1", emp_id).setParameter("id2", sig_sta).
				setParameter("id3", sig_rank).setMaxResults(50).list();
		
		if(list.size()>0) {
			return list;
		}else {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override                                   //採購人找被退回的請款單
	public List<Account_SigningProcessBean> select3send(String emp_id, String sig_sta, Integer sig_rank) {
		List<Account_SigningProcessBean> list = null;
		//from Account_SigningProcess where emp_id='' and Sig_Sta='退回中'  sigrank=1
		String hgl="FROM Account_SigningProcessBean where account_Manger=:id1 and sig_sta='退回中\r\n" + 
				"'  and sig_rank=:id3";
		list =this.getSession().createQuery(hgl).setParameter("id1", emp_id).
				setParameter("id3", sig_rank).setMaxResults(50).list();
		
		if(list.size()>0) {
			  return list;
		 }else {
			 return null;
		 }
	}
	
	@SuppressWarnings("unchecked")
	@Override                                  //採購主管找待審核的請款單
	public List<Account_SigningProcessBean> selectTodoSignInvoice(String emp_id, String sig_sta, Integer sig_rank) {
		List<Account_SigningProcessBean> list = null;
		//from Account_SigningProcess where emp_id='' and Sig_Sta='簽核中'  sig_rank=2
		String hgl="FROM Account_SigningProcessBean where account_Manger=:id1 and sig_sta='簽核中'  and sig_rank=:id3";
		list =this.getSession().createQuery(hgl).setParameter("id1", emp_id).
				setParameter("id3", sig_rank).setMaxResults(50).list();
		
		if(list.size()>0) {
			  return list;
		 }else {
			 return null;
		 }
	}

	@Override
	public Account_SigningProcessBean selectForRank(String inv_id, Integer sig_Rank) {
		String hql = "FROM Account_SigningProcessBean WHERE inv_id=:id1 AND sig_Rank=:id2";
			return (Account_SigningProcessBean)this.getSession().createQuery(hql).setParameter("id1", inv_id).setParameter("id2",sig_Rank).getSingleResult();
		}
	}

	
