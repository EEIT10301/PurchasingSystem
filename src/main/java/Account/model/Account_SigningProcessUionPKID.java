package Account.model;

import java.io.Serializable;

import javax.persistence.Column;



public class Account_SigningProcessUionPKID implements Serializable{
	private static final long serialVersionUID = 1L;
	private String account_Sta;
	private String inv_id;
	
   
	@Column
	public String getAccount_Sta() {
		return account_Sta;
	}

	public void setAccount_Sta(String account_Sta) {
		this.account_Sta = account_Sta;
	}

	@Column
	public String getInv_id() {
		return inv_id;
	}

	public void setInv_id(String inv_id) {
		this.inv_id = inv_id;
	}

	@Override 
	    public boolean equals(Object obj) { 
	        if(obj instanceof Account_SigningProcessUionPKID){ 
	        	Account_SigningProcessUionPKID pk=(Account_SigningProcessUionPKID)obj; 
	            if(this.account_Sta.equals(pk.account_Sta)&&this.inv_id.equals(pk.inv_id)){ 
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
