package dao;

import java.io.IOException;
import java.io.InputStream;
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
import model.Post;
import model.User;

public class PostsDAO {

	
	private int numOfPosts;
	public void addPost(String title, String content, InputStream inputStream, int userId) throws IOException {
		//Connection conn = MySQLConnector.getConnection();
		Connection conn = DBConnection.getConnection();
		String query;
		PreparedStatement ps;
		
		query = "INSERT INTO posts(title, content, user_id, image, date) VALUES(?, ?, ?, ?, ?);";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, title);
		    ps.setString(2, content);
		    ps.setInt(3, userId);
		    ps.setBlob(4, inputStream);
		    ps.setString(5, new SimpleDateFormat("MM/dd/yyyy").format(new Date()));
		    ps.execute();
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public List<Post> getPosts(int offset, int limit) {
		// Connection conn = MySQLConnector.getConnection();
		Connection conn = DBConnection.getConnection();
		String query = 
				"SELECT title, content, username, date, image FROM posts P "
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
		    	posts.add(new Post(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBlob(5), rs.getString(4)));
		    }
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return posts;
	}

	public int getNoOfPosts() {
		int num = -1;
		Connection conn = DBConnection.getConnection();
		String query = "SELECT count(*) FROM posts";
		PreparedStatement ps;
		ResultSet rs;
		try {
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
}
