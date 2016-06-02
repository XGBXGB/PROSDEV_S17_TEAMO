package controller;

import java.util.List;
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
	
	public void addPost(String title, String content, int userId)
	{
		pd.addPost(title, content, userId);
	}
	
	public List<Post> getPosts()
	{
		return pd.getPosts();
	}
	
	public void addUser(String email, String username, String password)
	{
		ud.addUser(email, username, password);
	}
}
