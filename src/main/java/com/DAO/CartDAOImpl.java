package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO{
	
	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}


	public boolean addToCart(Cart c) {
		
		boolean f =false;
		
		try {
			
			String sql = "insert into cart (book_id,user_id,book_name,author,price,total_price) values (?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1,c.getBook_id());
			pst.setInt(2, c.getUser_id());
			pst.setString(3, c.getBook_name());
			pst.setString(4, c.getAuthor());
			pst.setDouble(5, c.getPrice());
			pst.setDouble(6, c.getTotal_price());
			
			int result = pst.executeUpdate();
			
			if(result==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
}
