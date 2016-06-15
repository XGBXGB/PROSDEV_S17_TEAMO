package model;

public class Comment {
	private String username;
	private String comment;
	private String date;

	public Comment() {

	}

	public Comment(String username, String date, String comment) {
		super();
		this.username = username;
		this.comment = comment;
		this.date = date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getDate() {
		return date;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
