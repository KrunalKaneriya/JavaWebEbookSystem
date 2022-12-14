<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background: #f8f8f8;
}
</style>
<title>Recent Books</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			User user = (User) session.getAttribute("userObj");
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> recentBooks = dao.getAllRecentBooks();
			for (BookDetails b : recentBooks) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img src="book/<%=b.getPhotoName()%>" width="150px" height="200px"
							alt="alt" />
						<p>
							<b><%=b.getBook_name()%></b>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :
							<%=b.getBook_category()%></p>
						<div class="col">

							<%
							if (b.getBook_category().equals("New")) {
							%>
								<% if(user == null) { %>
							<a href="login.jsp" class="btn btn-danger "
									style="background-color: #303f9f; border: #303f9f"> 
									<i class="fa-solid fa-cart-plus"></i>
									Add Cart
								</a> 
							
							<%} else { %>
							<a href="cart?bid=<%=b.getBook_id() %>&&uid=<%=user.getId() %>" class="btn btn-danger "
									style="background-color: #303f9f; border: #303f9f"> 
									<i class="fa-solid fa-cart-plus"></i>
									Add Cart
								</a> 
							<% }  %>
								
								
								
								
							<% } %>
							<a href="view_book.jsp?bid=<%=b.getBook_id() %>" class=" btn btn-success">View</a> <a href=""
								class="btn btn-danger"
								style="background-color: #303f9f; border: #303f9f"><i
								class="fas fa-rupee-sign"> </i> <%=b.getPrice()%> </a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>