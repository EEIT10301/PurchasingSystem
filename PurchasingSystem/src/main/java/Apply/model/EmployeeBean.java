package Apply.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import Account.model.Account_InvoiceBean;
import Account.model.Account_SigningProcessBean;
import Account.model.Inv＿ProductCheckBean;
import Inv.model.Inv_SigningProcessBean;
import Po.model.PO_MainBean;

@Entity
@Table(name = "Employee")
public class EmployeeBean {
private String emp_id;
private String emp_name;
private Integer emp_level;
private String emp_dep;
private String emp_job;
private java.util.Date emp_hiredate;
private String emp_gender;
private String emp_email;
private String emp_pwd;
private String emp_managerid;
private Integer emp_appauth;
private Set<App_MainBean> app_MainBean = new LinkedHashSet<>();
private Set<App_SigningProcessBean> app_SigningProcessBean = new LinkedHashSet<>();
private Set<Account_InvoiceBean> account_InvoiceBean = new LinkedHashSet<>();
private Set<Account_SigningProcessBean> account_SigningProcessBean = new LinkedHashSet<>();
private Set<Inv＿ProductCheckBean> inv＿ProductCheckBean = new LinkedHashSet<>();
private Set<PO_MainBean> pO_MainBean = new LinkedHashSet<>();
private Set<Inv_SigningProcessBean> inv_SigningProcessBean = new LinkedHashSet<>();


public EmployeeBean(String emp_id, String emp_name, Integer emp_level, String emp_dep, String emp_job,
		Date emp_hiredate, String emp_gender, String emp_email, String emp_pwd, String emp_managerid,
		Integer emp_appauth) {
	super();
	this.emp_id = emp_id;
	this.emp_name = emp_name;
	this.emp_level = emp_level;
	this.emp_dep = emp_dep;
	this.emp_job = emp_job;
	this.emp_hiredate = emp_hiredate;
	this.emp_gender = emp_gender;
	this.emp_email = emp_email;
	this.emp_pwd = emp_pwd;
	this.emp_managerid = emp_managerid;
	this.emp_appauth = emp_appauth;
}
public EmployeeBean() {
	super();
}
@Id
public String getEmp_id() {
	return emp_id;
}
public void setEmp_id(String emp_id) {
	this.emp_id = emp_id;
}
public String getEmp_name() {
	return emp_name;
}
public void setEmp_name(String emp_name) {
	this.emp_name = emp_name;
}
public Integer getEmp_level() {
	return emp_level;
}
public void setEmp_level(Integer emp_level) {
	this.emp_level = emp_level;
}
public String getEmp_dep() {
	return emp_dep;
}
public void setEmp_dep(String emp_dep) {
	this.emp_dep = emp_dep;
}
public String getEmp_job() {
	return emp_job;
}
public void setEmp_job(String emp_job) {
	this.emp_job = emp_job;
}

public java.util.Date getEmp_hiredate() {
	return emp_hiredate;
}
public void setEmp_hiredate(java.util.Date emp_hiredate) {
	this.emp_hiredate = emp_hiredate;
}
public String getEmp_gender() {
	return emp_gender;
}
public void setEmp_gender(String emp_gender) {
	this.emp_gender = emp_gender;
}
public String getEmp_email() {
	return emp_email;
}
public void setEmp_email(String emp_email) {
	this.emp_email = emp_email;
}
public String getEmp_pwd() {
	return emp_pwd;
}
public void setEmp_pwd(String emp_pwd) {
	this.emp_pwd = emp_pwd;
}
public String getEmp_managerid() {
	return emp_managerid;
}
public void setEmp_managerid(String emp_managerid) {
	this.emp_managerid = emp_managerid;
}

public Integer getEmp_appauth() {
	return emp_appauth;
}
public void setEmp_appauth(Integer emp_appauth) {
	this.emp_appauth = emp_appauth;
}
@OneToMany(mappedBy="employeeBean", cascade={CascadeType.MERGE}) 
public Set<Account_InvoiceBean> getAccount_InvoiceBean() {
	return account_InvoiceBean;
}
public void setAccount_InvoiceBean(Set<Account_InvoiceBean> account_InvoiceBean) {
	this.account_InvoiceBean = account_InvoiceBean;
}
@OneToMany(mappedBy="employeeBean", cascade={CascadeType.MERGE}) 
public Set<Account_SigningProcessBean> getAccount_SigningProcessBean() {
	return account_SigningProcessBean;
}
public void setAccount_SigningProcessBean(Set<Account_SigningProcessBean> account_SigningProcessBean) {
	this.account_SigningProcessBean = account_SigningProcessBean;
}
@OneToMany(mappedBy="employeeBean", cascade={CascadeType.MERGE}) 
public Set<Inv＿ProductCheckBean> getInv＿ProductCheckBean() {
	return inv＿ProductCheckBean;
}
public void setInv＿ProductCheckBean(Set<Inv＿ProductCheckBean> inv＿ProductCheckBean) {
	this.inv＿ProductCheckBean = inv＿ProductCheckBean;
}
@OneToMany(mappedBy="employeeBean", cascade={CascadeType.MERGE}) 
public Set<App_MainBean> getApp_MainBean() {
	return app_MainBean;
}
public void setApp_MainBean(Set<App_MainBean> app_MainBean) {
	this.app_MainBean = app_MainBean;
}
@OneToMany(mappedBy="employeeBean", cascade={CascadeType.MERGE}) 
public Set<App_SigningProcessBean> getApp_SigningProcessBean() {
	return app_SigningProcessBean;
}
public void setApp_SigningProcessBean(Set<App_SigningProcessBean> app_SigningProcessBean) {
	this.app_SigningProcessBean = app_SigningProcessBean;
}
@OneToMany(mappedBy="employeeBean", cascade={CascadeType.MERGE}) 
public Set<PO_MainBean> getpO_MainBean() {
	return pO_MainBean;
}
public void setpO_MainBean(Set<PO_MainBean> pO_MainBean) {
	this.pO_MainBean = pO_MainBean;
}
@OneToMany(mappedBy="employeeBean", cascade={CascadeType.MERGE})
public Set<Inv_SigningProcessBean> getInv_SigningProcessBean() {
	return inv_SigningProcessBean;
}
public void setInv_SigningProcessBean(Set<Inv_SigningProcessBean> inv_SigningProcessBean) {
	this.inv_SigningProcessBean = inv_SigningProcessBean;
}




}
