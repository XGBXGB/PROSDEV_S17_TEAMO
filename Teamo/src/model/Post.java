package model;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.imageio.ImageIO;

public class Post {

	private int id;
	private String title;
	private String content;
	private String username;
	private Blob image;
	private String date;

	public Post(String title, String content, String username, Blob image, String date) {
		this.title = title;
		this.content = content;
		this.username = username;
		this.image = image;
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

	public BufferedImage getImage() throws SQLException, IOException {
		if (image != null) {
			InputStream in = image.getBinaryStream();
			BufferedImage bi = ImageIO.read(in);
			return bi;
		}
		return null;
	}

	public Blob getBlob() {
		return image;
	}
}
