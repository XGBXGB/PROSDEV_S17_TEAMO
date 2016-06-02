package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import connector.MySQLConnector;
import model.Post;
import model.User;

public class PostsDAO {

	public void addPost(String title, String content, int userId) {
		Connection conn = MySQLConnector.getConnection();
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
	
	public List<Post> getPosts() {
		Connection conn = MySQLConnector.getConnection();
		String query = 
				"SELECT title, content, username, date FROM posts P "
				+ "INNER JOIN users U "
				+ "ON U.id = P.user_id "
				+ "ORDER BY date DESC LIMIT 5;";
		PreparedStatement ps;
		ResultSet rs;
		List<Post> posts = new ArrayList<Post>();
		try {
			ps = conn.prepareStatement(query);
		    rs = ps.executeQuery();
		    while(rs.next()) {
		    	posts.add(new Post(rs.getString(0), rs.getString(1), rs.getString(2), rs.getString(3)));
		    }
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return posts;
	}
}
