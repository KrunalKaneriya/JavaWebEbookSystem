package com.DAO;
import java.util.List;

import com.entity.BookDetails;
import com.entity.Cart;

public interface CartDAO {
	public boolean addToCart(Cart c);
	
	public List<Cart> getBooksByUser(int userid);
	
	public boolean deleteBook(int bookid,int userid);
}
