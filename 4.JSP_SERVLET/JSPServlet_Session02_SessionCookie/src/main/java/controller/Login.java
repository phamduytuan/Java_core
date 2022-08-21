package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		String save = request.getParameter("save");
		
		if(username.equals("user") && pass.equals("12345")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			
			if(save!=null && save.equals("true")) {
				Cookie cUsername = new Cookie("username", username);
				Cookie cPassword = new Cookie("password", pass);
				Cookie cSave = new Cookie("save", save);
				
				//set thoi gian
				cUsername.setMaxAge(24*60*60);  // 1 ngay
				cPassword.setMaxAge(24*60*60);
				cSave.setMaxAge(24*60*60);
				
				response.addCookie(cSave);
				response.addCookie(cPassword);
				response.addCookie(cUsername);
			}else {
				Cookie cUsername = new Cookie("username", "");
				Cookie cPassword = new Cookie("password", "");
				Cookie cSave = new Cookie("save", "");				
				
				response.addCookie(cSave);
				response.addCookie(cPassword);
				response.addCookie(cUsername);		
			}		
				
			//chuyen trang
			response.sendRedirect("hello.jsp");
		}else {
			request.setAttribute("err", "Wrong username or password!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
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
