package Apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Apply.dao.EmployeeIDao;
import Apply.model.EmployeeBean;


@Service
@Transactional
public class EmployeeService {
@Autowired	
private EmployeeIDao employeeIDao;

public EmployeeBean select(String id) {
	EmployeeBean bean = employeeIDao.select(id);
	if(bean!=null) {
		return bean;
	}
	return null;
	
}
public List<EmployeeBean> select() {
	List<EmployeeBean> bean = employeeIDao.select();
	if(bean!=null) {
		return bean;
	}
	return null;
	
}
public EmployeeBean insert(EmployeeBean bean) {
	EmployeeBean beans = employeeIDao.insert(bean);
	if(beans!=null) {
		return beans;
	}
	return null;
	
}
public EmployeeBean update(EmployeeBean bean) {
	EmployeeBean beans = employeeIDao.update(bean);
	if(beans!=null) {
		return beans;
	}
	return null;
	
}
public boolean delete(String id) {
	boolean beans = employeeIDao.delete(id);
		return beans;	

	
}
public EmployeeBean ApplyLogin(String username, String password) {
	EmployeeBean bean = employeeIDao.ApplyLogin(username, password);
	if(bean!=null) {
		return bean;
	}
	return null;
	
}
public EmployeeBean AccountLogin(String username, String password) {
	EmployeeBean bean = employeeIDao.AccountLogin(username, password);
	if(bean!=null) {
		return bean;
	}
	return null;
}
public EmployeeBean POLogin(String username, String password) {
	EmployeeBean bean = employeeIDao.POLogin(username, password);
	if(bean!=null) {
		return bean;
	}
	return null;
}
}
