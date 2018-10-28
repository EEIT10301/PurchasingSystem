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

import Apply.model.ProductListBean;

//Inv_ProductListUionPKID
@Entity
@Table(name = "Inv_ProductList")
@IdClass(value=Inv_ProductListUionPKID.class)
public class Inv_ProductListBean {
	private String chk_Id;
	private String part_No;
	private Integer chk_Count;
	private String chk_quality;
	private java.util.Date chk_Date;
	private String chk_status;
	private Inv＿ProductCheckBean inv＿ProductCheckBean;
	private ProductListBean productListBean;
	public Inv_ProductListBean(String chk_Id, String part_No, Integer chk_Count, String chk_quality, Date chk_Date,
			String chk_status) {
		super();
		this.chk_Id = chk_Id;
		this.part_No = part_No;
		this.chk_Count = chk_Count;
		this.chk_quality = chk_quality;
		this.chk_Date = chk_Date;
		this.chk_status = chk_status;
	}
	public Inv_ProductListBean() {
		super();
	}
	@Id
	@Column
	public String getChk_Id() {
		return chk_Id;
	}
	public void setChk_Id(String chk_Id) {
		this.chk_Id = chk_Id;
	}
	@Id
	public String getPart_No() {
		return part_No;
	}
	public void setPart_No(String part_No) {
		this.part_No = part_No;
	}
	public Integer getChk_Count() {
		return chk_Count;
	}
	public void setChk_Count(Integer chk_Count) {
		this.chk_Count = chk_Count;
	}
	public String getChk_quality() {
		return chk_quality;
	}
	public void setChk_quality(String chk_quality) {
		this.chk_quality = chk_quality;
	}
	public java.util.Date getChk_Date() {
		return chk_Date;
	}
	public void setChk_Date(java.util.Date chk_Date) {
		this.chk_Date = chk_Date;
	}
	public String getChk_status() {
		return chk_status;
	}
	public void setChk_status(String chk_status) {
		this.chk_status = chk_status;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="chk_Id",insertable=false,updatable=false)
	public Inv＿ProductCheckBean getInv＿ProductCheckBean() {
		return inv＿ProductCheckBean;
	}
	public void setInv＿ProductCheckBean(Inv＿ProductCheckBean inv＿ProductCheckBean) {
		this.inv＿ProductCheckBean = inv＿ProductCheckBean;
	}
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="part_No",insertable=false,updatable=false)
	public ProductListBean getProductListBean() {
		return productListBean;
	}
	public void setProductListBean(ProductListBean productListBean) {
		this.productListBean = productListBean;
	}
	
	
}
