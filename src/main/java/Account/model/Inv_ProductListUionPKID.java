package Account.model;

import java.io.Serializable;

import javax.persistence.Column;



public class Inv_ProductListUionPKID implements Serializable{
	private static final long serialVersionUID = 1L;
	private String chk_Id;
	private String part_No;
	@Column
	public String getChk_Id() {
		return chk_Id;
	}
	public void setChk_Id(String chk_Id) {
		this.chk_Id = chk_Id;
	}
	@Column
	public String getPart_No() {
		return part_No;
	}
	public void setPart_No(String part_No) {
		this.part_No = part_No;
	}
	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof Inv_ProductListUionPKID){ 
        	Inv_ProductListUionPKID pk=(Inv_ProductListUionPKID)obj; 
            if(this.chk_Id.equals(pk.chk_Id)&&this.part_No.equals(pk.part_No)){ 
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
