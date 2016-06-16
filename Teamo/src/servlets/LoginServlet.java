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

			int noOfRecords = m.getNoOfPosts();
			int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / 5);
			response.addCookie(new Cookie("user", String.valueOf(user.getId())));
			request.getSession().setAttribute("Posts", m.getPosts(0, 5));
			request.getSession().setAttribute("currentPage", 1);
			request.getSession().setAttribute("noOfPages", noOfPages);
			response.sendRedirect("view_posts.jsp");
		}
		else
			doGet(request, response);
	}

}
