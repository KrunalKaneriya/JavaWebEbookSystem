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

@WebServlet("/register") // To use this servlet when invoked by this url.
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");

			String phno = req.getParameter("phno");
			String password = req.getParameter("password");

			HttpSession session = req.getSession();

//			System.out.println(name + " " + email + " " + phno + " " + password);

			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phno);
			user.setPassword(password);

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean notUserExist = dao.checkUser(email);
			
			boolean f = dao.userRegister(user);
			
			if(notUserExist) {
				if (f) {
					session.setAttribute("success", "User Registered Successfully");
					resp.sendRedirect("register.jsp");

				} else {
					session.setAttribute("failed", "Error Registering User");
					resp.sendRedirect("register.jsp");
				}
			}  else {
				session.setAttribute("failed", "User Already Exist. Use Another Email ID");
				resp.sendRedirect("register.jsp");
			}

			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
