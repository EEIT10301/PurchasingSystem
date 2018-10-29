package Account.model;

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

@Entity
@Table(name = "Account_SigningProcess")
@IdClass(value = Account_SigningProcessUionPKID.class)
public class Account_SigningProcessBean {
	private String account_Manger; // 簽核流程角色
	private String account_Sta; // 簽核固定流程
	private String inv_id; // 關聯的採購單
	private java.util.Date sig_Date; // 流程完成時間(submit)
	private String sig_Sta; // 完成流程狀態(submit)
	private String sig_Sug; // 流程comment
	private Integer sig_Rank; // 流程順序
	private Account_InvoiceBean account_InvoiceBean;
	private EmployeeBean employeeBean;

	public Account_SigningProcessBean(String account_Manger, String account_Sta, String inv_id, Date sig_Date,
			String sig_Sta, String sig_Sug, Integer sig_Rank) {
		super();
		this.account_Manger = account_Manger;
		this.account_Sta = account_Sta;
		this.inv_id = inv_id;
		this.sig_Date = sig_Date;
		this.sig_Sta = sig_Sta;
		this.sig_Sug = sig_Sug;
		this.sig_Rank = sig_Rank;
	}

	public Account_SigningProcessBean() {
		super();
	}

	@Override
	public String toString() {
		return "Account_SigningProcessBean [account_Manger=" + account_Manger + ", account_Sta=" + account_Sta
				+ ", inv_id=" + inv_id + ", sig_Date=" + sig_Date + ", sig_Sta=" + sig_Sta + ", sig_Sug=" + sig_Sug
				+ ", sig_Rank=" + sig_Rank + "]";
	}

	@Column
	public String getAccount_Manger() {
		return account_Manger;
	}

	public void setAccount_Manger(String account_Manger) {
		this.account_Manger = account_Manger;
	}

	@Id
	public String getAccount_Sta() {
		return account_Sta;
	}

	public void setAccount_Sta(String account_Sta) {
		this.account_Sta = account_Sta;
	}

	@Id
	@Column
	public String getInv_id() {
		return inv_id;
	}

	public void setInv_id(String inv_id) {
		this.inv_id = inv_id;
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

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "inv_id", insertable = false, updatable = false)
	public Account_InvoiceBean getAccount_InvoiceBean() {
		return account_InvoiceBean;
	}

	public void setAccount_InvoiceBean(Account_InvoiceBean account_InvoiceBean) {
		this.account_InvoiceBean = account_InvoiceBean;
	}

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "account_Manger", insertable = false, updatable = false)
	public EmployeeBean getEmployeeBean() {
		return employeeBean;
	}

	public void setEmployeeBean(EmployeeBean employeeBean) {
		this.employeeBean = employeeBean;
	}

}
