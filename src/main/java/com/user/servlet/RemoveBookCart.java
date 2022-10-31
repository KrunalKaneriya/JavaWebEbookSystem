package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_book")

public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CartDAOImpl daoImpl = new CartDAOImpl(DBConnect.getConn());
		int book_id = Integer.parseInt(req.getParameter("bid"));
		int user_id = Integer.parseInt(req.getParameter("uid"));
		boolean deleteResult = daoImpl.deleteBook(book_id,user_id);
		HttpSession session = req.getSession();
		
		if(deleteResult) {
			session.setAttribute("successMessage","Book Removed Successfully");
		} else {
			session.setAttribute("failedMessage","Something Wrong Happened!!");
		}
		
		resp.sendRedirect("checkout.jsp");
	}

	
}
