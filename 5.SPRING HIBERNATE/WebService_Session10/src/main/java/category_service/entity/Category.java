package category_service.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Category")
public class Category {
	@Id
	@Column(name = "CateId")
	private String cateId;
	@Column(name = "CateName")
	private String cateName;
	@Column(name = "Status")
	private Boolean status;
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(String cateId, String cateName, Boolean status) {
		super();
		this.cateId = cateId;
		this.cateName = cateName;
		this.status = status;
	}
	public String getCateId() {
		return cateId;
	}
	public void setCateId(String cateId) {
		this.cateId = cateId;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}	
	
}
