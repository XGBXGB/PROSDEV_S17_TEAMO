package controller;

import java.util.List;
import java.util.ArrayList;

import dao.CommentsDAO;
import dao.PostsDAO;
import dao.UsersDAO;
import model.Comment;
import model.Post;
import model.User;

public class Controller {

	private UsersDAO ud;
	private PostsDAO pd;
	private CommentsDAO cd;
	public Controller()
	{
		ud = new UsersDAO();
		pd = new PostsDAO();
		cd = new CommentsDAO();
	}
	
	public User getUser(String username, String password)
	{
		return ud.login(username, password);
	}
	
	public String getUserName(int id)
	{
		return ud.getUserName(id);
	}
	
	public void addPost(String title, String content, int userId)
	{
		pd.addPost(title, content, userId);
	}
	
	public List<Post> getPosts(int offset, int limit)
	{
		return pd.getPosts(offset,limit);
	}
	
	public List<Post> searchPosts(int offset, int limit, String searchTerm){
		return pd.searchPosts(offset, limit, searchTerm);
	}
	
	
	public void addUser(String email, String username, String password)
	{
		ud.addUser(email, username, password);
	}
	
	public Post getPost(int id, int type)
	{
		return pd.getPost(id, type);
	}
	
	public List<Comment> getComments(int id)
	{
		return cd.getComments(id);		
	}

	public void addComment(String postcomment, int postid, int userId) {
		cd.addComment(postcomment, postid, userId);
	}
	
	
}
