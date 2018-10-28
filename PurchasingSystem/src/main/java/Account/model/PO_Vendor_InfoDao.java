package Account.model;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import Apply.dao.ProductListIDAO;
import Apply.model.ProductListBean;
import Po.model.PO_MainBean;
import Po.model.PO_QueryBean;
import misc.SpringJavaConfiguration;

@Repository
public class PO_Vendor_InfoDao implements PO_Vendor_InfoIDao {
	
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
		PO_Vendor_InfoIDao productDAO = (PO_Vendor_InfoIDao) context.getBean("PO_Vendor_InfoDao");
		List<PO_Vendor_InfoBean> selects = productDAO.select();
//   PO_Vendor_InfoBean xs =new PO_Vendor_InfoBean("ven004","蘇州大明電子有限公司","陳嘉嘉","124541","月結","V120","tref@gmail.com");
//   PO_Vendor_InfoBean xs1 =new PO_Vendor_InfoBean("ven005","蘇州齊周電子有限公司","路東","124541d","季結","Z120","Sref@gmail.com");
//   PO_Vendor_InfoBean xs2 =new PO_Vendor_InfoBean("ven006","BEIJING PEOPLE GREAT TECHNOL","李文順","124541","月結","V120","treDDf@gmail.com");
//   PO_Vendor_InfoBean xs3 =new PO_Vendor_InfoBean("ven007","MOST (GUANGZHOU)MAGNET INDUSTRIAL CO","林水壘","1ssD24541","月結","V120","DtreSf@gmail.com");
//   PO_Vendor_InfoBean xs4 =new PO_Vendor_InfoBean("ven008","克拉瑪電子科技股份有限公司","金少康","124Dd7541","季結","Z120","trefD@gmail.com");
//   PO_Vendor_InfoBean xs5 =new PO_Vendor_InfoBean("ven009","ARTICAL ELECTRONIC (SHENZHEN) CO.,LT","邱佳績","12DE4Dd7541","月結","Z120","78trefD@gmail.com");
//   PO_Vendor_InfoBean xs6 =new PO_Vendor_InfoBean("ven010","矽統科技股份有限公司","梁超群","A124Dd75S41","季結","Z120","FtDDrefD@gmail.com");
//   PO_Vendor_InfoBean xs7 =new PO_Vendor_InfoBean("ven011","LEE TOM PLASTIC ELECTRONIC(WU JIAN","李小芬","A124Dd7S541","月結","Z120","StreDfD@gmail.com");
//   productDAO.insert(xs);
//   productDAO.insert(xs1);
//   productDAO.insert(xs2);
//   productDAO.insert(xs3);
//   productDAO.insert(xs4);
//   productDAO.insert(xs5);
//   productDAO.insert(xs6);
//   productDAO.insert(xs7);
		System.out.println("selects="+selects);
         for(PO_Vendor_InfoBean x:selects) {
        	 System.out.println("1.PO_Vendor_InfoBean物件:"+x.getVendor_email());
        	 
        	 for(PO_MainBean ss:x.getpO_MainBean()) {
        		 System.out.println("2.PO_MainBean物件:"+ss.getShipping_Date());
        	 }
        	 for(PO_QueryBean ss:x.getpO_QueryBean()) {
        		 System.out.println("3.PO_Query物件:"+ss.getVendor_ID());
        	 }
         }
		sessionFactory.getCurrentSession().getTransaction().commit();
	}

	@Override
	public PO_Vendor_InfoBean select(String id) {
		return this.getSession().get(PO_Vendor_InfoBean.class, id);
	}

	@Override
	public List<PO_Vendor_InfoBean> select() {
		return this.getSession().createQuery(
				"from PO_Vendor_InfoBean", PO_Vendor_InfoBean.class).setMaxResults(50).list();
	}

	@Override
	public PO_Vendor_InfoBean insert(PO_Vendor_InfoBean bean) {
		if(bean!=null) {
			PO_Vendor_InfoBean temp = this.getSession().get(PO_Vendor_InfoBean.class, bean.getVendor_id());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public PO_Vendor_InfoBean update(PO_Vendor_InfoBean bean) {
//		PO_Vendor_InfoBean temp = this.getSession().get(PO_Vendor_InfoBean.class, bean.getVendor_id());
//		if(temp!=null) {
//			temp=bean;
//		}
//		return temp;
		this.getSession().merge(bean);
		return bean;
	}

	@Override
	public boolean delete(String id) {
		PO_Vendor_InfoBean temp = this.getSession().get(PO_Vendor_InfoBean.class, id);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

}
