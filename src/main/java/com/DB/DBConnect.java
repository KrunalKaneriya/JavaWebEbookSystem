package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	public static Connection conn;

	public static Connection getConn() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
