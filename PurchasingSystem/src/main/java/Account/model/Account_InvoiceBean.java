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

import org.springframework.format.annotation.DateTimeFormat;

import Apply.model.EmployeeBean;
import Po.model.PO_MainBean;

@Entity
@Table(name = "Account_Invoice")
public class Account_InvoiceBean {
	private String inv_id;
	//@DateTimeFormat(pattern="yyyy/MM/dd")
	private java.util.Date recript_date;
	private String recript_pic;
	// private String vendor_id;
	// private String vendor_name;
	private String po_id;
	private String emp_id;
	//private String emp_name;
	private Integer total_price;
	//private PO_Vendor_InfoBean pO_Vendor_InfoBean;
	private EmployeeBean employeeBean;
	private Accout_PayableBean accout_PayableBean;
	private Set<Account_SigningProcessBean> account_SigningProcessBean = new LinkedHashSet<>();
	private PO_MainBean pO_MainBean;

	public Account_InvoiceBean(String inv_id, Date recript_date, String recript_pic, String po_id, String emp_id,
			Integer total_price) {
		super();
		this.inv_id = inv_id;
		this.recript_date = recript_date;
		this.recript_pic = recript_pic;
		this.po_id = po_id;
		this.emp_id = emp_id;
		this.total_price = total_price;
	}

	public Account_InvoiceBean() {
		super();
	}

	@Override
	public String toString() {
		return "Account_InvoiceBean [inv_id=" + inv_id + ", recript_date=" + recript_date + ", recript_pic="
				+ recript_pic + ", po_id=" + po_id + ", emp_id=" + emp_id + ", total_price=" + total_price + "]";
	}

	@Id
	@Column
	public String getInv_id() {
		return inv_id;
	}

	public void setInv_id(String inv_id) {
		this.inv_id = inv_id;
	}

	public java.util.Date getRecript_date() {
		return recript_date;
	}

	public void setRecript_date(java.util.Date recript_date) {
		this.recript_date = recript_date;
	}

	public String getRecript_pic() {
		return recript_pic;
	}

	public void setRecript_pic(String recript_pic) {
		this.recript_pic = recript_pic;
	}

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

	public Integer getTotal_price() {
		return total_price;
	}

	public void setTotal_price(Integer total_price) {
		this.total_price = total_price;
	}

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "emp_id", insertable = false, updatable = false)
	public EmployeeBean getEmployeeBean() {
		return employeeBean;
	}

	public void setEmployeeBean(EmployeeBean employeeBean) {
		this.employeeBean = employeeBean;
	}

	@OneToOne(mappedBy = "account_InvoiceBean")
	public Accout_PayableBean getAccout_PayableBean() {
		return accout_PayableBean;
	}

	public void setAccout_PayableBean(Accout_PayableBean accout_PayableBean) {
		this.accout_PayableBean = accout_PayableBean;
	}

	@OneToMany(mappedBy = "account_InvoiceBean", cascade = { CascadeType.MERGE })
	public Set<Account_SigningProcessBean> getAccount_SigningProcessBean() {
		return account_SigningProcessBean;
	}

	public void setAccount_SigningProcessBean(Set<Account_SigningProcessBean> account_SigningProcessBean) {
		this.account_SigningProcessBean = account_SigningProcessBean;
	}

	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "po_id", insertable = false, updatable = false)
	public PO_MainBean getpO_MainBean() {
		return pO_MainBean;
	}

	public void setpO_MainBean(PO_MainBean pO_MainBean) {
		this.pO_MainBean = pO_MainBean;
	}

}
