package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PostsDAO;
import model.Post;

/**
 * Servlet implementation class PaginationServlet
 */
@WebServlet(name="/PostsServlet",
urlPatterns={"/PostsServlet"})
public class PostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		int page = 1;
		int recordsPerPage = 5;
		if (request.getParameter("currentPage") != null)
			page = Integer.parseInt(request.getParameter("currentPage"));
		PostsDAO dao = new PostsDAO();
		List<Post> list = dao.getPosts((page - 1) * recordsPerPage, recordsPerPage);
		for (int i = 0; i < list.size(); i++) {
			Post p = list.get(i);
		}
		HttpSession session = request.getSession();
		int noOfRecords = dao.getNoOfPosts();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		session.setAttribute("Posts", list);
		session.setAttribute("noOfPages", noOfPages);
		session.setAttribute("currentPage", page);
		RequestDispatcher view = request.getRequestDispatcher("view_posts.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
