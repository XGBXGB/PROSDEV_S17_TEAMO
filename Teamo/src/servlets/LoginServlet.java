package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
//import Controller.Controller;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("Error", "Invalid");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Controller m = new Controller();
		User user = m.getUser(request.getParameter("username"), request.getParameter("password"));
		System.out.println("INSIDE DO POST");
		
		if(user != null)
		{
			System.out.println("INSIDE USER COOKIE");
			response.addCookie(new Cookie("user", user.getUsername()));
			response.sendRedirect("view_posts.jsp");
		}
		else
			doGet(request, response);
	}

}
