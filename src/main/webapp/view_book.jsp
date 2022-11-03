<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_component/navbar.jsp"%>
	
	<%
		User user = (User)session.getAttribute("userObj");
		int bid = Integer.parseInt(request.getParameter("bid"));
		BookDAOImpl daoImpl = new BookDAOImpl(DBConnect.getConn()); 
		BookDetails book = daoImpl.getBookById(bid);
		
	%>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%= book.getPhotoName() %>" style="height: 200px; width: 150px;" /><br />

				<h4 class="mt-3">Book Name:<span class="text-success"><%= book.getBook_name() %></span></h4>
				<h4>Author:<span class="text-success"><%= book.getAuthor() %></span></h4>
				<h4>Category:<span class="text-success"><%= book.getBook_category() %></span></h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2 class="mb-3"><%= book.getBook_name() %></h2>
				
				<%
					if(book.getBook_category().toLowerCase().equals("old")) {

				%>
				
				<h5 class="text-primary">Contact To Seller</h5>
				<h6 class="text-primary">Email: <%= book.getEmail() %></h6>
				<% } %>
				
				<div class="row mt-3">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				
				<div class="text-center p-3">
				
				<%
				if(book.getBook_category().toLowerCase().equals("old")) {
				%>
					<a href="index.jsp" class="btn btn-success">
						<i class="fas fa-cart-plus"></i>
						Continue Shopping
					</a>
					
				<% } else { %>
				
				<a href="cart?bid=<%=book.getBook_id() %>&&uid=<%=user.getId() %>" class="btn btn-primary">
						<i class="fas fa-cart-plus"></i>
						Add To Cart
					</a>
					
				<% } %>
					
					<a href="" class="btn btn-danger">
					
						<i class="fas fa-rupee-sign"></i>
						<%= book.getPrice() %>
					
					</a>
				</div>




			</div>
		</div>
	</div>
</body>
</html>