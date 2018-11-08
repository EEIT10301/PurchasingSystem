package Po.model;

import java.io.Serializable;

import javax.persistence.Column;


public class PO_DetailUionPKID implements Serializable {
	private static final long serialVersionUID = 1L;
	private String po_id;
	private String part_No;
	@Column
	public String getPo_id() {
		return po_id;
	}
	
	public void setPo_id(String po_id) {
		this.po_id = po_id;
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
	        if(obj instanceof PO_DetailUionPKID){ 
	        	PO_DetailUionPKID pk=(PO_DetailUionPKID)obj; 
	            if(this.po_id.equals(pk.po_id)&&this.part_No.equals(pk.part_No)){ 
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
