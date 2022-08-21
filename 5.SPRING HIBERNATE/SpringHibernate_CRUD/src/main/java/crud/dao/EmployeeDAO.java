package crud.dao;

import java.util.List;

import crud.entities.Employee;

public interface EmployeeDAO {
	public List<Employee> getEmployees();
	public boolean insertEmployee(Employee e);
	public Employee getEmployeeById(Long empId);
	public boolean deleteEmployee(Long empId);
	public boolean updateEmployee(Employee emp);
	public List<Employee> getEmployeesByName(String name);
}
