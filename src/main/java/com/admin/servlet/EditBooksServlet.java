package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/edit_books")
public class EditBooksServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String book_name = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String status = req.getParameter("status");
			
			BookDetails book = new BookDetails();
			book.setBook_id(id);
			book.setBook_name(book_name);
			book.setAuthor(author);
			book.setPrice(price);
			book.setStatus(status);
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean updateResult = dao.updateBook(book);
			
			HttpSession session = req.getSession();
			
			if(updateResult) {
				session.setAttribute("updateBookSuccess", "Book Updated Successfully");
				
			} else {
				session.setAttribute("updateBookFailed", "Error Updating Book");
			}
			
			resp.sendRedirect("admin/all_books.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
