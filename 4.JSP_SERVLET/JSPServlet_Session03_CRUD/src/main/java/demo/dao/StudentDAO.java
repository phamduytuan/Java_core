package demo.dao;

import java.util.List;

import demo.entity.Student;

public interface StudentDAO {
	public List<Student> getStudents();
	public boolean insertStudent(Student stu);
	public Student getStudentById(Integer stuId);
	public boolean deleteStudent(Integer stuId);
	public boolean updateStudent(Student stu);
	public List<Student> getStudentsByName(String name);
}
