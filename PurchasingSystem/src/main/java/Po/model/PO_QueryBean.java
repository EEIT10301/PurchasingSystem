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

import Account.model.PO_Vendor_InfoBean;
//PO_QueryUionPKID
@Entity
@Table(name = "PO_Query")
@IdClass(value=PO_QueryUionPKID.class)
public class PO_QueryBean {
private String po_ID;
private String	vendor_ID;
private java.util.Date	po_querydate;
private Integer	po_totalprice;
private PO_Vendor_InfoBean pO_Vendor_InfoBean;
private PO_MainBean pO_MainBean;
public PO_QueryBean(String po_ID, String vendor_ID, Date po_querydate, Integer po_totalprice) {
	super();
	this.po_ID = po_ID;
	this.vendor_ID = vendor_ID;
	this.po_querydate = po_querydate;
	this.po_totalprice = po_totalprice;
}
public PO_QueryBean() {
	super();
}
@Id
@Column
public String getPo_ID() {
	return po_ID;
}
public void setPo_ID(String po_ID) {
	this.po_ID = po_ID;
}
@Id
@Column
public String getVendor_ID() {
	return vendor_ID;
}
public void setVendor_ID(String vendor_ID) {
	this.vendor_ID = vendor_ID;
}
public java.util.Date getPo_querydate() {
	return po_querydate;
}
public void setPo_querydate(java.util.Date po_querydate) {
	this.po_querydate = po_querydate;
}
public Integer getPo_totalprice() {
	return po_totalprice;
}
public void setPo_totalprice(Integer po_totalprice) {
	this.po_totalprice = po_totalprice;
}
@ManyToOne(cascade=CascadeType.MERGE)
@JoinColumn(name="vendor_ID",insertable=false,updatable=false)
public PO_Vendor_InfoBean getpO_Vendor_InfoBean() {
	return pO_Vendor_InfoBean;
}
public void setpO_Vendor_InfoBean(PO_Vendor_InfoBean pO_Vendor_InfoBean) {
	this.pO_Vendor_InfoBean = pO_Vendor_InfoBean;
}
@ManyToOne(cascade=CascadeType.MERGE)
@JoinColumn(name="po_ID",insertable=false,updatable=false)
public PO_MainBean getpO_MainBean() {
	return pO_MainBean;
}
public void setpO_MainBean(PO_MainBean pO_MainBean) {
	this.pO_MainBean = pO_MainBean;
}

}
