package Inv.model;

import java.io.Serializable;

import javax.persistence.Column;



public class Inv_DetailUionPKID implements Serializable{
	private static final long serialVersionUID = 1L;
	private String inv_Part_no;
	private String inv_Name;
	 @Column
	public String getInv_Part_no() {
		return inv_Part_no;
	}
	public void setInv_Part_no(String inv_Part_no) {
		this.inv_Part_no = inv_Part_no;
	}
	 @Column
	public String getInv_Name() {
		return inv_Name;
	}
	public void setInv_Name(String inv_Name) {
		this.inv_Name = inv_Name;
	}
	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof Inv_DetailUionPKID){ 
        	Inv_DetailUionPKID pk=(Inv_DetailUionPKID)obj; 
            if(this.inv_Part_no.equals(pk.inv_Part_no)&&this.inv_Name.equals(pk.inv_Name)){ 
                return true; 
            } 
        } 
        return false; 
    }

    @Override 
    public int hashCode() { 
        return super.hashCode(); 
    }
	
}
