package Apply.model;

import java.io.Serializable;

import javax.persistence.Column;



public class App_SigningProcessUionPKID implements Serializable {
	private static final long serialVersionUID = 1L;
	private String app_sta;
	private String app_id;
	
    @Column
	public String getApp_sta() {
		return app_sta;
	}

	public void setApp_sta(String app_sta) {
		this.app_sta = app_sta;
	}
	@Column
	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}

	@Override 
	    public boolean equals(Object obj) { 
	        if(obj instanceof App_SigningProcessUionPKID){ 
	        	App_SigningProcessUionPKID pk=(App_SigningProcessUionPKID)obj; 
	            if(this.app_sta.equals(pk.app_sta)&&this.app_id.equals(pk.app_id)){ 
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
