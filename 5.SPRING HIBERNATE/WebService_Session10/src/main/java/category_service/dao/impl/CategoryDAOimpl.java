package category_service.dao.impl;

import java.util.List;

import org.hibernate.Session;

import category_service.dao.CategoryDAO;
import category_service.entity.Category;
import category_service.hibernate.util.HibernateUtil;

public class CategoryDAOimpl implements CategoryDAO{

	@Override
	public List<Category> getCategories() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			List list = session.createQuery("from Category").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	
	public static void main(String[] args) {
		System.out.println(new CategoryDAOimpl().getCategories().size());
	}

	@Override
	public Category getCategoryById(String cateId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Category category = session.get(Category.class, cateId);
			return  category;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertCategory(Category cate) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(cate);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean updateCategory(Category cate) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.update(cate);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean deleteCategory(String cateId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.delete(getCategoryById(cateId));
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public List<Category> getCategiesByName(String cateName) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			if(cateName==null || cateName.length()==0)
				cateName = "%";
			else
				cateName = "%"+cateName+"%";
			
			List list = session.createQuery("from Category where cateName like :cateName")
					.setParameter("cateName", cateName)
					.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

}
