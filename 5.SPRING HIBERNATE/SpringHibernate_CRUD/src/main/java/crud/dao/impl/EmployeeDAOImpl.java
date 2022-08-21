package crud.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import crud.dao.EmployeeDAO;
import crud.entities.Employee;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Employee> getEmployees() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Employee").list();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertEmployee(Employee e) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(e);
			session.getTransaction().commit();
			return true;
		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public Employee getEmployeeById(Long empId) {
		Session session = sessionFactory.openSession();
		try {
			Employee employee = session.get(Employee.class, empId);
			return employee;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean deleteEmployee(Long empId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getEmployeeById(empId));
			session.getTransaction().commit();
			return true;
		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean updateEmployee(Employee emp) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(emp);
			session.getTransaction().commit();
			return true;
		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public List<Employee> getEmployeesByName(String name) {
		Session session = sessionFactory.openSession();
		try {
			if(name==null || name.length()==0)
				name = "%";
			else
				name = "%"+name+"%";
			
			List list = session.createQuery("from Employee where empName like :name")
					.setParameter("name", name)
					.list();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

}
