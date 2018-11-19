package Inv.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Inv_Detail")
//@IdClass(value=Inv_DetailUionPKID.class)
public class Inv_DetailBean {
private String inv_Part_no;
private String inv_Name;
private Integer inv_Amount;
//@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
private java.util.Date inv__Date;
private String inv_Intr;
private String inv_Part;
private String inv_Spe;
private Integer inv_Amounts;
//private Inv_MainBean inv_MainBean;
public Inv_DetailBean(String inv_Part_no, String inv_Name, Integer inv_Amount, Date inv__Date, String inv_Intr,
		String inv_Part, String inv_Spe) {
	super();
	this.inv_Part_no = inv_Part_no;
	this.inv_Name = inv_Name;
	this.inv_Amount = inv_Amount;
	this.inv__Date = inv__Date;
	this.inv_Intr = inv_Intr;
	this.inv_Part = inv_Part;
	this.inv_Spe = inv_Spe;
	//this.inv_Amounts = inv_Amounts;
}

public Inv_DetailBean() {
	super();
}

public String getInv_Part_no() {
	return inv_Part_no;
}
public void setInv_Part_no(String inv_Part_no) {
	this.inv_Part_no = inv_Part_no;
}

public String getInv_Name() {
	return inv_Name;
}
public void setInv_Name(String inv_Name) {
	this.inv_Name = inv_Name;
}
public Integer getInv_Amount() {
	return inv_Amount;
}
public void setInv_Amount(Integer inv_Amount) {
	this.inv_Amount = inv_Amount;
}

public java.util.Date getInv__Date() {
	return inv__Date;
}
public void setInv__Date(java.util.Date inv__Date) {
	this.inv__Date = inv__Date;
}
public String getInv_Intr() {
	return inv_Intr;
}
public void setInv_Intr(String inv_Intr) {
	this.inv_Intr = inv_Intr;
}
public String getInv_Part() {
	return inv_Part;
}
public void setInv_Part(String inv_Part) {
	this.inv_Part = inv_Part;
}
public String getInv_Spe() {
	return inv_Spe;
}
public void setInv_Spe(String inv_Spe) {
	this.inv_Spe = inv_Spe;
}
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
public Integer getInv_Amounts() {
	return inv_Amounts;
}
public void setInv_Amounts(Integer inv_Amounts) {
	this.inv_Amounts = inv_Amounts;
}
//@ManyToOne(cascade=CascadeType.MERGE)
//@JoinColumn(name="inv_Part_no",insertable=false,updatable=false)
//public Inv_MainBean getInv_MainBean() {
//	return inv_MainBean;
//}
//
//public void setInv_MainBean(Inv_MainBean inv_MainBean) {
//	this.inv_MainBean = inv_MainBean;
//}


}
