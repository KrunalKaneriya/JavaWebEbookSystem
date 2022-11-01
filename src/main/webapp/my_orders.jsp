<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

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
				<tr>
					<td>12</td>
					<td>Krunal</td>
					<td>C Program</td>
					<td>Bala</td>
					<td>500</td>
					<td>COD</td>
					
				</tr>

			</tbody>
		</table>
	</div>
	
	<%@include file="all_component/footer.jsp"%>
</body>
</html>