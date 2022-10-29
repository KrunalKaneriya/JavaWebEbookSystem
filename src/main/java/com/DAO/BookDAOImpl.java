package com.DAO;

import com.entity.BookDetails;
import java.sql.*;

public class BookDAOImpl implements BookDAO{
	
	private Connection conn;
	

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public boolean addBooks(BookDetails bookDetails) {
		boolean f =false;
		try {
			
			String sql = "insert into book_details(book_name,author,price,book_category,status,photo,email) values (?,?,?,?,?,?,?)";
			
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1,bookDetails.getBook_name());
			pst.setString(2,bookDetails.getAuthor());
			pst.setString(3,bookDetails.getPrice());
			pst.setString(4,bookDetails.getBook_category());
			pst.setString(5,bookDetails.getStatus());
			pst.setString(6,bookDetails.getPhotoName());
			pst.setString(7,bookDetails.getEmail());

			int result = pst.executeUpdate();
			
			if(result==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	

}
