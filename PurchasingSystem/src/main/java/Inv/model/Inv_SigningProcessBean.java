package Inv.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import Account.model.Inv＿ProductCheckBean;
import Apply.model.EmployeeBean;



//Inv_SigningProcessUionPKID
@Entity
@Table(name = "Inv_SigningProcess")
@IdClass(value=Inv_SigningProcessUionPKID.class)
public class Inv_SigningProcessBean {
	private String inv_Manger;
	private String inv_Sta;
	private String chk_Id;
	private java.util.Date  sig_Date;
	private String sig_Sta;
	private String sig_Sug;
	private Integer sig_Rank;
	
	private EmployeeBean employeeBean;
	private Inv＿ProductCheckBean inv＿ProductCheckBean;
	public Inv_SigningProcessBean(String inv_Manger, String inv_Sta, String chk_Id, Date sig_Date, String sig_Sta,
			String sig_Sug, Integer sig_Rank) {
		super();
		this.inv_Manger = inv_Manger;
		this.inv_Sta = inv_Sta;
		this.chk_Id = chk_Id;
		this.sig_Date = sig_Date;
		this.sig_Sta = sig_Sta;
		this.sig_Sug = sig_Sug;
		this.sig_Rank = sig_Rank;
	}
	
	public Inv_SigningProcessBean() {
		super();
	}
    
    @Column
	public String getInv_Manger() {
		return inv_Manger;
	}
	public void setInv_Manger(String inv_Manger) {
		this.inv_Manger = inv_Manger;
	}
	@Id
	public String getInv_Sta() {
		return inv_Sta;
	}
	public void setInv_Sta(String inv_Sta) {
		this.inv_Sta = inv_Sta;
	}
	@Id
	@Column
	public String getChk_Id() {
		return chk_Id;
	}
	
	public void setChk_Id(String chk_Id) {
		this.chk_Id = chk_Id;
	}

	public java.util.Date getSig_Date() {
		return sig_Date;
	}

	public void setSig_Date(java.util.Date sig_Date) {
		this.sig_Date = sig_Date;
	}
	public String getSig_Sta() {
		return sig_Sta;
	}
	public void setSig_Sta(String sig_Sta) {
		this.sig_Sta = sig_Sta;
	}
	public String getSig_Sug() {
		return sig_Sug;
	}
	public void setSig_Sug(String sig_Sug) {
		this.sig_Sug = sig_Sug;
	}
	public Integer getSig_Rank() {
		return sig_Rank;
	}
	public void setSig_Rank(Integer sig_Rank) {
		this.sig_Rank = sig_Rank;
	}
	
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="inv_Manger",insertable=false,updatable=false)
	public EmployeeBean getEmployeeBean() {
		return employeeBean;
	}

	public void setEmployeeBean(EmployeeBean employeeBean) {
		this.employeeBean = employeeBean;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="chk_Id",insertable=false,updatable=false)
	public Inv＿ProductCheckBean getInv＿ProductCheckBean() {
		return inv＿ProductCheckBean;
	}

	public void setInv＿ProductCheckBean(Inv＿ProductCheckBean inv＿ProductCheckBean) {
		this.inv＿ProductCheckBean = inv＿ProductCheckBean;
	}

	
	

}
