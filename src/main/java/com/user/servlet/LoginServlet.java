package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			UserDAOImpl daoImpl = new UserDAOImpl(DBConnect.getConn());
			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			if (email.equals("admin@gmail.com") && password.equals("admin123")) {
				User user = new User();
				user.setName("Admin");
				session.setAttribute("userObj", user);
				resp.sendRedirect("admin/home.jsp");
			} else {

				User user = daoImpl.userLogin(email, password);

				if (user != null) {
					session.setAttribute("userObj", user);
					resp.sendRedirect("home.jsp");

				} else {
					session.setAttribute("loginFailed", "Error Logging In");
					resp.sendRedirect("login.jsp");

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
