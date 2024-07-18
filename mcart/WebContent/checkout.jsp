<%

	User user=(User)session.getAttribute("current-user");
	if(user==null)
	{
		session.setAttribute("message","You are not logged in !! Login first to access checkout page");
		response.sendRedirect("login.jsp");
		return;
	}

%>








<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your Selected Item</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your Details For Order</h3>
						<form action="#!">
						
						  <div class="form-group">
	 					 	 <label for="exampleInputEmail1">Email address</label>
	    				 	 <input type="email" value="<%= user.getUserEmail() %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
	  					  	<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
	 					 </div>
	 					 <div class="form-group">
	 					 	 <label for="exampleInputEmail1">Your name</label>
	    				 	 <input type="text" value="<%= user.getUserName() %>" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
	 					 </div>
	 					 <div class="form-group">
	 					 	 <label for="exampleInputEmail1">Your contact</label>
	    				 	 <input type="number" value="<%= user.getUserPhone() %>" class="form-control" id="number" aria-describedby="emailHelp" placeholder="Enter your contact">
	 					 </div>
						 <div class="form-group">
   						 	<label for="exampleFormControlTextarea1">Your shipping address</label>
   						 	<textarea class="form-control" value="<%= user.getUserAddress() %>" id="exampleFormControlTextarea1" rows="3" placeholder="Enter your address"></textarea>
 						 </div>
 						 <div class="container text-center">
 						 	<button class="btn btn-outline-success">Order Now</button>
 						 	<button class="btn btn-outline-primary">Continue Shopping</button>
 						 </div>
						
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<%@include file="components/common_model.jsp" %>
	<%@include file="components/footer.jsp" %>
</body>
</html>