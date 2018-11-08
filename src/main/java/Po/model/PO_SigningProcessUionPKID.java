package Po.model;

import java.io.Serializable;

import javax.persistence.Column;

public class PO_SigningProcessUionPKID implements Serializable{
	private static final long serialVersionUID = 1L;

	private String po_sta;
	private String po_id;
    
	@Column
	public String getPo_sta() {
		return po_sta;
	}

	public void setPo_sta(String po_sta) {
		this.po_sta = po_sta;
	}
	@Column
	public String getPo_id() {
		return po_id;
	}

	public void setPo_id(String po_id) {
		this.po_id = po_id;
	}

	@Override 
    public boolean equals(Object obj) { 
        if(obj instanceof PO_SigningProcessUionPKID){ 
        	PO_SigningProcessUionPKID pk=(PO_SigningProcessUionPKID)obj; 
            if(this.po_sta.equals(pk.po_sta)&&this.po_id.equals(pk.po_id)){ 
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
