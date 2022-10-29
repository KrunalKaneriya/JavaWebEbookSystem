package com.entity;

public class BookDetails {

	private int book_id;
	private String book_name;
	private String author;
	private String price;
	private String book_category;
	private String status;
	private String photoName;
	private String email;
	
	public BookDetails(String book_name, String author, String price, String book_category, String status,
			String photoName, String email) {
		super();
		this.book_name = book_name;
		this.author = author;
		this.price = price;
		this.book_category = book_category;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}
	
	
	
	@Override
	public String toString() {
		return "BookDetails [book_id=" + book_id + ", book_name=" + book_name + ", author=" + author + ", price="
				+ price + ", book_category=" + book_category + ", status=" + status + ", photoName=" + photoName
				+ ", email=" + email + "]";
	}



	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBook_category() {
		return book_category;
	}

	public void setBook_category(String book_category) {
		this.book_category = book_category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
}
