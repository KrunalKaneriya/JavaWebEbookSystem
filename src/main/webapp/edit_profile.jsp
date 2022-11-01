<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Edit Profile</h4>
						
						<form>
					
						<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input
									name="name" type="text" class="form-control"
									id="exampleInputEmail1">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail2">Email Address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail2">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail3">Phone No</label> <input
									name="phno" type="number" class="form-control"
									id="exampleInputEmail3">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail3">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputEmail3">
							</div>
							
							<div class="text-center p-2">
								<input type="submit" name="submit" id="signup"
									class="btn btn-primary btn-block btn-sm" value="Update"
									 />
							</div>
							
							</form>
					
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>