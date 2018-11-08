package Apply.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

import Account.model.Inv_ProductListBean;
import Inv.model.Inv_MainBean;
import Po.model.PO_DetailBean;

@Entity
@Table(name = "ProductList")
public class ProductListBean {
	@Expose
	private String part_no;
	@Expose
	private String pro_cate;
	@Expose
	private String pro_name;
	@Expose
	private String pro_spe;
	@Expose
	private String pro_intro;
	@Expose
	private Integer pro_price;
	@Expose
	private Integer pro_amount;
	@Expose
	private String pro_img;
	@Expose
	private java.util.Date pro_date;
	private Set<AppDetailBean> appDetailBean = new LinkedHashSet<>();
	
	private Set<PO_DetailBean> pO_DetailBean = new LinkedHashSet<>();
	
	private Inv_MainBean inv_MainBean;
	
	private Set<Inv_ProductListBean> inv_ProductListBean = new LinkedHashSet<>();
	
	public ProductListBean(String part_no, String pro_cate, String pro_name, String pro_spe, String pro_intro,
			Integer pro_price, Integer pro_amount, String pro_img, Date pro_date) {
		super();
		this.part_no = part_no;
		this.pro_cate = pro_cate;
		this.pro_name = pro_name;
		this.pro_spe = pro_spe;
		this.pro_intro = pro_intro;
		this.pro_price = pro_price;
		this.pro_amount = pro_amount;
		this.pro_img = pro_img;
		this.pro_date = pro_date;
	}

	public ProductListBean() {
		super();
	}
	
	@Id
	@Column
	public String getPart_no() {
		return part_no;
	}
	public void setPart_no(String part_no) {
		this.part_no = part_no;
	}
	public String getPro_cate() {
		return pro_cate;
	}
	public void setPro_cate(String pro_cate) {
		this.pro_cate = pro_cate;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_spe() {
		return pro_spe;
	}
	public void setPro_spe(String pro_spe) {
		this.pro_spe = pro_spe;
	}
	public String getPro_intro() {
		return pro_intro;
	}
	public void setPro_intro(String pro_intro) {
		this.pro_intro = pro_intro;
	}
	public Integer getPro_price() {
		return pro_price;
	}
	public void setPro_price(Integer pro_price) {
		this.pro_price = pro_price;
	}
	public Integer getPro_amount() {
		return pro_amount;
	}
	public void setPro_amount(Integer pro_amount) {
		this.pro_amount = pro_amount;
	}
	public String getPro_img() {
		return pro_img;
	}
	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}
	public java.util.Date getPro_date() {
		return pro_date;
	}
	public void setPro_date(java.util.Date pro_date) {
		this.pro_date = pro_date;
	}
	
	@OneToMany(mappedBy="productListBean", cascade={CascadeType.MERGE})
	public Set<AppDetailBean> getAppDetailBean() {
		return appDetailBean;
	}
	public void setAppDetailBean(Set<AppDetailBean> appDetailBean) {
		this.appDetailBean = appDetailBean;
	}
	@OneToMany(mappedBy="productListBean", cascade={CascadeType.MERGE})
	public Set<PO_DetailBean> getpO_DetailBean() {
		return pO_DetailBean;
	}
	public void setpO_DetailBean(Set<PO_DetailBean> pO_DetailBean) {
		this.pO_DetailBean = pO_DetailBean;
	}
	@OneToOne(mappedBy="productListBean")
	public Inv_MainBean getInv_MainBean() {
		return inv_MainBean;
	}
	public void setInv_MainBean(Inv_MainBean inv_MainBean) {
		this.inv_MainBean = inv_MainBean;
	}
	@OneToMany(mappedBy="productListBean", cascade={CascadeType.MERGE})
	public Set<Inv_ProductListBean> getInv_ProductListBean() {
		return inv_ProductListBean;
	}
	public void setInv_ProductListBean(Set<Inv_ProductListBean> inv_ProductListBean) {
		this.inv_ProductListBean = inv_ProductListBean;
	}
	
	
}
