package demo.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.dao.impl.StudentDAOImpl;
import demo.entity.Student;

/**
 * Servlet implementation class InsertStudent
 */
@WebServlet("/InsertStudent")
public class InsertStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String fullName = request.getParameter("fullName");
		Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = null;
		try {
			birthday = sf.parse(request.getParameter("birthday"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String address = request.getParameter("address");
		String className = request.getParameter("className");
		
		Student s = new Student();
		s.setFullName(fullName);
		s.setGender(gender);
		s.setBirthday(birthday);
		s.setAddress(address);
		s.setClassName(className);
		
		boolean bl = new StudentDAOImpl().insertStudent(s);
		if(bl) {
			request.getRequestDispatcher("LoadStudents").forward(request, response);
		}else {
			request.setAttribute("error", "Insert failed!");
			request.getRequestDispatcher("insertStudent.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
