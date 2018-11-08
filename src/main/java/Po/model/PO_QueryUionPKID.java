package Po.model;

import java.io.Serializable;

import javax.persistence.Column;

public class PO_QueryUionPKID implements Serializable{
	private static final long serialVersionUID = 1L;
	private String po_ID;
	private String	vendor_ID;
	@Column
	public String getPo_ID() {
		return po_ID;
	}
	public void setPo_ID(String po_ID) {
		this.po_ID = po_ID;
	}
	@Column
	public String getVendor_ID() {
		return vendor_ID;
	}
	public void setVendor_ID(String vendor_ID) {
		this.vendor_ID = vendor_ID;
	}
	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof PO_QueryUionPKID){ 
        	PO_QueryUionPKID pk=(PO_QueryUionPKID)obj; 
            if(this.po_ID.equals(pk.po_ID)&&this.vendor_ID.equals(pk.vendor_ID)){ 
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
