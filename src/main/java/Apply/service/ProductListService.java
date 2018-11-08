package Apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Apply.dao.ProductListIDAO;

import Apply.model.ProductListBean;

@Service
//@Transactional
public class ProductListService {
	@Autowired	
	private ProductListIDAO productListIDAO;
	public  ProductListBean select(String id) {
		ProductListBean bean = productListIDAO.select(id);
		if(bean!=null) {
			return bean;
		}
		return null;
	}

	public  List<ProductListBean> select(){
		List<ProductListBean> bean = productListIDAO.select();
		if(bean.size()!=0) {
			return bean;
		}
		return null;
	}

	public  ProductListBean insert(ProductListBean bean) {
		ProductListBean beans = productListIDAO.insert(bean);
		if(beans!=null) {
			return beans;
		}
		return null;
	}

	public ProductListBean update(ProductListBean bean) {
		ProductListBean beans = productListIDAO.update(bean);
		if(beans!=null) {
			return beans;
		}
		return null;

	}
	public  boolean delete(String id) {
		boolean beans = productListIDAO.delete(id);
		return beans;
		
	}
	public  List<ProductListBean> selectCate(String pro_cate){
		List<ProductListBean> bean = productListIDAO.selectCate(pro_cate);
		if(bean.size()!=0) {
			return bean;
		}
		return null;
	
	}
	public  List<ProductListBean> selectAll(){
		List<ProductListBean> bean = productListIDAO.selectAll();
		if(bean.size()!=0) {
			return bean;
		}
		return null;
	
	}
}
