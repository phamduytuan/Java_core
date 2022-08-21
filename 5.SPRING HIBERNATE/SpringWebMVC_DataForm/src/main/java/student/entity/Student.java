package student.entity;

import java.util.Date;


public class Student {
	private String stuId;
	private String fullName;
	private Boolean gender;	
	private Date birthday;
	private String address;
	private String className;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(String stuId, String fullName, Boolean gender, Date birthday, String address, String className) {
		super();
		this.stuId = stuId;
		this.fullName = fullName;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.className = className;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
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
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
}
