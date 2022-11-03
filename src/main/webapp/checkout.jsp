<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.Cart" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Cart</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${not empty successMessage}">
	
		<div class="alert alert-success" role="alert">
		  ${successMessage}
		</div>
		<c:remove var="successMessage" scope="session"/>
	
	</c:if>
	
	<c:if test="${not empty failedMessage}">
	
		<div class="alert alert-danger text-center" role="alert">
		  ${failedMessage}
		</div>
		<c:remove var="failedMessage" scope="session"/>
	
	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card">
					<div class="card-body bg-white">
						<h3 class="text-center text-success">Your Selected Books</h3>
						<table class="table table-striped table-hover">
							<thead>
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
									CartDAOImpl daoImpl = new CartDAOImpl(DBConnect.getConn());
									List<Cart> cart = daoImpl.getBooksByUser(user.getId());
									Double totalPrice = 0.0;
									for(Cart c:cart) {
									totalPrice=c.getTotal_price();
								%>

								<tr>
									<th scope="row"><%=c.getBook_name() %></th>
									<td><%=c.getAuthor() %></td>
									<td><%=c.getPrice() %></td>
									<td><a href="remove_book?bid=<%=c.getBook_id() %>&&uid=<%=user.getId() %>" class="btn btn-small btn-danger">Remove</a></td>
								</tr>
								
								<% } %>
								
								<tr class="">
									<td class=""><b>Total Price</b></td>
									<td></td>
									<td></td>
									<td><i class="fa-solid fa-indian-rupee-sign"></i> <b><%=totalPrice %></b></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details For Order</h3>
						<form action="order" method="post">
						<input type="hidden" value = "${userObj.id }" name="id"/>
						
							<div class="row">
								<div style="opacity: 0.7;" class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" readonly="readonly" value="<%= user.getName()%>" name="name" required>
								</div>
								<div style="opacity: 0.7;" class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4" value="<%= user.getEmail() %>" readonly="readonly" name="email" required>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="number" class="form-control" id="inputEmail4" value="<%= user.getPhno()%>" name="phno" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" value="" name="address" required>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" value="" name="landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" value="" name="city" required>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" value="" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin Code</label> <input type="text"
										class="form-control" id="inputPassword4" value="" name="pincode" required>
								</div>
							</div>

							<div class="form-group" >
								<label>Payment Mode</label> <select class="form-control" name="payment_type">
									<option value="noselect">--Select--</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>

								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>

						</form>

					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>