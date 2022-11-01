package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("userid"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");

			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			
			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phno);
			
			
			UserDAOImpl daoImpl = new UserDAOImpl(DBConnect.getConn());
			
			boolean f = daoImpl.checkPassword(id, password);
			if(f) {
				boolean isUserUpdate = daoImpl.updateProfile(user);
				if(isUserUpdate) {
					session.setAttribute("userObj", user);
					session.setAttribute("success", "User Updated Successfully..");
					resp.sendRedirect("edit_profile.jsp");
				} else {
					session.setAttribute("failed", "Error Updating User..");
					resp.sendRedirect("edit_profile.jsp");
				}

			} else {
				session.setAttribute("failed", "Your Password is Incorrect!!");
				resp.sendRedirect("edit_profile.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
	
	
}
