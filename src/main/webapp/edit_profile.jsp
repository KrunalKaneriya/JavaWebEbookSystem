<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
						
						<!-- This snippet will check the value and print it for session only -->
						<c:if test="${not empty success}">
							<h5 class="text-center text-success">${success}</h5>
							<c:remove var="success" scope="session" />
						</c:if>

						<c:if test="${not empty failed}">
							<p class="text-center text-danger">${failed}</p>
							<c:remove var="failed" scope="session" />
						</c:if>
						
						

						<form action="update_profile" method="post">
						
							<input type="hidden" value="${userObj.id }" name="userid"/>

							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input name="name"
									type="text" class="form-control" id="exampleInputEmail1" value="${userObj.name}">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail2">Email Address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail2" value="${userObj.email }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail3">Phone No</label> <input
									name="phno" type="number" class="form-control"
									id="exampleInputEmail3" value="${userObj.phno }">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail3">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputEmail3">
							</div>

							<div class="text-center p-2">
								<input type="submit" name="submit" id="signup"
									class="btn btn-primary btn-block btn-sm" value="Update" />
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>