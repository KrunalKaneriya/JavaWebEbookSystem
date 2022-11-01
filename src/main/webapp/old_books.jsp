<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Old Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${not empty successMessage}">
	
		<div class="alert alert-success" role="alert">
		  ${successMessage}
		</div>
		<c:remove var="successMessage" scope="session"/>
	
	</c:if>
	
	<c:if test="${not empty failedMessage}">
	
		<div class="alert alert-danger" role="alert">
		  ${failedMessage}
		</div>
		<c:remove var="failedMessage" scope="session"/>
	
	</c:if>

	<div class="container-fluid">

		<h3 class="text-center text-primary mt-3">Your Orders</h3>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>

				<%
						User user = (User)session.getAttribute("userObj");
						BookDAOImpl daoImpl = new BookDAOImpl(DBConnect.getConn());
						List<BookDetails> oldBooks = daoImpl.getUserOldBooks(user.getEmail(), "Old");
						for(BookDetails b : oldBooks) {
			%>

				<tr>
					<td><%= b.getBook_name() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><a href="delete_old_book?bid=<%=b.getBook_id() %>&&email=<%=b.getEmail() %>" class="btn btn-small btn-danger">Delete</a></td>
				</tr>

			<% } %>
			</tbody>
		</table>
	</div>

	<%@include file="all_component/footer.jsp"%>



</body>
</html>