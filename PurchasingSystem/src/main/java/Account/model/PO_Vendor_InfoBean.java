package Account.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

import Po.model.PO_MainBean;
import Po.model.PO_QueryBean;

@Entity
@Table(name = "PO_Vendor_Info")
public class PO_Vendor_InfoBean {
	@Expose
	private String vendor_id;
	@Expose
	private String vendor_name;
	@Expose
	private String vendor_contact_person;
	@Expose
	private String vendor_acc;
	@Expose
	private String payment_term;
	@Expose
	private String payment_method;
	@Expose
	private String vendor_email;


	private Set<PO_MainBean> pO_MainBean = new LinkedHashSet<>();
	private Set<Inv＿ProductCheckBean> inv＿ProductCheckBean = new LinkedHashSet<>();
	private Set<PO_QueryBean> pO_QueryBean = new LinkedHashSet<>();
	
	public PO_Vendor_InfoBean(String vendor_id, String vendor_name, String vendor_contact_person, String vendor_acc,
			String payment_term, String payment_method, String vendor_email) {
		super();
		this.vendor_id = vendor_id;
		this.vendor_name = vendor_name;
		this.vendor_contact_person = vendor_contact_person;
		this.vendor_acc = vendor_acc;
		this.payment_term = payment_term;
		this.payment_method = payment_method;
		this.vendor_email = vendor_email;
	}

	public PO_Vendor_InfoBean() {
		super();
	}
	
	@Id
	public String getVendor_id() {
		return vendor_id;
	}

	public void setVendor_id(String vendor_id) {
		this.vendor_id = vendor_id;
	}

	public String getVendor_name() {
		return vendor_name;
	}

	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}

	public String getVendor_contact_person() {
		return vendor_contact_person;
	}

	public void setVendor_contact_person(String vendor_contact_person) {
		this.vendor_contact_person = vendor_contact_person;
	}

	public String getVendor_acc() {
		return vendor_acc;
	}

	public void setVendor_acc(String vendor_acc) {
		this.vendor_acc = vendor_acc;
	}

	public String getPayment_term() {
		return payment_term;
	}

	public void setPayment_term(String payment_term) {
		this.payment_term = payment_term;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public String getVendor_email() {
		return vendor_email;
	}

	public void setVendor_email(String vendor_email) {
		this.vendor_email = vendor_email;
	}


	@OneToMany(mappedBy="pO_Vendor_InfoBean", cascade={CascadeType.MERGE})
	public Set<PO_MainBean> getpO_MainBean() {
		return pO_MainBean;
	}

	public void setpO_MainBean(Set<PO_MainBean> pO_MainBean) {
		this.pO_MainBean = pO_MainBean;
	}
	@OneToMany(mappedBy="pO_Vendor_InfoBean", cascade={CascadeType.MERGE})
	public Set<Inv＿ProductCheckBean> getInv＿ProductCheckBean() {
		return inv＿ProductCheckBean;
	}

	public void setInv＿ProductCheckBean(Set<Inv＿ProductCheckBean> inv＿ProductCheckBean) {
		this.inv＿ProductCheckBean = inv＿ProductCheckBean;
	}
	@OneToMany(mappedBy="pO_Vendor_InfoBean", cascade={CascadeType.MERGE})
	public Set<PO_QueryBean> getpO_QueryBean() {
		return pO_QueryBean;
	}

	public void setpO_QueryBean(Set<PO_QueryBean> pO_QueryBean) {
		this.pO_QueryBean = pO_QueryBean;
	}
	
	
}
