package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Post;
import model.User;

/**
 * Servlet implementation class NewPostServlet
 */
@WebServlet("/NewPostServlet")
public class NewPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("Error", "Invalid");
		request.getRequestDispatcher("new_post.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Controller m = new Controller();
		Cookie[] cookies = request.getCookies();
		String user = "";
		
		if (cookies != null) {
		 for (Cookie cookie : cookies) {
		   if (cookie.getName().equals("user")) {
		      user = cookie.getValue();
		    }
		  }
		}
		m.addPost(request.getParameter("title"), request.getParameter("content"), Integer.parseInt(user));
		request.getSession().setAttribute("Posts", m.getPosts(1,4));
		System.out.println("INSIDE DO POST");
		response.sendRedirect("view_posts.jsp");
		
		
		
	}

}
