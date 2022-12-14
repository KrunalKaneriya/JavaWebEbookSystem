<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>


<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-6">
            <h3 style="color:#303f9f"><i class="fa-sharp fa-solid fa-book"></i> Ebook</h3>
    </div>
        <div class="col-md-3">   
        <form class="d-flex" role="search" action="search.jsp" method="post">
	        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="ch">
	       	<button class="btn btn-primary" type="submit"> Search </button>
      </form>
</div>

		<c:if test="${not empty userObj}">
		
		
		
		 <div class="col-md-3">
		 		<a href="checkout.jsp"><i class="fas fa-cart-plus"></i></a>	
	            <a href="" class="btn btn-outline-success"><i class="fa-solid fa-user-plus"></i> ${userObj.name} </a>
	            <a href="logout" class="btn btn-outline-primary"><i class="fa-solid fa-right-to-bracket"></i> Logout </a>
	     </div>
		
		</c:if>
		
		<c:if test="${empty userObj}">
		<div class="col-md-2">
	            <a href="login.jsp" class="btn btn-outline-success"><i class="fa-solid fa-right-to-bracket"></i> Login </a>
	            <a href="register.jsp" class="btn btn-outline-primary"><i class="fa-solid fa-user-plus"></i> SignUp </a>
	    </div>
		</c:if>
		
		
       
</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom" style="background: #303f9f">
  <div class="container-fluid">
   
    <button class="navbar-toggler " type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            
            <a class=" nav-link active mx-1" aria-current="page" href="index.jsp"><i class="fa-solid fa-house-chimney"></i> Home</a>
           </li>
         <li class="nav-item ">
          <a class="nav-link active" href="all_recent_books.jsp"><i class="fa-sharp fa-solid fa-book-open"></i> Recent Book </a>
         </li><!-- comment -->
        <li class="nav-item ">
          <a class="nav-link active" href="all_new_books.jsp"><i class="fa-sharp fa-solid fa-book-open"></i> New Book </a>
        </li>
        
        <li class="nav-item active">
            <a class="nav-link active" href="all_old_books.jsp"><i class="fa-sharp fa-solid fa-book-open"></i> Old Book </a>
        </li>
      </ul>
   <div class="col-md-3">
            <a href="setting.jsp" class="btn btn-light"><i class="fa-solid fa-gears"></i> Setting </a>
            <a href="helpline.jsp" class="btn btn-light"><i class="fa-solid fa-address-book"></i> Contact Us </a>
        </div>
    </div>
  </div>
</nav>