package emp.dao;

import java.util.List;

import emp.entities.Employee;

public interface EmployeeDAO {
	public List<Employee> getListEmployees();
	public boolean insertEmployee(Employee e);
}
