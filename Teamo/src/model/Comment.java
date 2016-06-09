package model;

public class Comment {
	private String comment;
	private int postId;
	private int userId;
	private String date;

	public Comment() {

	}

	public Comment(String comment, int postId, int userId, String date) {
		super();
		this.comment = comment;
		this.postId = postId;
		this.userId = userId;
		this.date = date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getPostId() {
		return postId;
	}
	
	public String getDate() {
		return date;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
