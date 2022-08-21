package book.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "BOOKS")
public class Book {
	@Id
	@Column(name = "BookId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bookId;
	@Column(name = "Name")
	private String bookName;
	@Column(name = "TotalPage")
	private Integer totalPage;
	@Column(name = "Type")
	private String type;
	@Column(name = "Quantity")
	private Integer quantity;
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book(Integer bookId, String bookName, Integer totalPage, String type, Integer quantity) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.totalPage = totalPage;
		this.type = type;
		this.quantity = quantity;
	}
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
}
