package Inv.model;

import java.io.Serializable;

import javax.persistence.Column;



public class Inv_DetailUionPKID implements Serializable{
	private static final long serialVersionUID = 1L;
	private String inv_Part_no;
	private String inv__Date;
	 @Column
	public String getInv_Part_no() {
			return inv_Part_no;
		}



		public void setInv_Part_no(String inv_Part_no) {
			this.inv_Part_no = inv_Part_no;
		}


		@Column
		public String getInv__Date() {
			return inv__Date;
		}



		public void setInv__Date(String inv__Date) {
			this.inv__Date = inv__Date;
		}
	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof Inv_DetailUionPKID){ 
        	Inv_DetailUionPKID pk=(Inv_DetailUionPKID)obj; 
            if(this.inv_Part_no.equals(pk.inv_Part_no)&&this.inv__Date.equals(pk.inv__Date)){ 
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
