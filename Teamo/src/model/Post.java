package model;

public class Post {
	
	private int id;
	private String title;
	private String content;
	private String username;
	private String date;
	
	public Post(String title, String content, String username, String date) {
		this.title = title;
		this.content = content;
		this.username = username;
		this.date = date;
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
	
	public String username() {
		return username;
	}
	
	public String date() {
		return date;
	}
}
