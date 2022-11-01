package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.BookDetails;
import com.entity.Book_Order;
import com.entity.Cart;

import java.util.ArrayList;
import java.util.List;

import com.DAO.CartDAOImpl;
import com.DAO.OrderDAO;
import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));
			
			String name = req.getParameter("name");
			String email = req.getParameter("email");

			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			
			String address= req.getParameter("address");
			String landmark = req.getParameter("landmark");
			
			String city = req.getParameter("city");
			String state=req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment_type");
			
			String fullAddress = address + "," + landmark + "," + city + "," + state + "," + pincode;
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			List<Cart> blist = dao.getBooksByUser(id);
			OrderDAOImpl orderDAOImpl = new OrderDAOImpl(DBConnect.getConn());
			int i = orderDAOImpl.getOrderNo();
			
			
			Book_Order order = null;
			ArrayList<Book_Order>orderList = new ArrayList<Book_Order>();
			
			
			for(Cart c:blist) {
				order = new Book_Order();
				order.setOrder_id("BOOK-ORD-"+i);
				order.setUserName(name);
				order.setEmail(email);
				order.setPhno(phno);
				order.setFullAddress(fullAddress);
				order.setBookName(c.getBook_name());
				order.setAuthorName(c.getAuthor());
				order.setPrice(c.getPrice() + "");
				order.setPayment_type(paymentType);
				orderList.add(order);
				i++;
			}
			
			if(paymentType.equals("noselect")) {
				session.setAttribute("failedMessage", "Please Check Payment Method");
				resp.sendRedirect("checkout.jsp");
			} else {
				boolean result = orderDAOImpl.saveOrder(orderList);
				if(result) {
					resp.sendRedirect("order_success.jsp");
				} else {
					session.setAttribute("failedMessage", "Your Order Failed");
					resp.sendRedirect("checkout.jsp");
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
