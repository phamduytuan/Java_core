package validate_demo.entity;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.springframework.format.annotation.DateTimeFormat;

public class Employee {
	@NotEmpty(message = "Employee id is empty!")
	private String empId;
	@NotEmpty(message = "Employee name is empty!")
	private String empName;
	@NotNull(message = "Gender is empty!")
	private Boolean gender;
	@NotNull(message = "Date is empty!")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Past(message = "Date is not valid")
	private Date birthday;
	@NotEmpty(message = "Address is empty!")
	private String address;
	@NotEmpty(message = "Company is empty!")
	private String company;
	@NotEmpty(message = "Department is empty!")
	private String department;
	@NotEmpty(message = "Position is empty!")
	private String position;
	@NotNull(message = "Salary is empty!")	
	private Double salary;
	private String imgUrl;
	
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}	

	public Employee(@NotEmpty(message = "Employee id is empty!") String empId,
			@NotEmpty(message = "Employee name is empty!") String empName,
			@NotNull(message = "Gender is empty!") Boolean gender,
			@NotNull(message = "Date is empty!") @Past(message = "Date is not valid") Date birthday,
			@NotEmpty(message = "Address is empty!") String address,
			@NotEmpty(message = "Company is empty!") String company,
			@NotEmpty(message = "Department is empty!") String department,
			@NotEmpty(message = "Position is empty!") String position,
			@NotNull(message = "Salary is empty!") Double salary, String imgUrl) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.company = company;
		this.department = department;
		this.position = position;
		this.salary = salary;
		this.imgUrl = imgUrl;
	}


	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}	
	
}
