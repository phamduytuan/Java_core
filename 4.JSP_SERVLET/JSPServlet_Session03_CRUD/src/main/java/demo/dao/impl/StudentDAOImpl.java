package demo.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import demo.dao.StudentDAO;
import demo.db.DBUtility;
import demo.entity.Student;

public class StudentDAOImpl implements StudentDAO {

	@Override
	public List<Student> getStudents() {
		List<Student> list = new ArrayList();

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;

		con = DBUtility.openConnection();
		try {
			pstmt = con.prepareStatement("select * from Students");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Student s = new Student();
				s.setStuId(rs.getInt("StuId"));
				s.setFullName(rs.getString("FullName"));
				s.setGender(rs.getBoolean("Gender"));
				s.setBirthday(rs.getDate("Birthday"));
				s.setAddress(rs.getString("Address"));
				s.setClassName(rs.getString("ClassName"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtility.closeConnection(con);
		}

		return list;
	}

	public static void main(String[] args) {
		System.out.println("sdfdf:" + new StudentDAOImpl().getStudents().size());
	}

	@Override
	public boolean insertStudent(Student stu) {
		boolean bl = false;

		Connection con;
		PreparedStatement pstmt;

		con = DBUtility.openConnection();
		try {
			pstmt = con.prepareStatement(
					"insert into Students(FullName,Gender,Birthday,Address,ClassName) values (?,?,?,?,?)");
			pstmt.setString(1, stu.getFullName());
			pstmt.setBoolean(2, stu.getGender());
			pstmt.setDate(3, new Date(stu.getBirthday().getTime()));
			pstmt.setString(4, stu.getAddress());
			pstmt.setString(5, stu.getClassName());

			int i = pstmt.executeUpdate();
			if (i > 0)
				bl = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtility.closeConnection(con);
		}

		return bl;
	}

	@Override
	public Student getStudentById(Integer stuId) {
		Student s = null;

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;

		con = DBUtility.openConnection();
		try {
			pstmt = con.prepareStatement("select * from Students where StuId=?");
			pstmt.setInt(1, stuId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				s = new Student();
				s.setStuId(rs.getInt("StuId"));
				s.setFullName(rs.getString("FullName"));
				s.setGender(rs.getBoolean("Gender"));
				s.setBirthday(rs.getDate("Birthday"));
				s.setAddress(rs.getString("Address"));
				s.setClassName(rs.getString("ClassName"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtility.closeConnection(con);
		}

		return s;
	}

	@Override
	public boolean deleteStudent(Integer stuId) {
		boolean bl = false;

		Connection con;
		PreparedStatement pstmt;

		con = DBUtility.openConnection();
		try {
			pstmt = con.prepareStatement("delete from Students where StuId=?");
			pstmt.setInt(1, stuId);

			int i = pstmt.executeUpdate();
			if (i > 0)
				bl = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtility.closeConnection(con);
		}

		return bl;
	}

	@Override
	public boolean updateStudent(Student stu) {
		boolean bl = false;

		Connection con;
		PreparedStatement pstmt;

		con = DBUtility.openConnection();
		try {
			pstmt = con.prepareStatement(
					"update Students set FullName=?,Gender=?,Birthday=?,Address=?,ClassName=? where StuId=?");
			pstmt.setString(1, stu.getFullName());
			pstmt.setBoolean(2, stu.getGender());
			pstmt.setDate(3, new Date(stu.getBirthday().getTime()));
			pstmt.setString(4, stu.getAddress());
			pstmt.setString(5, stu.getClassName());
			pstmt.setInt(6, stu.getStuId());

			int i = pstmt.executeUpdate();
			if (i > 0)
				bl = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtility.closeConnection(con);
		}

		return bl;
	}

	@Override
	public List<Student> getStudentsByName(String name) {
		List<Student> list = new ArrayList();

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;

		con = DBUtility.openConnection();
		try {
			if (name == null || name.length() == 0)
				name = "%";
			else
				name = "%" + name + "%";

			pstmt = con.prepareStatement("select * from Students where FullName like ?");
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Student s = new Student();
				s.setStuId(rs.getInt("StuId"));
				s.setFullName(rs.getString("FullName"));
				s.setGender(rs.getBoolean("Gender"));
				s.setBirthday(rs.getDate("Birthday"));
				s.setAddress(rs.getString("Address"));
				s.setClassName(rs.getString("ClassName"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtility.closeConnection(con);
		}

		return list;
	}
}
