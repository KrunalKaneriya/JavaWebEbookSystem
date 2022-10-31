<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/f.jpg");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background: #f8f8f8;
}
</style>
</head>
<body style="background: #f7f7f7">

	<%
		User user = (User)session.getAttribute("userObj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img ">
		<h2 class="text-center py-3" style="color: white">
			<i class="fa-sharp fa-solid fa-book"></i> EBook Management System
		</h2>
	</div>



	<div class="container">

		<!--================================================================================================================================-->
		<!--RECENT BOOKS-->

		<h1 class=" text-center my-3">Recent Books</h1>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> recentBooks = dao.getRecentBooks();
			for (BookDetails b : recentBooks) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img src="book/<%=b.getPhotoName()%>" width="200px" height="270px"
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
									style="background-color: #303f9f; border: #303f9f"><i
									class="fa-solid fa-cart-plus"></i>Add Cart </a>
								<% } else { %>
								<a href="cart?bid=<%=b.getBook_id() %>&&uid=<%=user.getId() %>" class="btn btn-danger "
									style="background-color: #303f9f; border: #303f9f"><i
									class="fa-solid fa-cart-plus"></i>Add Cart </a>
								<% } %>
							
							<% } %>
							<a href="view_book.jsp?bid=<%=b.getBook_id() %>" class=" btn btn-success">View</a> <a
								href="" class="btn btn-danger"
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

		<div class="text-center">
			<a href="all_recent_books.jsp" class="btn my-3"
				style="border: #303f9f; background-color: #303f9f; color: white">View
				All</a>
		</div>
	</div>

	<!--==================================================================================================================================-->
	<!--OLD BOOKS-->

	<div class="container">
		<h1 class=" text-center my-3">Old Books</h1>
		<div class="row">

			<%
			List<BookDetails> oldBooks = dao.getOldBooks();
			for (BookDetails b : oldBooks) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img src="book/<%=b.getPhotoName()%>" width="200px" height="270px"
							alt="alt" />
						<p>
							<b><%=b.getBook_name()%></b>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :
							<%=b.getBook_category()%></p>
						<div class="col">
							<a href="view_book.jsp?bid=<%=b.getBook_id() %>" class=" btn btn-success">View</a> <a
								href="" class="btn btn-danger"
								style="background-color: #303f9f; border: #303f9f"><i
								class="fas fa-rupee-sign"> </i> <%=b.getPrice()%> </a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>

			<div class="text-center">
				<a href="all_old_books.jsp" class="btn my-3"
					style="border: #303f9f; background-color: #303f9f; color: white">View
					All</a>
			</div>
		</div>


		<!--==================================================================================================================================-->
		<!--NEW BOOKS-->

		<div class="container">
			<h1 class=" text-center my-3">New Books</h1>
			<div class="row">


				<%
				List<BookDetails> newBooks = dao.getNewBooks();
				for (BookDetails b : newBooks) {
				%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img src="book/<%=b.getPhotoName()%>" width="200px"
								height="270px" alt="alt" />
							<p>
								<b><%=b.getBook_name()%></b>
							</p>
							<p><%=b.getAuthor()%></p>
							<p>
								Category :
								<%=b.getBook_category()%></p>
							<div class="col">
							
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
			
								<a href="view_book.jsp?bid=<%=b.getBook_id() %>" class=" btn btn-success">View</a> 
								<a href="" class="btn btn-danger" style="background-color: #303f9f; border: #303f9f">
									<i class="fas fa-rupee-sign"> </i> 
									<%=b.getPrice()%> 
								</a>
							</div>

						</div>
					</div>
				</div>
				<%
				}
				%>



			</div>
			<div class="text-center">
				<a href="all_new_books.jsp" class="btn my-3"
					style="border: #303f9f; background-color: #303f9f; color: white">View
					All</a>
			</div>


		</div>


	</div>


	<div style="margin-top: 187px;">
		<%@include file="all_component/footer.jsp"%>
	</div>



</body>

</html>
