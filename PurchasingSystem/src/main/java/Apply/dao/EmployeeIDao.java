package Apply.dao;

import java.util.List;

import Apply.model.EmployeeBean;



public interface EmployeeIDao {
	public abstract EmployeeBean select(String id);

	public abstract List<EmployeeBean> select();

	public abstract EmployeeBean insert(EmployeeBean bean);

	public abstract EmployeeBean update(EmployeeBean bean);

	public abstract boolean delete(String id);
	public abstract EmployeeBean ApplyLogin (String emp_email, String emp_pwd);
	public abstract EmployeeBean AccountLogin (String emp_email, String emp_pwd);
	public abstract EmployeeBean POLogin (String emp_email, String emp_pwd);

	
	public abstract List<EmployeeBean> selectPoEmployee(String emp_dep, Integer emp_level);

	public abstract EmployeeBean InvLogin (String emp_email, String emp_pwd);
	public abstract EmployeeBean IndexLogin (String emp_email, String emp_pwd);


}
