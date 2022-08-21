package demo.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import demo.dao.StudentDAO;
import demo.db.DBUtility;
import demo.entity.Student;

public class StudentDAOImpl implements StudentDAO{

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
			while(rs.next()) {
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
		}finally {
			DBUtility.closeConnection(con);
		}
		
		return  list;
	}

	public static void main(String[] args) {
		System.out.println("sdfdf:"+new StudentDAOImpl().getStudents().size());
	}
}
