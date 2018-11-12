package Inv.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Apply.dao.ProductListIDAO;
import Apply.model.AppDetailBean;
import Apply.model.ProductListBean;
import Inv.dao.Inv_MainIDao;
import Inv.model.Inv_DetailBean;
import Inv.model.Inv_MainBean;
import Po.model.PO_DetailBean;
import misc.SpringJavaConfiguration;

@Repository
public class Inv_MainDao implements Inv_MainIDao{
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
		Inv_MainIDao productDAO = (Inv_MainIDao) context.getBean("inv_MainDao");
		List<Inv_MainBean> selects = productDAO.select();
//		Inv_MainBean xs =new  Inv_MainBean("part031","PC","研發部",500);
//		Inv_MainBean xs1 =new  Inv_MainBean("part032","PC","研發部",500);
//		Inv_MainBean xs2 =new  Inv_MainBean("part033","PC","研發部",500);
//		Inv_MainBean xs3 =new  Inv_MainBean("part034","PC","研發部",500);
//		Inv_MainBean xs4 =new  Inv_MainBean("part035","PC","研發部",500);
//		Inv_MainBean xs5 =new  Inv_MainBean("part036","零組件","研發部",500);
//		Inv_MainBean xs6 =new  Inv_MainBean("part037","零組件","研發部",500);
//		Inv_MainBean xs7 =new  Inv_MainBean("part038","零組件","研發部",500);
//		Inv_MainBean xs8 =new  Inv_MainBean("part039","零組件","研發部",500);
//		Inv_MainBean xs9 =new  Inv_MainBean("part040","零組件","研發部",500);
//
//		productDAO.insert(xs);
// 		productDAO.insert(xs1);
// 		productDAO.insert(xs2);
// 		productDAO.insert(xs3);
// 		productDAO.insert(xs4);
// 		productDAO.insert(xs5);
// 		productDAO.insert(xs6);
// 		productDAO.insert(xs7);
// 		productDAO.insert(xs8);
// 		productDAO.insert(xs9);
		
		System.out.println("selects="+selects);
         for(Inv_MainBean x:selects) {
        	System.out.println("1.驗收單主檔:"+x.getInv_Cate());
        	System.out.println("2.產品主檔:"+x.getProductListBean().getPro_name());
            for(Inv_DetailBean ss:x.getInv_DetailBean()) {
            	System.out.println("3.驗收細項:"+ss.getInv_Name());
            }
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}
	@Override
	public Inv_MainBean select(String id) {
		return this.getSession().get(Inv_MainBean.class, id);
	}

	@Override
	public List<Inv_MainBean> select() {
		return this.getSession().createQuery(
				"from Inv_MainBean", Inv_MainBean.class).setMaxResults(50).list();
	}

	@Override
	public Inv_MainBean insert(Inv_MainBean bean) {
		if(bean!=null) {
			Inv_MainBean temp = this.getSession().get(Inv_MainBean.class, bean.getInv_Part_no());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public Inv_MainBean update(Inv_MainBean bean) {
		this.getSession().merge(bean);
		return bean;
	}

	@Override
	public boolean delete(String id) {
		Inv_MainBean temp = this.getSession().get(Inv_MainBean.class, id);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Inv_MainBean> selectPage(Integer pageSize, Integer pageNo) {
		return this.getSession().createQuery(
	"from Inv_MainBean ").setFirstResult((pageNo - 1)* pageSize).setMaxResults(pageSize).list();
	}
	
}
