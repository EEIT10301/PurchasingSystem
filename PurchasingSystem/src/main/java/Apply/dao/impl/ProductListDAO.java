package Apply.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Account.model.Inv_ProductListBean;
import Apply.dao.ProductListIDAO;
import Apply.model.AppDetailBean;
import Apply.model.ProductListBean;
import Inv.model.Inv_MainBean;
import Po.model.PO_DetailBean;
import misc.SpringJavaConfiguration;

@Repository
public class ProductListDAO implements ProductListIDAO {
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
		ProductListIDAO productDAO = (ProductListIDAO) context.getBean("productListDAO");
		
		List<ProductListBean> selects = productDAO.select();
		System.out.println("selects="+selects);
         for(ProductListBean x:selects) {
        	 System.out.println("1.產品table:"+x.getPro_cate());
        	
        	 for(AppDetailBean ss:x.getAppDetailBean()) {
        		 System.out.println("2.請購細項table:"+ss.getApp_amount());
        	 }
        	 for(PO_DetailBean ss:x.getpO_DetailBean()) {
        		 System.out.println("3.採購細項table:"+ss.getMarket_Price());
        	 }
        	 System.out.println("4.入庫主檔table:"+x.getInv_MainBean().getInv_Part_no());
        	 for(Inv_ProductListBean ss:x.getInv_ProductListBean()) {
        		 System.out.println("5.驗收單細項table:"+ss.getChk_Count());
        	 }
        	
        	 
         }
//         java.util.Date date = new java.util.Date();
// 		java.sql.Date datas =new java.sql.Date(date.getTime());
// 		ProductListBean xs=new ProductListBean("part031","PC","電源線,韓規","PX0501111121111","500V 0.75/3 BK",200,500,null,datas);
// 		ProductListBean xs1=new ProductListBean("part032","PC","電源線 /500V","PX0501111121112","(3.5 立體)",200,500,null,datas);
// 		ProductListBean xs2=new ProductListBean("part033","PC","電源線 歐+韓 ","PX0501111121113","IS14 H05VV-F 3G CT12(Black)",200,500,null,datas);
// 		ProductListBean xs3=new ProductListBean("part034","PC","音源線","PX0501111121114","歐+韓 ",200,500,null,datas);
// 		ProductListBean xs4=new ProductListBean("part035","PC","USB 訊號線","PX0501111121115","FCAT",200,500,null,datas);
// 		ProductListBean xs5=new ProductListBean("part036","零組件","後蓋","PX6411258191111","MEL23MT",200,500,null,datas);
// 		ProductListBean xs6=new ProductListBean("part037","零組件","前蓋(絹印)","PX6411258191112","MEL23MT",200,500,null,datas);
// 		ProductListBean xs7=new ProductListBean("part038","零組件","頸架  ","PX6411258191113","MEL23MT",200,500,null,datas);
// 		ProductListBean xs8=new ProductListBean("part039","零組件","底座","PX6411258191114","MEL23MT",200,500,null,datas);
// 		ProductListBean xs9=new ProductListBean("part040","零組件","頸架KK2","PX6411258191115","MEL23MT",200,500,null,datas);
// 		productDAO.insert(xs);
// 		productDAO.insert(xs1);
// 		productDAO.insert(xs2);
// 		productDAO.insert(xs3);
// 		productDAO.insert(xs4);
// 		productDAO.insert(xs5);
// 		productDAO.insert(xs6);
// 		productDAO.insert(xs7);
// 		productDAO.insert(xs8);
// 		productDAO.insert(xs9);
			sessionFactory.getCurrentSession().getTransaction().commit();
	
		 
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductListBean> selectPage(Integer pageSize, Integer pageNo) {
		return this.getSession().createQuery(
	"from ProductListBean ").setFirstResult((pageNo - 1)* pageSize).setMaxResults(pageSize).list();
	}
	
	@Override
	public ProductListBean select(String id) {
		return this.getSession().get(ProductListBean.class, id);
	}

	@Override
	public List<ProductListBean> select() {
		return this.getSession().createQuery(
				"from ProductListBean", ProductListBean.class).setMaxResults(500).list();
	}

	@Override
	public ProductListBean insert(ProductListBean bean) {
		if(bean!=null) {
			ProductListBean temp = this.getSession().get(ProductListBean.class, bean.getPart_no());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public ProductListBean update(ProductListBean bean) {
		this.getSession().merge(bean);
//		ProductListBean temp = this.getSession().get(ProductListBean.class, bean.getPart_no());
//		if(temp!=null) {
//			temp=bean;
//		}
//		return temp;
		return bean;
	}

	@Override
	public boolean delete(String id) {
		ProductListBean temp = this.getSession().get(ProductListBean.class, id);
		if(temp!=null) {
			try {	
				this.getSession().delete(temp);
				sessionFactory.getCurrentSession().getTransaction().commit();
			}catch (Exception e) {
				e.printStackTrace();
				sessionFactory.getCurrentSession().getTransaction().rollback();
			}
				sessionFactory.getCurrentSession().beginTransaction();
				ProductListBean temp2 = this.getSession().get(ProductListBean.class, id);
				if(temp2!=null) {
					return false;
				}
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductListBean> selectCate(String pro_cate) {
		List<ProductListBean> list = null;
		String hgl="FROM ProductListBean WHERE pro_cate=:id1 ";
		list =this.getSession().createQuery(hgl).setParameter("id1", pro_cate)
				.setMaxResults(50).list();
		 if(list.size()>0) {
		
			  return list;
		 }else {
			 return null;
		 }
	
	}

	@Override
	public List<ProductListBean> selectAll() {
		List<ProductListBean>ProductList= this.getSession().createQuery(
				"from ProductListBean", ProductListBean.class).setMaxResults(50).list();
//		this.getSession().getTransaction().commit();
//		sessionFactory.getCurrentSession().beginTransaction();
		return ProductList;
	}
	

}
