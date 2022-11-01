<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-secondary">Sell Book</h4>

						<!-- This snippet will check the value and print it for session only  -->
						
						<c:if test="${not empty bookAddSuccess }">
							<p class="text-center text-success">${bookAddSuccess }</p>

							<c:remove var="bookAddSuccess" scope="session" />
						</c:if>

						<c:if test="${not empty bookAddFailed }">
							<p class="text-center text-danger">${bookAddFailed }</p>
							<c:remove var="bookAddFailed" scope="session" />
						</c:if>



						<form action="add_old_book" method="post"
							enctype="multipart/form-data">
							
							<input type="hidden" value="${userObj.email }" name="email"/>

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
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary mt-3">Sell Book</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>