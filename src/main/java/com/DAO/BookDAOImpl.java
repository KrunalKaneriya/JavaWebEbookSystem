package com.DAO;

import com.entity.BookDetails;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDetails bookDetails) {
		boolean f = false;
		try {

			String sql = "insert into book_details(book_name,author,price,book_category,status,photo,email) values (?,?,?,?,?,?,?)";

			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, bookDetails.getBook_name());
			pst.setString(2, bookDetails.getAuthor());
			pst.setString(3, bookDetails.getPrice());
			pst.setString(4, bookDetails.getBook_category());
			pst.setString(5, bookDetails.getStatus());
			pst.setString(6, bookDetails.getPhotoName());
			pst.setString(7, bookDetails.getEmail());

			int result = pst.executeUpdate();

			if (result == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<BookDetails> getAllBookDetails() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;
		try {
			String sql = "select * from book_details";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				book = new BookDetails();
				book.setBook_id(rs.getInt(1));
				book.setBook_name(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setBook_category(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
				
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
