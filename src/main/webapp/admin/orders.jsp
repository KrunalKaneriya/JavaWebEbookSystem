<%-- 
    Document   : all_books
    Created on : Oct 27, 2022, 8:51:56 PM
    Author     : Administrator
--%>

<%@page import="com.entity.User"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: All Orders</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <!-- Redirect if User is not Logged in -->
	<c:if test="${empty userObj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	
        <h3 class="text-center">Hello Admin</h3>

        <div class="container">
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Address</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                
                <%
					User user = (User)session.getAttribute("userObj");
					OrderDAOImpl daoImpl = new OrderDAOImpl(DBConnect.getConn());
					
					List<Book_Order>blist = daoImpl.getBooks();
					for(Book_Order book:blist) {
				%>
				<tr>
					<td><%= book.getOrder_id() %></td>
					<td><%=book.getUserName() %></td>
					<td><%=book.getEmail() %></td>
					<td><%=book.getFullAddress() %></td>
					<td><%=book.getPhno() %></td>
					<td><%=book.getBookName() %></td>
					<td><%=book.getAuthorName() %></td>
					<td><%=book.getPrice() %></td>
					<td><%=book.getPayment_type() %></td>
				</tr>
				<% } %>

                </tbody>
            </table>
        </div>
        
        <div style="margin-top:200px;">
            <%@include file="footer.jsp" %>
        </div>
        
    </body>
</html>