package Apply.model;

import java.io.Serializable;

import javax.persistence.Column;

public class AppDetailBeanUionPKID implements Serializable{
	private static final long serialVersionUID = 1L;
	private String app_id;
	private String part_no;
	
    @Column
	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}
	@Column
	public String getPart_no() {
		return part_no;
	}

	public void setPart_no(String part_no) {
		this.part_no = part_no;
	}

	@Override 
	    public boolean equals(Object obj) { 
	        if(obj instanceof AppDetailBeanUionPKID){ 
	        	AppDetailBeanUionPKID pk=(AppDetailBeanUionPKID)obj; 
	            if(this.app_id.equals(pk.app_id)&&this.part_no.equals(pk.part_no)){ 
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
