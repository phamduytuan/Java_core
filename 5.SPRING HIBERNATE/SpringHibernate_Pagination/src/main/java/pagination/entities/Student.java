package pagination.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tblStudent")
public class Student {
	@Id
	@Column(name = "RollNumber")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer rollNumber;
	@Column(name = "FullName")
	private String fullName;
	@Column(name = "Address")
	private String address;
	@Column(name = "ClassName")
	private String className;
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student(Integer rollNumber, String fullName, String address, String className) {
		super();
		this.rollNumber = rollNumber;
		this.fullName = fullName;
		this.address = address;
		this.className = className;
	}

	public Integer getRollNumber() {
		return rollNumber;
	}

	public void setRollNumber(Integer rollNumber) {
		this.rollNumber = rollNumber;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
	
	
}
