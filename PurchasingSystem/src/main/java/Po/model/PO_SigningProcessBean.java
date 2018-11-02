package Po.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import Apply.model.EmployeeBean;

//PO_SigningProcessUionPKID
@Entity
@Table(name = "PO_SigningProcess")
@IdClass(value=PO_SigningProcessUionPKID.class)
public class PO_SigningProcessBean {
private String po_manger;
private String po_sta;
private String po_id;
private java.util.Date sig_date;
private String sig_sta;
private String sig_sug;
private Integer sig_rank;
private PO_MainBean pO_MainBean;
private EmployeeBean employeeBean;


@Override
public String toString() {
	return "PO_SigningProcessBean [po_manger=" + po_manger + ", po_sta=" + po_sta + ", po_id=" + po_id + ", sig_date="
			+ sig_date + ", sig_sta=" + sig_sta + ", sig_sug=" + sig_sug + ", sig_rank=" + sig_rank + "]";
}

public PO_SigningProcessBean(String po_manger, String po_sta, String po_id, Date sig_date, String sig_sta,
		String sig_sug, Integer sig_rank) {
	super();
	this.po_manger = po_manger;
	this.po_sta = po_sta;
	this.po_id = po_id;
	this.sig_date = sig_date;
	this.sig_sta = sig_sta;
	this.sig_sug = sig_sug;
	this.sig_rank = sig_rank;
}

public PO_SigningProcessBean() {
	super();
}


@Column
public String getPo_manger() {
	return po_manger;
}
public void setPo_manger(String po_manger) {
	this.po_manger = po_manger;
}
@Id
public String getPo_sta() {
	return po_sta;
}
public void setPo_sta(String po_sta) {
	this.po_sta = po_sta;
}
@Id
@Column
public String getPo_id() {
	return po_id;
}
public void setPo_id(String po_id) {
	this.po_id = po_id;
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

@ManyToOne(cascade=CascadeType.MERGE)
@JoinColumn(name="po_id",insertable=false,updatable=false)
public PO_MainBean getpO_MainBean() {
	return pO_MainBean;
}
public void setpO_MainBean(PO_MainBean pO_MainBean) {
	this.pO_MainBean = pO_MainBean;
}
@ManyToOne(cascade=CascadeType.MERGE)
@JoinColumn(name="po_manger",insertable=false,updatable=false)
public EmployeeBean getEmployeeBean() {
	return employeeBean;
}
public void setEmployeeBean(EmployeeBean employeeBean) {
	this.employeeBean = employeeBean;
}


}
