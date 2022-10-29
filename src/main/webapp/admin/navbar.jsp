<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@include file="allCss.jsp"%>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-6">
			<h3 style="color: #303f9f">
				<i class="fa-sharp fa-solid fa-book"></i> Ebook
			</h3>
		</div>
		<div class="col-md-4">
			
		</div>
		<div class="col-md-2">

			<c:if test="${ not empty userObj}">
				<a href="#" class="btn btn-outline-success"><i
					class="fas fa-user"></i> ${userObj.getName()} </a>
				<a data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-outline-danger"><i
					class="fas fa-sign-out"></i> Logout </a>

			</c:if>

			<c:if test="${empty userObj}">
				<a href="../login.jsp" class="btn btn-outline-success"><i
					class="fa-solid fa-right-to-bracket"></i> Login </a>
				<a href="../register.jsp" class="btn btn-outline-primary"><i
					class="fa-solid fa-user-plus"></i> SignUp </a>

			</c:if>




		</div>
	</div>
</div>


<!-- logout modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
        <div class="text-center">
         <h4>Do you want to logout? </h4>
         <a href="../logout"><button type="button" class="btn btn-danger ">Log Out</button></a>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
        
        
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>

<!-- end logout modal -->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom"
	style="background: #303f9f">
	<div class="container-fluid">

		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class=" nav-link active mx-1"
					aria-current="page" href="home.jsp"><i
						class="fa-solid fa-house-chimney"></i> Home</a></li>

			</ul>

		</div>
	</div>
</nav>

