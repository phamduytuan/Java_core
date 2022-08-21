package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		request.setCharacterEncoding("UTF-8");  //xử lý có dấu từ request
		
		//lấy dữ liệu
		String stuId = request.getParameter("stuId");
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
		String[] favors = request.getParameterValues("favors");
		// nối chuỗi
		String favorite = "";
		for (String f : favors) {
			favorite += f+",";
		}
		favorite = favorite.substring(0, favorite.length()-1); // bỏ dấu phẩy cuối cùng
		
		//mang dữ liệu đi
		request.setAttribute("id", stuId);
		request.setAttribute("name", fullName);
		request.setAttribute("gender", gender);
		request.setAttribute("birthday", birthday);
		request.setAttribute("address", address);
		request.setAttribute("className", className);
		request.setAttribute("favor", favorite);
		
		//chuyển trang (điều hướng)
		request.getRequestDispatcher("viewStudent.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
