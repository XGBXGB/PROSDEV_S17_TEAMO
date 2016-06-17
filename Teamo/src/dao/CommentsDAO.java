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
import model.Comment;
import model.Post;

public class CommentsDAO {
	public void addComment(String comment, int postId, int userId) {
		Connection conn = DBConnection.getConnection();
		String query = "INSERT INTO comments(content, post_id, user_id, date) VALUES(?, ?, ?, ?);";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, comment);
		    ps.setInt(2, postId);
		    ps.setInt(3, userId);
		    ps.setString(4, new SimpleDateFormat("MM/dd/yyyy").format(new Date()));
		    ps.execute();
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Comment> getComments(int postId) {
		List<Comment> comments = new ArrayList<Comment>();
		Connection conn = DBConnection.getConnection();
		String query = 
				"SELECT content, post_id, user_id, date, username "
				+ "FROM comments c "
				+ "INNER JOIN users u "
				+ "ON u.id = c.user_id "
				+ "WHERE post_id = " + postId + " " 
				+ "ORDER BY date";
		PreparedStatement ps;
		ResultSet rs;
		try {
			ps = conn.prepareStatement(query);
		    rs = ps.executeQuery();
		    while(rs.next()) {
		    	comments.add(new Comment(rs.getString(5), rs.getString(4), rs.getString(1)));
		    }
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comments;
	}
	
	public List<Comment> getComments(int postId, int limit) {
		List<Comment> comments = new ArrayList<Comment>();
		Connection conn = DBConnection.getConnection();
		String query = 
				"SELECT username, date, content "
				+ "FROM comments c "
				+ "INNER JOIN users u "
				+ "ON u.id = c.user_id "
				+ "WHERE post_id = " + postId + " "
				+ "ORDER BY date DESC "
				+ "LIMIT ?";
		PreparedStatement ps;
		ResultSet rs;
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, limit);
		    rs = ps.executeQuery();
		    while(rs.next()) {
		    	comments.add(new Comment(rs.getString(1), rs.getString(2), rs.getString(3)));
		    }
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comments;
	}
	
	
}