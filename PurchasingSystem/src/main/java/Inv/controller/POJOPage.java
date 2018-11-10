package Inv.controller;

import java.util.List;

import Inv.model.Inv_MainBean;

public class POJOPage {
    
    private int pageNumber;

    private int pageSize;

    private int totalRecord;

    private List<Inv_MainBean> data;
    
    private String path;
 
    public POJOPage(int pageNo, int pageSize, int totalRecord) {
        super();
        this.pageNumber = pageNo;
        this.pageSize = pageSize;
        this.totalRecord = totalRecord;
    }

    public int getPageNumber() {
        
            if(pageNumber < 1){
            return 1;
            }
       
            if(pageNumber > getTotalPage()){
                return getTotalPage();
            }
        
            return pageNumber;
        }

        public void setPageNumber(int pageNumber) {
            this.pageNumber = pageNumber;
        }
    
        public int getPageSize() {
            return pageSize;
        }

        public void setPageSize(int pageSize) {
            this.pageSize = pageSize;
        }
    
        public int getTotalPage() {

            if(getTotalRecord()%getPageSize()==0){
                return getTotalRecord()/getPageSize();
            }else{
                    return getTotalRecord()/getPageSize()+1;
            }
        }
    
        public int getTotalRecord() {
            return totalRecord;
        }
    
        public void setTotalRecord(int totalRecord) {
            this.totalRecord = totalRecord;
        }
    
        public int getIndex() {
            
            
            return (getPageNumber() - 1) * getPageSize();
        }
    
    
        public List<Inv_MainBean> getData() {
            return data;
        }
    
        public void setData(List<Inv_MainBean> data) {
            this.data = data;
        }
    
        public String getPath() {
            return path;
        }
    
        public void setPath(String path) {
            this.path = path;
        }
    
}


