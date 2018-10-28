package Po.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import Apply.model.ProductListBean;

//PO_Detail
@Entity
@Table(name = "PO_Detail")
@IdClass(value=PO_DetailUionPKID.class)
public class PO_DetailBean {
private String po_id;
private String part_No;
private Integer market_Price;
private Integer quotation;
private Integer total_Price;
private Integer total_Qty;
private PO_MainBean pO_MainBean;
private ProductListBean productListBean;

public PO_DetailBean(String po_id, String part_No, Integer market_Price, Integer quotation, Integer total_Price,
		Integer total_Qty) {
	super();
	this.po_id = po_id;
	this.part_No = part_No;
	this.market_Price = market_Price;
	this.quotation = quotation;
	this.total_Price = total_Price;
	this.total_Qty = total_Qty;
}

public PO_DetailBean() {
	super();
}

@Id
@Column
public String getPo_id() {
	return po_id;
}
public void setPo_id(String po_id) {
	this.po_id = po_id;
}
@Id
@Column
public String getPart_No() {
	return part_No;
}
public void setPart_No(String part_No) {
	this.part_No = part_No;
}

public Integer getMarket_Price() {
	return market_Price;
}
public void setMarket_Price(Integer market_Price) {
	this.market_Price = market_Price;
}
public Integer getQuotation() {
	return quotation;
}
public void setQuotation(Integer quotation) {
	this.quotation = quotation;
}
public Integer getTotal_Price() {
	return total_Price;
}
public void setTotal_Price(Integer total_Price) {
	this.total_Price = total_Price;
}
public Integer getTotal_Qty() {
	return total_Qty;
}
public void setTotal_Qty(Integer total_Qty) {
	this.total_Qty = total_Qty;
}
@ManyToOne(cascade=CascadeType.MERGE)
@JoinColumn(name="po_id",insertable=false,updatable=false)
public PO_MainBean getpO_MainBean() {
	return pO_MainBean;
}
public void setpO_MainBean(PO_MainBean pO_MainBean) {
	this.pO_MainBean = pO_MainBean;
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
