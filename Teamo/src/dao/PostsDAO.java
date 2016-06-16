package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import connector.DBConnection;
import connector.MySQLConnector;
import model.Comment;
import model.Post;
import model.User;

public class PostsDAO {

	private CommentsDAO commentsDAO;
	
	public PostsDAO() {
		commentsDAO = new CommentsDAO();
	}
	
	public void addPost(String title, String content, int userId) {
		//Connection conn = MySQLConnector.getConnection();
		Connection conn = DBConnection.getConnection();
		String query = "INSERT INTO posts(title, content, user_id, date) VALUES(?, ?, ?, ?);";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, title);
		    ps.setString(2, content);
		    ps.setInt(3, userId);
		    ps.setString(4, new SimpleDateFormat("MM/dd/yyyy").format(new Date()));
		    ps.execute();
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Post getPost(int id,int type) {
		//Connection conn = MySQLConnector.getConnection();
		Connection conn = DBConnection.getConnection();
		String query = 
				"SELECT P.id, title, content, username, date FROM posts P "
				+ "INNER JOIN users U "
				+ "ON U.id = P.user_id "
				+ "WHERE P.id = " + id + " ;";
		PreparedStatement ps;
		ResultSet rs;
		List<Post> posts = new ArrayList<Post>();
		try {
			ps = conn.prepareStatement(query);
		    rs = ps.executeQuery();
		    while(rs.next()) {
		    	posts.add(new Post(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
		    }
		    for(Post p : posts) {
		    	System.out.println(p.getPostId());
		    	
		    	if(type == 1)
		    		p.setComments(commentsDAO.getComments(p.getPostId(), 5));
		    	else
		    		p.setComments(commentsDAO.getComments(p.getPostId()));
		    	for(Comment c : p.getComments()) {
		    		System.out.println(c.getComment());
		    	}
		    }
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return posts.get(0);
	}
	
	
	public List<Post> getPosts(int offset, int limit) {
		//Connection conn = MySQLConnector.getConnection();
		Connection conn = DBConnection.getConnection();
		String query = 
				"SELECT P.id, title, content, username, date FROM posts P "
				+ "INNER JOIN users U "
				+ "ON U.id = P.user_id "
				+ "ORDER BY date DESC LIMIT ?, ?;";
		PreparedStatement ps;
		ResultSet rs;
		List<Post> posts = new ArrayList<Post>();
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, offset);
			ps.setInt(2, limit);
		    rs = ps.executeQuery();
		    while(rs.next()) {
		    	posts.add(new Post(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
		    }
		    for(Post p : posts) {
		    	System.out.println(p.getPostId());
		    	
		    	p.setComments(commentsDAO.getComments(p.getPostId(), 5));
		    	for(Comment c : p.getComments()) {
		    		System.out.println(c.getComment());
		    	}
		    }
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return posts;
	}
}