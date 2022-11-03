<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">

		<h3 class="text-center text-primary mt-3">Your Orders</h3>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment</th>

				</tr>
			</thead>
			<tbody>

				<%
					User user = (User)session.getAttribute("userObj");
					OrderDAOImpl daoImpl = new OrderDAOImpl(DBConnect.getConn());
					
					List<Book_Order>blist = daoImpl.getBooks(user.getEmail());
					for(Book_Order book:blist) {
				%>
				<tr>
					<td><%= book.getOrder_id() %></td>
					<td><%=book.getUserName() %></td>
					<td><%=book.getBookName() %></td>
					<td><%=book.getAuthorName() %></td>
					<td><%=book.getPrice() %></td>
					<td><%=book.getPayment_type() %></td>

				</tr>
				<% } %>
			</tbody>
		</table>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>