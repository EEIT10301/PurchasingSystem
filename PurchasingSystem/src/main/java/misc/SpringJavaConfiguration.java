package misc;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;

import Account.model.Account_InvoiceBean;
import Account.model.Account_SigningProcessBean;
import Account.model.Accout_PayableBean;
import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Account.model.PO_Vendor_InfoBean;
import Apply.model.AppDetailBean;
import Apply.model.App_MainBean;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Apply.model.ProductListBean;
import Inv.model.Inv_DetailBean;
import Inv.model.Inv_MainBean;
import Inv.model.Inv_SigningProcessBean;
import Po.model.PO_DetailBean;
import Po.model.PO_MainBean;
import Po.model.PO_QueryBean;
import Po.model.PO_SigningProcessBean;



@Configuration
@ComponentScan(basePackages={"Apply,Account,Po,Inv"})
public class SpringJavaConfiguration {
	
//	@Bean
//	public DataSource dataSource() {//不是用網頁測試的時候用的
//	    DriverManagerDataSource dmds =new DriverManagerDataSource();
//	    dmds.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//	    dmds.setUrl("jdbc:sqlserver://localhost:1433;database=PurchasingSystem");
//	    dmds.setUsername("sa");
//	    dmds.setPassword("passw0rd");
//		return dmds;
//	}        
	@Bean
	public DataSource dataSource() {
		JndiObjectFactoryBean factory = new JndiObjectFactoryBean();
		factory.setJndiName("java:comp/env/jdbc/xxx");
		factory.setProxyInterface(javax.sql.DataSource.class);
		try {
			factory.afterPropertiesSet();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return (DataSource) factory.getObject();
	}
	
	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder =
				new LocalSessionFactoryBuilder(dataSource());

		Properties props = new Properties();
		props.put("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
		props.put("hibernate.current_session_context_class", "thread");
		//props.put("hibernate.transaction.factory_class", "org.hibernate.transaction.JDBCTransactionFactory");
		props.put("hibernate.show_sql", "true");	
		props.put("hibernate.format_sql", "true");
		builder.addProperties(props);

		builder.addAnnotatedClass(EmployeeBean.class);
		builder.addAnnotatedClass(App_MainBean.class);
		builder.addAnnotatedClass(AppDetailBean.class);
		builder.addAnnotatedClass(ProductListBean.class);
		builder.addAnnotatedClass(App_SigningProcessBean.class);
		builder.addAnnotatedClass(PO_Vendor_InfoBean.class);
		builder.addAnnotatedClass(Account_InvoiceBean.class);
		builder.addAnnotatedClass(Accout_PayableBean.class);//Account_SigningProcessBean
		builder.addAnnotatedClass(Account_SigningProcessBean.class);//Inv＿ProductCheckBean
		builder.addAnnotatedClass(Inv＿ProductCheckBean.class);
		builder.addAnnotatedClass(PO_MainBean.class);
		builder.addAnnotatedClass(PO_DetailBean.class);
		builder.addAnnotatedClass(PO_SigningProcessBean.class);
		builder.addAnnotatedClass(Inv_MainBean.class);
		builder.addAnnotatedClass(Inv_DetailBean.class);
		builder.addAnnotatedClass(Inv_SigningProcessBean.class);
		builder.addAnnotatedClass(Inv_ProductListBean.class);
		builder.addAnnotatedClass(PO_QueryBean.class);
		return builder.buildSessionFactory();
	}

	public static void main(String[] args) throws Exception {
		ApplicationContext context =
				new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		
//		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
//		sessionFactory.getCurrentSession().beginTransaction();
//		Session session = sessionFactory.getCurrentSession();
//		CustomerBean select = session.get(CustomerBean.class, "Alex");
//		System.out.println("select="+select);
//		sessionFactory.getCurrentSession().getTransaction().commit();
	
//		DataSource dataSource = (DataSource) context.getBean("dataSource");
//		Connection conn = dataSource.getConnection();
//		Statement stmt = conn.createStatement();
//		ResultSet rset = stmt.executeQuery("select * from dept");
//		while(rset.next()) {
//			String col1 = rset.getString(1);
//			String col2 = rset.getString(2);
//			System.out.println(col1+":"+col2);
//		}				
		((ConfigurableApplicationContext)  context).close();
	}
}
