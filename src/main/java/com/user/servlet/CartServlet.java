package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDetails book = dao.getBookById(bid);
			
			Cart cart = new Cart();
			cart.setBook_id(bid);
			cart.setUser_id(uid);
			cart.setAuthor(book.getAuthor());
			cart.setBook_name(book.getBook_name());
			cart.setPrice(Double.parseDouble(book.getPrice())); 
			cart.setTotal_price(Double.parseDouble(book.getPrice()));
			
			CartDAOImpl daoImpl = new CartDAOImpl(DBConnect.getConn());
			boolean f = daoImpl.addToCart(cart);
			
			HttpSession session = req.getSession();
			
			
			if(f) {
				session.setAttribute("addCart","Book Added Successfully");
				resp.sendRedirect("all_new_books.jsp");
			} else {
				session.setAttribute("failedCart","Something Wrong Happened!!");
				resp.sendRedirect("all_new_books.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
