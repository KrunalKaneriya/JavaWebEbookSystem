package com.DAO;

import java.sql.Connection;
import java.util.List;

import com.entity.Book_Order;

public interface OrderDAO {
	
	public int getOrderNo();
	
	public boolean saveOrder(List<Book_Order>orders);
}
