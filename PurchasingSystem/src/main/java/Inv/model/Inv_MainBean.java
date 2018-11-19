package Inv.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import Apply.model.AppDetailBean;
import Apply.model.ProductListBean;

@Entity
@Table(name = "Inv_Main")
public class Inv_MainBean {
private String inv_Part_no;
private String inv_Cate;
private String inv_Emp_Dep;
private Integer inv_Amount;
private ProductListBean productListBean;
//private Set<Inv_DetailBean> inv_DetailBean = new LinkedHashSet<>();


public Inv_MainBean(String inv_Part_no, String inv_Cate, String inv_Emp_Dep, Integer inv_Amount) {
	super();
	this.inv_Part_no = inv_Part_no;
	this.inv_Cate = inv_Cate;
	this.inv_Emp_Dep = inv_Emp_Dep;
	this.inv_Amount = inv_Amount;
}
public Inv_MainBean() {
	super();
}
@Id
public String getInv_Part_no() {
	return inv_Part_no;
}
public void setInv_Part_no(String inv_Part_no) {
	this.inv_Part_no = inv_Part_no;
}
public String getInv_Cate() {
	return inv_Cate;
}
public void setInv_Cate(String inv_Cate) {
	this.inv_Cate = inv_Cate;
}
public String getInv_Emp_Dep() {
	return inv_Emp_Dep;
}
public void setInv_Emp_Dep(String inv_Emp_Dep) {
	this.inv_Emp_Dep = inv_Emp_Dep;
}
public Integer getInv_Amount() {
	return inv_Amount;
}
public void setInv_Amount(Integer inv_Amount) {
	this.inv_Amount = inv_Amount;
}
@OneToOne(cascade=CascadeType.MERGE)
@JoinColumn(name="inv_Part_no",insertable=false,updatable=false)
public ProductListBean getProductListBean() {
	return productListBean;
}
public void setProductListBean(ProductListBean productListBean) {
	this.productListBean = productListBean;
}
//@OneToMany(mappedBy="inv_MainBean", cascade={CascadeType.MERGE})
//public Set<Inv_DetailBean> getInv_DetailBean() {
//	return inv_DetailBean;
//}
//public void setInv_DetailBean(Set<Inv_DetailBean> inv_DetailBean) {
//	this.inv_DetailBean = inv_DetailBean;
//}



}
