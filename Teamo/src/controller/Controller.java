package controller;

import dao.PostsDAO;
import dao.UsersDAO;
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
	
	
}
