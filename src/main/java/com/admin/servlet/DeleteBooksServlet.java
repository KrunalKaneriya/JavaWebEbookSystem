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

@WebServlet("/delete")
public class DeleteBooksServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean deleteResult = dao.deleteBook(id);

			HttpSession session = req.getSession();

			if (deleteResult) {
				session.setAttribute("failedMessage", "Book Updated Successfully");

			} else {
				session.setAttribute("failedMessage", "Error Updating Book");
			}

			resp.sendRedirect("admin/all_books.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
