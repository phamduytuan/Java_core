package pagination.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pagination.dao.StudentDAO;
import pagination.entities.Student;

@Repository
public class StudentDAOImpl implements StudentDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Student> getStudents(Integer offset, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Student")
			.setFirstResult(offset)
			.setMaxResults(maxResult)
			.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public Long getTotalStudents() {
		Session session = sessionFactory.openSession();
		try {
			Long total = (long) session.createQuery("from Student").list().size();
			return total;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

}
