package emp.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Employees")
public class Employee {
	@Id
	@Column(name = "EmpId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer empId;
	@Column(name = "EmpName")
	private String empName;
	@Column(name = "Gender")
	private Boolean gender;
	@Column(name = "Birthday")
	private Date birthday;
	@Column(name = "Address")
	private String address;
	@Column(name = "Company")
	private String company;
	@Column(name = "Department")
	private String department;
	@Column(name = "Position")
	private String position;
	@Column(name = "Salary")
	private Double salary;
	
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employee(Integer empId, String empName, Boolean gender, Date birthday, String address, String company,
			String department, String position, Double salary) {
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
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
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
