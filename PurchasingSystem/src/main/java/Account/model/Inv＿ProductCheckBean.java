package Account.model;

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

import Apply.model.EmployeeBean;
import Inv.model.Inv_SigningProcessBean;
import Po.model.PO_MainBean;
@Entity
@Table(name = "Inv_ProductCheck")
public class Inv＿ProductCheckBean {
private String chk_Id;
private String po_ID;
private String emp_ID;
private Integer chk_Money;
private String chk_Comment;
private Integer total_price;
private String vender_ID;
private Accout_PayableBean accout_PayableBean;
private EmployeeBean employeeBean;
private Set<Inv_SigningProcessBean> inv_SigningProcessBean = new LinkedHashSet<>();
private PO_Vendor_InfoBean pO_Vendor_InfoBean;
private PO_MainBean pO_MainBean;
private Set<Inv_ProductListBean> inv_ProductListBean = new LinkedHashSet<>();
public Inv＿ProductCheckBean(String chk_Id, String po_ID, String emp_ID, Integer chk_Count, String chk_quality,
		Integer chk_Money, Date chk_Date, String chk_status, String chk_Comment) {
	super();
	this.chk_Id = chk_Id;
	this.po_ID = po_ID;
	this.emp_ID = emp_ID;
	this.chk_Money = chk_Money;
	this.chk_Comment = chk_Comment;
}

public Inv＿ProductCheckBean() {
	super();
}
@Id
@Column
public String getChk_Id() {
	return chk_Id;
}
public void setChk_Id(String chk_Id) {
	this.chk_Id = chk_Id;
}
@Column
public String getPo_ID() {
	return po_ID;
}

public void setPo_ID(String po_ID) {
	this.po_ID = po_ID;
}

@Column
public String getEmp_ID() {
	return emp_ID;
}

public void setEmp_ID(String emp_ID) {
	this.emp_ID = emp_ID;
}
public Integer getChk_Money() {
	return chk_Money;
}
public void setChk_Money(Integer chk_Money) {
	this.chk_Money = chk_Money;
}

public String getChk_Comment() {
	return chk_Comment;
}
public void setChk_Comment(String chk_Comment) {
	this.chk_Comment = chk_Comment;
}

public Integer getTotal_price() {
	return total_price;
}

public void setTotal_price(Integer total_price) {
	this.total_price = total_price;
}
@Column
public String getVender_ID() {
	return vender_ID;
}
public void setVender_ID(String vender_ID) {
	this.vender_ID = vender_ID;
}

@OneToOne(mappedBy="inv＿ProductCheckBean")
public Accout_PayableBean getAccout_PayableBean() {
	return accout_PayableBean;
}

public void setAccout_PayableBean(Accout_PayableBean accout_PayableBean) {
	this.accout_PayableBean = accout_PayableBean;
}
@ManyToOne(cascade=CascadeType.MERGE)
@JoinColumn(name="emp_ID",insertable=false,updatable=false)
public EmployeeBean getEmployeeBean() {
	return employeeBean;
}
public void setEmployeeBean(EmployeeBean employeeBean) {
	this.employeeBean = employeeBean;
}

@OneToMany(mappedBy="inv＿ProductCheckBean", cascade={CascadeType.MERGE})
public Set<Inv_SigningProcessBean> getInv_SigningProcessBean() {
	return inv_SigningProcessBean;
}

public void setInv_SigningProcessBean(Set<Inv_SigningProcessBean> inv_SigningProcessBean) {
	this.inv_SigningProcessBean = inv_SigningProcessBean;
}
@ManyToOne(cascade=CascadeType.MERGE)
@JoinColumn(name="vender_ID",insertable=false,updatable=false)
public PO_Vendor_InfoBean getpO_Vendor_InfoBean() {
	return pO_Vendor_InfoBean;
}

public void setpO_Vendor_InfoBean(PO_Vendor_InfoBean pO_Vendor_InfoBean) {
	this.pO_Vendor_InfoBean = pO_Vendor_InfoBean;
}
@OneToOne(cascade=CascadeType.MERGE)
@JoinColumn(name="po_ID",insertable=false,updatable=false)
public PO_MainBean getpO_MainBean() {
	return pO_MainBean;
}

public void setpO_MainBean(PO_MainBean pO_MainBean) {
	this.pO_MainBean = pO_MainBean;
}
@OneToMany(mappedBy="inv＿ProductCheckBean", cascade={CascadeType.MERGE})
public Set<Inv_ProductListBean> getInv_ProductListBean() {
	return inv_ProductListBean;
}

public void setInv_ProductListBean(Set<Inv_ProductListBean> inv_ProductListBean) {
	this.inv_ProductListBean = inv_ProductListBean;
}

}
