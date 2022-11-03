package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Order;

public class OrderDAOImpl implements OrderDAO{
	
	private Connection conn;
	
	public OrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public int getOrderNo() {
		int orderCount = 0;
		try {
			String sql = "select * from book_order";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				orderCount++;
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderCount;
	}
	
	public boolean saveOrder(List<Book_Order>orderList) {
		boolean f = false;
		try {
			
			String sql = "insert into book_order (order_id,user_name,email,address,phone,book_name,author,price,payment_type) values (?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement pst = conn.prepareStatement(sql);
			for(Book_Order b:orderList) {
				pst.setString(1, b.getOrder_id());
				pst.setString(2, b.getUserName());
				pst.setString(3, b.getEmail());
				pst.setString(4, b.getFullAddress());
				pst.setString(5, b.getPhno());
				pst.setString(6, b.getBookName());
				pst.setString(7, b.getAuthorName());
				pst.setString(8, b.getPrice());
				pst.setString(9, b.getPayment_type());
				pst.addBatch();
			}
			
			int[] count = pst.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
			
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public List<Book_Order> getBooks(String email) {
		List<Book_Order>list = new ArrayList<Book_Order>();
		
		
		
		try {
			
			String sql = "select * from book_order where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1,email);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				Book_Order order = null;
				order = new Book_Order();
				order.setId(rs.getInt(1));
				order.setOrder_id(rs.getString(2));
				order.setUserName(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setFullAddress(rs.getString(5));
				order.setPhno(rs.getString(6));
				order.setBookName(rs.getString(7));
				order.setAuthorName(rs.getString(8));
				order.setPrice(rs.getString(9));
				order.setPayment_type(rs.getString(10));
				list.add(order);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Book_Order> getBooks() {
		List<Book_Order>list = new ArrayList<Book_Order>();

		try {
			
			String sql = "select * from book_order";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				Book_Order order = null;
				order = new Book_Order();
				order.setId(rs.getInt(1));
				order.setOrder_id(rs.getString(2));
				order.setUserName(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setFullAddress(rs.getString(5));
				order.setPhno(rs.getString(6));
				order.setBookName(rs.getString(7));
				order.setAuthorName(rs.getString(8));
				order.setPrice(rs.getString(9));
				order.setPayment_type(rs.getString(10));
				list.add(order);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
}
