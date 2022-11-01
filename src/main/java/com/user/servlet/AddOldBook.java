package com.user.servlet;
import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.omg.CORBA.Request;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;


@WebServlet("/add_old_book")
@MultipartConfig // This annotation is used to enable acception of multipart/form data

public class AddOldBook extends HttpServlet{
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				HttpSession session = req.getSession();
				String book_name = req.getParameter("bname");
				String author = req.getParameter("author");
				String userEmail = req.getParameter("email");
				String price = req.getParameter("price");
				String categories = "Old";
				String status = "Active";

				// To get the filename of the image we need to get the Part from the request
				// which is responsible to give
				// filename submitted by client
				Part part = req.getPart("bimg");

				// Part interface has getSubmittedFileName method which will give us the
				// filename submitted by client
				String fileName = part.getSubmittedFileName();

				BookDetails details = new BookDetails(book_name, author, price, categories, status, fileName, userEmail);

				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

				boolean f = dao.addBooks(details);

				if (f) {
					// It gets the absolute path from which the Project is executed. In simple terms
					// it refers to the project path
					String path = getServletContext().getRealPath("") + "book";

					File file = new File(path);

					// Write method is used to write the file to the specified path
					part.write(path + File.separator + fileName);

					session.setAttribute("bookAddSuccess", "Book Added Successfully");
				} else {
					session.setAttribute("bookAddFailed", "Error Adding New Book");
					
				}
				
				resp.sendRedirect("sell_book.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

