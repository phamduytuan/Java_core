package emp.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import emp.dao.EmployeeDAO;
import emp.entities.Employee;
@Repository
public class EmployeeDAOImpl implements EmployeeDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Employee> getListEmployees() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Employee").list();
			return list;
		} catch (Exception e) {
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
			e1.printStackTrace();		
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

}
