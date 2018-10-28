package Apply.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "App_Main")
public class App_MainBean {
	private String app_id;
	private String emp_id;
	private String pro_cate;
	private Integer app_price;
	private EmployeeBean employeeBean;//請購主檔和員工作關聯 emp_id 1對多
	private Set<App_SigningProcessBean> app_SigningProcessBean = new LinkedHashSet<>();//請購簽核流程 1對多
	private Set<AppDetailBean> appDetailBean = new LinkedHashSet<>();//請購細項 多對一
	
	public App_MainBean(String app_id, String emp_id, String pro_cate, Integer app_price) {
		super();
		this.app_id = app_id;
		this.emp_id = emp_id;
		this.pro_cate = pro_cate;
		this.app_price = app_price;
	}
	public App_MainBean() {
		super();
	}
	@Id
	public String getApp_id() {
		return app_id;
	}
	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}
	@Column
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getPro_cate() {
		return pro_cate;
	}
	public void setPro_cate(String pro_cate) {
		this.pro_cate = pro_cate;
	}
	public Integer getApp_price() {
		return app_price;
	}
	public void setApp_price(Integer app_price) {
		this.app_price = app_price;
	}
	// 只有@OneToOne, @OneToMany 可以使用 orphanRemoval = true
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="emp_id",insertable=false,updatable=false)
	public EmployeeBean getEmployeeBean() {
		return employeeBean;
	}
	public void setEmployeeBean(EmployeeBean employeeBean) {
		this.employeeBean = employeeBean;
	}
	
	@OneToMany(mappedBy="app_MainBean", cascade={CascadeType.MERGE}) 
	public Set<App_SigningProcessBean> getApp_SigningProcessBean() {
		return app_SigningProcessBean;
	}
	public void setApp_SigningProcessBean(Set<App_SigningProcessBean> app_SigningProcessBean) {
		this.app_SigningProcessBean = app_SigningProcessBean;
	}
	
	@OneToMany(mappedBy="app_MainBean", cascade={CascadeType.MERGE}) 
	public Set<AppDetailBean> getAppDetailBean() {
		return appDetailBean;
	}
	public void setAppDetailBean(Set<AppDetailBean> appDetailBean) {
		this.appDetailBean = appDetailBean;
	}
	

}
