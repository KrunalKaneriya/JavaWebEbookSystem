<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body>

	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container">

		<h3 class="text-center mt-3">Hello ${userObj.name}</h3>


		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>

							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-4">
				<a href="old_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-secondary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>

							<h3>Old Books</h3>
						</div>
					</div>
				</a>
			</div>




			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-edit fa-3x"></i>
							</div>

							<h4>Login And Security (Edit Profile)</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-4">
				<a href="user_address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fas fa-map-marker-alt fa-3x"></i>
							</div>

							<h4>Your Address</h4>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-4">
				<a href="my_orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>

							<h4>My Orders</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 mt-4">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>

							<h4>Help And Queries</h4>
							<p>24x7 Service</p>
						</div>
					</div>
				</a>
			</div>


		</div>
	</div>


	<%@include file="all_component/footer.jsp"%>

</body>
</html>