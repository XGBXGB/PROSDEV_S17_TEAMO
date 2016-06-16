package controller;

import java.util.List;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import dao.PostsDAO;
import dao.UsersDAO;
import model.Post;
import model.User;

public class Controller {

	private UsersDAO ud;
	private PostsDAO pd;
	
	public Controller()
	{
		ud = new UsersDAO();
		pd = new PostsDAO();
	}
	
	public User getUser(String username, String password)
	{
		return ud.login(username, password);
	}
	
	public String getUserName(int id)
	{
		return ud.getUserName(id);
	}
	
	public void addPost(String title, String content, InputStream inputStream, int userId) throws IOException
	{
		pd.addPost(title, content, inputStream, userId);
	}
	
	public List<Post> getPosts(int offset, int limit)
	{
		return pd.getPosts(offset, limit);
	}
	
	public void addUser(String email, String username, String password)
	{
		ud.addUser(email, username, password);
	}
	
	public int getNoOfPosts() {
		return pd.getNoOfPosts();
	}
}
