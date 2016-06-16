package servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.Controller;
import javax.servlet.annotation.MultipartConfig;

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
		InputStream inputStream = null;
		
		if (cookies != null) {
		 for (Cookie cookie : cookies) {
		   if (cookie.getName().equals("user")) {
		      user = cookie.getValue();
		    }
		  }
		}
		
		Part filePart = request.getPart("image");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            //obtains input stream of the upload file
            //the InputStream will point to a stream that contains
            //the contents of the file
            inputStream = filePart.getInputStream();
        }
        
		m.addPost(request.getParameter("title"), request.getParameter("content"), inputStream, Integer.parseInt(user));
//		m.addPost(request.getParameter("title"), request.getParameter("content"), inputStream, Integer.parseInt(user));
		request.getSession().setAttribute("Posts", m.getPosts(0, 5));
		int noOfRecords = m.getNoOfPosts();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / 5);
		request.getSession().setAttribute("noOfPages", noOfPages);
		request.getSession().setAttribute("currentPage", 1);
		response.sendRedirect("view_posts.jsp");
		
		
		
		
		
	}

}
