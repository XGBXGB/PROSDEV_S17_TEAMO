package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

/**
 * Servlet implementation class AddCommentServlet
 */
@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Controller m = new Controller();
		int postid = Integer.parseInt(request.getParameter("postid").toString());
		String postcomment = request.getParameter("postcomment").toString();
		
		Cookie[] cookies = request.getCookies();
		String user = "";
		
		if (cookies != null) {
		 for (Cookie cookie : cookies) {
		   if (cookie.getName().equals("user")) {
		      user = cookie.getValue();
		    }
		  }
		}
		
		m.addComment(postcomment, postid, Integer.parseInt(user));
		request.getSession().setAttribute("Currentpost", m.getPost(postid, 0));
		response.sendRedirect("view_single_post.jsp");
		
	}

}
