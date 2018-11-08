package Apply.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;



@Entity
@Table(name = "App_Detail")
@IdClass(value=AppDetailBeanUionPKID.class)
public class AppDetailBean {
	@Expose
	private String app_id;
	@Expose
	private String part_no;
	@Expose
	private Integer pro_price;
	@Expose
	private Integer app_amount;
	@Expose
	private App_MainBean app_MainBean;
	@Expose
	private ProductListBean productListBean;
	public AppDetailBean() {
		super();
	}

	public AppDetailBean(String app_id, String part_no, Integer pro_price, Integer app_amount) {
		super();
		this.app_id = app_id;
		this.part_no = part_no;
		this.pro_price = pro_price;
		this.app_amount = app_amount;
	}
    @Id
    @Column
	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}
	@Id
	@Column
	public String getPart_no() {
		return part_no;
	}

	public void setPart_no(String part_no) {
		this.part_no = part_no;
	}

	public Integer getPro_price() {
		return pro_price;
	}

	public void setPro_price(Integer pro_price) {
		this.pro_price = pro_price;
	}

	public Integer getApp_amount() {
		return app_amount;
	}

	public void setApp_amount(Integer app_amount) {
		this.app_amount = app_amount;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="app_id",insertable=false,updatable=false)	
	public App_MainBean getApp_MainBean() {
		return app_MainBean;
	}
	
	public void setApp_MainBean(App_MainBean app_MainBean) {
		this.app_MainBean = app_MainBean;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="part_no",insertable=false,updatable=false)
	public ProductListBean getProductListBean() {
		return productListBean;
	}
		
	public void setProductListBean(ProductListBean productListBean) {
		this.productListBean = productListBean;
	}
	
}
