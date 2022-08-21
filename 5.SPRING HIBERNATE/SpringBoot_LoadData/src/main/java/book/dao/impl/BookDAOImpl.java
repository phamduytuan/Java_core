package book.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import book.dao.BookDAO;
import book.entities.Book;

@Repository
public class BookDAOImpl implements BookDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Book> getBooks() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Book").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

}
