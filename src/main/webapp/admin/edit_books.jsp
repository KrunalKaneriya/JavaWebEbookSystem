<%-- 
    Document   : add_books
    Created on : Oct 27, 2022, 8:48:07 PM
    Author     : Administrator
--%>

<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>

						<%
						int id = Integer.parseInt((request.getParameter("id")));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDetails book = dao.getBookById(id);
						%>

						<form action="../edit_books" method="post">
						
							<input type="hidden" name="id" value="<%= book.getBook_id()%>"/>

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" value="<%=book.getBook_name()%>">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail2">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail2" value="<%=book.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail3">Price</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputEmail3" value="<%=book.getPrice()%>">
							</div>


							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(book.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>

								</select>
							</div>

							<button type="submit" class="btn btn-primary">Update Book</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 187px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>