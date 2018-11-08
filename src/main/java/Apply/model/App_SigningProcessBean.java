package Apply.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "App_SigningProcess")
@IdClass(value=App_SigningProcessUionPKID.class) 
public class App_SigningProcessBean {
private String app_manger;
private String app_sta;
private String app_id;
private java.util.Date sig_date;
private String sig_sta;
private String sig_sug;
private Integer sig_rank;
private App_MainBean app_MainBean;
private EmployeeBean employeeBean;
public App_SigningProcessBean(String app_manger, String app_sta, String app_id, Date sig_date, String sig_sta,
		String sig_sug, Integer sig_rank) {
	super();
	this.app_manger = app_manger;
	this.app_sta = app_sta;
	this.app_id = app_id;
	this.sig_date = sig_date;
	this.sig_sta = sig_sta;
	this.sig_sug = sig_sug;
	this.sig_rank = sig_rank;
}
public App_SigningProcessBean() {
	super();
}

@Column
public String getApp_manger() {
	return app_manger;
}
public void setApp_manger(String app_manger) {
	this.app_manger = app_manger;
}
@Id
public String getApp_sta() {
	return app_sta;
}
public void setApp_sta(String app_sta) {
	this.app_sta = app_sta;
}
@Id
@Column
public String getApp_id() {
	return app_id;
}
public void setApp_id(String app_id) {
	this.app_id = app_id;
}
public java.util.Date getSig_date() {
	return sig_date;
}
public void setSig_date(java.util.Date sig_date) {
	this.sig_date = sig_date;
}
public String getSig_sta() {
	return sig_sta;
}
public void setSig_sta(String sig_sta) {
	this.sig_sta = sig_sta;
}
public String getSig_sug() {
	return sig_sug;
}
public void setSig_sug(String sig_sug) {
	this.sig_sug = sig_sug;
}
public Integer getSig_rank() {
	return sig_rank;
}
public void setSig_rank(Integer sig_rank) {
	this.sig_rank = sig_rank;
}
@ManyToOne(cascade=CascadeType.MERGE)//加上all將無法delete
@JoinColumn(name="app_id",insertable=false,updatable=false)	
public App_MainBean getApp_MainBean() {
	return app_MainBean;
}
public void setApp_MainBean(App_MainBean app_MainBean) {
	this.app_MainBean = app_MainBean;
}
@ManyToOne(cascade=CascadeType.MERGE)//加上cascade將無法delete
@JoinColumn(name="app_manger",insertable=false,updatable=false)	
public EmployeeBean getEmployeeBean() {
	return employeeBean;
}
public void setEmployeeBean(EmployeeBean employeeBean) {
	this.employeeBean = employeeBean;
}


}
