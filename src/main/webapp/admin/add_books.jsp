<%-- 
    Document   : add_books
    Created on : Oct 27, 2022, 8:48:07 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
						<h4 class="text-center">Add Books</h4>
						<form action="../AdminAddBookServlet" method="post" enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail2">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail2">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail3">Price</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputEmail3">
							</div>

							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="btype" class="form-control">
									<option selected>--Select--</option>
									<option value="New">New Book</option>

								</select>
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="bstatus" class="form-control">
									<option selected>--Select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>

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