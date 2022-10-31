package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.Cart;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	// Here we will check that if a book which is added then we don't want to add
	// that book again to cart
	public boolean addToCart(Cart c) {

		boolean f = false;
		boolean isExistingFound = false;

		try {

			String existingBookQuery = "select COUNT(*) from cart where book_id=? and user_id=?";
			PreparedStatement existingBookPst = conn.prepareStatement(existingBookQuery);
			existingBookPst.setInt(1, c.getBook_id());
			existingBookPst.setInt(2, c.getUser_id());
			ResultSet rs = existingBookPst.executeQuery();
			int n = 0;
			while (rs.next()) {
				n = rs.getInt(1);
				if (n > 0) {
					isExistingFound = true;
					f = false;
				}
			}

			if (!isExistingFound) {

				String sql = "insert into cart (book_id,user_id,book_name,author,price,total_price) values (?,?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setInt(1, c.getBook_id());
				pst.setInt(2, c.getUser_id());
				pst.setString(3, c.getBook_name());
				pst.setString(4, c.getAuthor());
				pst.setDouble(5, c.getPrice());
				pst.setDouble(6, c.getTotal_price());

				int result = pst.executeUpdate();

				if (result == 1) {
					f = true;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Cart> getBooksByUser(int userid) {
		Cart cart = null;
		List<Cart> cartList = new ArrayList<Cart>();
		double totalPrice = 0;
		try {
			String sql = "select * from cart where user_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, userid);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				cart = new Cart();
				cart.setCart_id(rs.getInt(1));
				cart.setBook_id(rs.getInt(2));
				cart.setUser_id(rs.getInt(3));
				cart.setBook_name(rs.getString(4));
				cart.setAuthor(rs.getString(5));
				cart.setPrice(rs.getDouble(6));

				totalPrice += rs.getDouble(7);
				cart.setTotal_price(totalPrice);
				cartList.add(cart);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cartList;

	}

	public boolean deleteBook(int bookid, int userid) {
		boolean f = false;

		try {
			String sql = "delete from cart where book_id=? and user_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, bookid);
			pst.setInt(2, userid);
			int result = pst.executeUpdate();
			if (result == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
