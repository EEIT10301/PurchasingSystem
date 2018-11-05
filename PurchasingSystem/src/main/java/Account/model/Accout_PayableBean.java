package Account.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

//Accout_Payable
@Entity
@Table(name = "Account_Payable")
public class Accout_PayableBean {
	private String accoutpayable_no;
	private Integer amount_Payable;
	private java.util.Date booking_Date;
//private String	payment_Method;
//private String	remittance_account;
	private String cheque_no;
//private String	applicant_ID;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private java.util.Date except_Payment_Date;
	private String payable_Status;
	private Integer amount_Paid;
	private String inv_id;
	private String chk_Id;
	private Account_InvoiceBean account_InvoiceBean;
	private Inv＿ProductCheckBean inv＿ProductCheckBean;

	@Override
	public String toString() {
		return "Accout_PayableBean [accoutpayable_no=" + accoutpayable_no + ", amount_Payable=" + amount_Payable
				+ ", booking_Date=" + booking_Date + ", cheque_no=" + cheque_no + ", except_Payment_Date="
				+ except_Payment_Date + ", payable_Status=" + payable_Status + ", amount_Paid=" + amount_Paid
				+ ", inv_id=" + inv_id + ", chk_Id=" + chk_Id + "]";
	}

	public Accout_PayableBean(String accoutpayable_no, Integer amount_Payable, Date booking_Date, String cheque_no,
			Date except_Payment_Date, String payable_Status, Integer amount_Paid, String inv_id, String chk_Id) {
		super();
		this.accoutpayable_no = accoutpayable_no;
		this.amount_Payable = amount_Payable;
		this.booking_Date = booking_Date;
		this.cheque_no = cheque_no;
		this.except_Payment_Date = except_Payment_Date;
		this.payable_Status = payable_Status;
		this.amount_Paid = amount_Paid;
		this.inv_id = inv_id;
		this.chk_Id = chk_Id;
	}

	public Accout_PayableBean() {
		super();
	}

	@Id
	public String getAccoutpayable_no() {
		return accoutpayable_no;
	}

	public void setAccoutpayable_no(String accoutpayable_no) {
		this.accoutpayable_no = accoutpayable_no;
	}

	public Integer getAmount_Payable() {
		return amount_Payable;
	}

	public void setAmount_Payable(Integer amount_Payable) {
		this.amount_Payable = amount_Payable;
	}

	public java.util.Date getBooking_Date() {
		return booking_Date;
	}

	public void setBooking_Date(java.util.Date booking_Date) {
		this.booking_Date = booking_Date;
	}

	public String getCheque_no() {
		return cheque_no;
	}

	public void setCheque_no(String cheque_no) {
		this.cheque_no = cheque_no;
	}

	public java.util.Date getExcept_Payment_Date() {
		return except_Payment_Date;
	}

	public void setExcept_Payment_Date(java.util.Date except_Payment_Date) {
		this.except_Payment_Date = except_Payment_Date;
	}

	public String getPayable_Status() {
		return payable_Status;
	}

	public void setPayable_Status(String payable_Status) {
		this.payable_Status = payable_Status;
	}

	public Integer getAmount_Paid() {
		return amount_Paid;
	}

	public void setAmount_Paid(Integer amount_Paid) {
		this.amount_Paid = amount_Paid;
	}

//@Column
	public String getInv_id() {
		return inv_id;
	}

	public void setInv_id(String inv_id) {
		this.inv_id = inv_id;
	}

	public String getChk_Id() {
		return chk_Id;
	}

	public void setChk_Id(String chk_Id) {
		this.chk_Id = chk_Id;
	}

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "inv_id", insertable = false, updatable = false, unique = true)
	public Account_InvoiceBean getAccount_InvoiceBean() {
		return account_InvoiceBean;
	}

	public void setAccount_InvoiceBean(Account_InvoiceBean account_InvoiceBean) {
		this.account_InvoiceBean = account_InvoiceBean;
	}

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "chk_Id", insertable = false, updatable = false)
	public Inv＿ProductCheckBean getInv＿ProductCheckBean() {
		return inv＿ProductCheckBean;
	}

	public void setInv＿ProductCheckBean(Inv＿ProductCheckBean inv＿ProductCheckBean) {
		this.inv＿ProductCheckBean = inv＿ProductCheckBean;
	}

}
