<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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

#snackbar {
	visibility: hidden; /* Hidden by default. Visible on click */
	min-width: 250px; /* Set a default minimum width */
	margin-left: -125px; /* Divide value of min-width by 2 */
	background-color: #333; /* Black background color */
	color: #fff; /* White text color */
	text-align: center; /* Centered text */
	border-radius: 2px; /* Rounded borders */
	padding: 16px; /* Padding */
	position: fixed; /* Sit on top of the screen */
	z-index: 1; /* Add a z-index if needed */
	left: 50%; /* Center the snackbar */
	bottom: 30px; /* 30px from the bottom */
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
	visibility: visible; /* Show the snackbar */
	/* Add animation: Take 0.5 seconds to fade in and out the snackbar.
  However, delay the fade out process for 2.5 seconds */
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@
-webkit-keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
-webkit-keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@
keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
<title>Recent Books</title>
</head>
<body>

	<%
	User user = (User) session.getAttribute("userObj");
	%>

	<c:if test="${ not empty addCart }">
		<div id="snackbar">${addCart}</div>
		

		<script type="text/javascript">
			myFunction();
			function myFunction() {
				// Get the snackbar DIV
				var x = document.getElementById("snackbar");

				// Add the "show" class to DIV
				x.className = "show";

				// After 3 seconds, remove the show class from DIV
				setTimeout(function() {
					x.className = x.className.replace("show", "");
				}, 3000);
			}
		</script>
		<c:remove var="addCart" scope="session"/>
	</c:if>


	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> recentBooks = dao.getAllNewBooks();
			for (BookDetails b : recentBooks) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img src="book/<%=b.getPhotoName()%>" width="150px" height="200px"
							alt="alt" class="img-thumblin" />
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
								
								<a
								href="view_book.jsp?bid=<%=b.getBook_id()%>"
								class=" btn btn-success">View</a> <a href=""
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