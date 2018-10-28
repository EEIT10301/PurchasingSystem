package Po.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import Account.model.Account_InvoiceBean;
import Account.model.Inv＿ProductCheckBean;
import Account.model.PO_Vendor_InfoBean;
import Apply.model.EmployeeBean;
@Entity
@Table(name = "PO_Main")
public class PO_MainBean {
private String po_id;
private String emp_id;
private String vendor_ID;
private java.util.Date shipping_Date;
private Integer total_price;
private EmployeeBean employeeBean;
private Set<PO_DetailBean> pO_DetailBean = new LinkedHashSet<>();
private PO_Vendor_InfoBean pO_Vendor_InfoBean;
private Set<PO_SigningProcessBean> pO_SigningProcessBean = new LinkedHashSet<>();
//private Set<Inv＿ProductCheckBean> inv＿ProductCheckBean = new LinkedHashSet<>();
private Inv＿ProductCheckBean inv＿ProductCheckBean;
private Account_InvoiceBean account_InvoiceBean;
private Set<PO_QueryBean> pO_QueryBean = new LinkedHashSet<>();

public PO_MainBean(String po_id, String emp_id, String vendor_ID, Date shipping_Date, Integer total_price) {
	super();
	this.po_id = po_id;
	this.emp_id = emp_id;
	this.vendor_ID = vendor_ID;
	this.shipping_Date = shipping_Date;
	this.total_price = total_price;
}
public PO_MainBean() {
	super();
}
@Id
@Column
public String getPo_id() {
	return po_id;
}

public void setPo_id(String po_id) {
	this.po_id = po_id;
}

@Column
public String getEmp_id() {
	return emp_id;
}

public void setEmp_id(String emp_id) {
	this.emp_id = emp_id;
}
@Column
public String getVendor_ID() {
	return vendor_ID;
}
public void setVendor_ID(String vendor_ID) {
	this.vendor_ID = vendor_ID;
}

public Integer getTotal_price() {
	return total_price;
}

public void setTotal_price(Integer total_price) {
	this.total_price = total_price;
}

public java.util.Date getShipping_Date() {
	return shipping_Date;
}
public void setShipping_Date(java.util.Date shipping_Date) {
	this.shipping_Date = shipping_Date;
}
@ManyToOne(cascade=CascadeType.MERGE)
@JoinColumn(name="emp_id",insertable=false,updatable=false)
public EmployeeBean getEmployeeBean() {
	return employeeBean;
}

public void setEmployeeBean(EmployeeBean employeeBean) {
	this.employeeBean = employeeBean;
}
@OneToMany(mappedBy="pO_MainBean", cascade={CascadeType.MERGE}) 
public Set<PO_DetailBean> getpO_DetailBean() {
	return pO_DetailBean;
}

public void setpO_DetailBean(Set<PO_DetailBean> pO_DetailBean) {
	this.pO_DetailBean = pO_DetailBean;
}
@ManyToOne(cascade=CascadeType.ALL)
@JoinColumn(name="vendor_ID",insertable=false,updatable=false)
public PO_Vendor_InfoBean getpO_Vendor_InfoBean() {
	return pO_Vendor_InfoBean;
}

public void setpO_Vendor_InfoBean(PO_Vendor_InfoBean pO_Vendor_InfoBean) {
	this.pO_Vendor_InfoBean = pO_Vendor_InfoBean;
}
@OneToMany(mappedBy="pO_MainBean", cascade={CascadeType.MERGE}) 
public Set<PO_SigningProcessBean> getpO_SigningProcessBean() {
	return pO_SigningProcessBean;
}

public void setpO_SigningProcessBean(Set<PO_SigningProcessBean> pO_SigningProcessBean) {
	this.pO_SigningProcessBean = pO_SigningProcessBean;
}
@OneToOne(mappedBy="pO_MainBean")
public Inv＿ProductCheckBean getInv＿ProductCheckBean() {
	return inv＿ProductCheckBean;
}

public void setInv＿ProductCheckBean(Inv＿ProductCheckBean inv＿ProductCheckBean) {
	this.inv＿ProductCheckBean = inv＿ProductCheckBean;
}
@OneToOne(mappedBy="pO_MainBean")
public Account_InvoiceBean getAccount_InvoiceBean() {
	return account_InvoiceBean;
}

public void setAccount_InvoiceBean(Account_InvoiceBean account_InvoiceBean) {
	this.account_InvoiceBean = account_InvoiceBean;
}
@OneToMany(mappedBy="pO_MainBean", cascade={CascadeType.MERGE}) 
public Set<PO_QueryBean> getpO_QueryBean() {
	return pO_QueryBean;
}
public void setpO_QueryBean(Set<PO_QueryBean> pO_QueryBean) {
	this.pO_QueryBean = pO_QueryBean;
}



}
