<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_component/allCss.jsp"%>
<title>Order Success</title>
</head>
<body style="background-color:#f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Placed Successfully</h2>
		<h5>With in 7 Days Your Product will be delivered in your address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
		<a href="my_orders.jsp" class="btn btn-secondary mt-3">View Order</a>
	</div>

</body>
</html>