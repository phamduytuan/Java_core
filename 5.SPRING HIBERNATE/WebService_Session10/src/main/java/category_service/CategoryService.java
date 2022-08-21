package category_service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;

import category_service.dao.impl.CategoryDAOimpl;
import category_service.entity.Category;

@Path("/cate-service/")
public class CategoryService {
	@GET
	@Path("/getListCategories")
	@Produces(MediaType.APPLICATION_JSON)
	public String listCategories() {
		List<Category> categories = new CategoryDAOimpl().getCategories();
		Gson son = new Gson();
		String data = son.toJson(categories);
		return data;
	}
	
	@GET
	@Path("/getCategoryByid/{cateId}")
	public String getCateById(@PathParam("cateId")String cateId) {
		Category categoryById = new CategoryDAOimpl().getCategoryById(cateId);
		Gson son = new Gson();
		String data = son.toJson(categoryById);
		return data;
	}
	
	@POST
	@Path("/insertCategory")
	@Consumes(MediaType.APPLICATION_JSON)
	public String insertCategory(String dataCate) {
		Gson son = new Gson();
		Category category = son.fromJson(dataCate, Category.class);
		boolean bl = new CategoryDAOimpl().insertCategory(category);
		String data = son.toJson(bl);
		return data;
	}
	
	@PUT
	@Path("/updateCategory")
	@Consumes(MediaType.APPLICATION_JSON)
	public String updateCategory(String dataCate) {
		Gson son = new Gson();
		Category category = son.fromJson(dataCate, Category.class);
		boolean bl = new CategoryDAOimpl().updateCategory(category);
		String data = son.toJson(bl);
		return data;
	}
	
	@DELETE
	@Path("/deleteCategory/{cateId}")
	@Consumes(MediaType.APPLICATION_JSON)
	public String deleteCategory(@PathParam("cateId")String cateId) {
		boolean bl = new CategoryDAOimpl().deleteCategory(cateId);
		Gson son = new Gson();
		String data = son.toJson(bl);
		return data;
	}
	
	@GET
	@Path("/getCategoriesByName/{cateName}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getCategoriesByName(@PathParam("cateName")String cateName) {
		List<Category> categories = new CategoryDAOimpl().getCategiesByName(cateName);
		Gson son = new Gson();
		String data = son.toJson(categories);
		return data;
	}
}
