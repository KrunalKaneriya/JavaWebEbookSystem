<%-- 
    Document   : all_books
    Created on : Oct 27, 2022, 8:51:56 PM
    Author     : Administrator
--%>

<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>

	<!-- This snippet will check the value and print it for session only -->
	<c:if test="${not empty successMessage }">
		<h5 class="text-center text-success">${successMessage }</h5>

		<c:remove var="updateBookSuccess" scope="session" />
	</c:if>

	<c:if test="${not empty failedMessage }">
		<h5 class="text-center text-danger">${failedMessage }</h5>
		<c:remove var="updateBookFailed" scope="session" />
	</c:if>

	<div class="container">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Status</th>
					<th scope="col">Email</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list = dao.getAllBookDetails();

				for (BookDetails b : list) {
				%>

				<tr>
					<td><%=b.getBook_id()%></td>
					<td><img src="../book/<%=b.getPhotoName()%>"
						style="width: 50px; height: 50px;"></td>
					<td><%=b.getBook_name()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBook_category()%></td>
					<td><%=b.getStatus()%></td>
					<td><%=b.getEmail()%></td>
					<td><a href="edit_books.jsp?id=<%=b.getBook_id()%>"
						class="btn btn-sm btn-primary">Edit</a>
						<a href="../delete?id=<%=b.getBook_id() %>" class="btn btn-sm btn-danger">Delete</a></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<div style="margin-top: 200px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>