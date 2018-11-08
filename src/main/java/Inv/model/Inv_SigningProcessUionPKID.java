package Inv.model;

import java.io.Serializable;

import javax.persistence.Column;

public class Inv_SigningProcessUionPKID implements Serializable{
	private static final long serialVersionUID = 1L;
	private String inv_Sta;
	private String chk_Id;
	
    @Column
	public String getInv_Sta() {
		return inv_Sta;
	}

	public void setInv_Sta(String inv_Sta) {
		this.inv_Sta = inv_Sta;
	}
	@Column
	public String getChk_Id() {
		return chk_Id;
	}

	public void setChk_Id(String chk_Id) {
		this.chk_Id = chk_Id;
	}

	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof Inv_SigningProcessUionPKID){ 
        	Inv_SigningProcessUionPKID pk=(Inv_SigningProcessUionPKID)obj; 
            if(this.inv_Sta.equals(pk.inv_Sta)&&this.chk_Id.equals(pk.chk_Id)){ 
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
