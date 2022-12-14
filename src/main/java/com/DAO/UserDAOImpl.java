package com.DAO;

import java.sql.*;
import com.entity.User;

public class UserDAOImpl implements UserDAO {
//	

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	

	public User userLogin(String email, String password) {
		User user = null;
		
		try {
			String sql = "select * from user where email = ? and password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhno(rs.getString(4));
				user.setPassword(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setLandmark(rs.getString(7));
				user.setCity(rs.getString(8));
				user.setState(rs.getString(9));
				user.setPincode(rs.getString(10));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}



	public boolean userRegister(User user) {
		boolean f = false;
		try {
			String sql = "insert into user(name,email,phno,password) values (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhno());
			ps.setString(4, user.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}



	public boolean checkPassword(int id,String password) {
		boolean f = false;
			try {
				String sql = "select * from user where id=? and password=?";
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setInt(1,id);
				pst.setString(2,password);
				
				ResultSet rs = pst.executeQuery();
				
				while(rs.next()) {
					f = true;
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		
		return f;
	}



	public boolean updateProfile(User user) {
		boolean f = false;
		
		try {
			String sql = "update user set name=?,email=?,phno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhno());
			ps.setInt(4,user.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}



	public boolean checkUser(String email) {
		boolean f = true;
		
		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
}
