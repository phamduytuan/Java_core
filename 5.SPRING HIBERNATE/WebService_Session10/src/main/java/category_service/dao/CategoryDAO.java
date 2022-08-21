package category_service.dao;

import java.util.List;

import category_service.entity.Category;

public interface CategoryDAO {
	public List<Category> getCategories();
	public Category getCategoryById(String cateId);
	public boolean insertCategory(Category cate);
	public boolean updateCategory(Category cate);
	public boolean deleteCategory(String cateId);
	public List<Category> getCategiesByName(String cateName);
}
