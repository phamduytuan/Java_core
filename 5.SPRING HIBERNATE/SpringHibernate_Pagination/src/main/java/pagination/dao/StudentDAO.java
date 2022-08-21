package pagination.dao;

import java.util.List;

import pagination.entities.Student;

public interface StudentDAO {
	public List<Student> getStudents(Integer offset, Integer maxResult);
	public Long getTotalStudents();
}
