package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connector.DBConnection;
import connector.MySQLConnector;
import model.User;

public class UsersDAO {

	public void addUser(String email, String username, String password) {
		//Connection conn = MySQLConnector.getConnection();
		Connection conn = DBConnection.getConnection();
		String query = "INSERT INTO users(email, username, password) VALUES(?, ?, ?);";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
		    ps.setString(2, username);
		    ps.setString(3, password);
		    ps.execute();
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public User login(String username, String password) {
		//Connection conn = MySQLConnector.getConnection();
		Connection conn = DBConnection.getConnection();
		String query = "SELECT * FROM users WHERE username = ? AND password = ?;";
		PreparedStatement ps;
		ResultSet rs;
		User u = null;
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
		    ps.setString(2, password);
		    rs = ps.executeQuery();
		    if(rs.next()) {
		    	u = new User(rs.getInt("id"), username);
		    }
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	
	public String getUserName(int id)
	{
		Connection conn = DBConnection.getConnection();
		String query = "SELECT username FROM users WHERE id = ?;";
		PreparedStatement ps;
		ResultSet rs;
		String u = "";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
		    rs = ps.executeQuery();
		    if(rs.next()) {
		    	u = rs.getString(1);
		    }
		    conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
}
