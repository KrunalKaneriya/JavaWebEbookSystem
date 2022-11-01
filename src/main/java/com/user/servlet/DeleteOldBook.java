package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookDAOImpl daoImpl = new BookDAOImpl(DBConnect.getConn());
		int id = Integer.parseInt(req.getParameter("bid"));
		String email = req.getParameter("email");
		
		boolean deleteResult = daoImpl.OldBookDelete(id,email,"Old");
		
		HttpSession session = req.getSession();
		
		if(deleteResult) {
			session.setAttribute("successMessage","Book Removed Successfully");
		} else {
			session.setAttribute("failedMessage","Something Wrong Happened!!");
		}
		
		resp.sendRedirect("old_books.jsp");
	}

	
}
