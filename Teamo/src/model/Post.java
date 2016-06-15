package model;

import java.util.ArrayList;
import java.util.List;

public class Post {
	
	private int id;
	private String title;
	private String content;
	private String username;
	private String date;
	private List<Comment> comments;
	
	public Post(int id, String title, String content, String username, String date) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.username = username;
		this.date = date;
		comments = new ArrayList<Comment>();
	}
	
	public void addComment(Comment comment) {
		comments.add(comment);
	}
	
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
	public List<Comment> getComments() {
		return comments;
	}
	
	public int getPostId() {
		return id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getContent() {
		return content;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getDate() {
		return date;
	}
}
