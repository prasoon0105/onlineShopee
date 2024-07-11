<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User</title>

<%@include file="components/common_css_js.jsp" %>

</head>
<body>

	<%@include file="components/navbar.jsp" %>
	
	<div class="container-fluid">
	
	<div class="row mt-4">
		<div class="col-md-4 offset-md-4">
		
		<div class="card">
			<%@include file="components/message.jsp" %>
		<div class="card-body px-4">
		
			 <div class="container text-center">
			 <img alt="" src="img/6310507.jpg" style="max-width: 100px" class="img-fluid">
			 </div>
			<h3 class="text-center my-3">Sign up here !!</h3>
			<form action="RegisterServlet" method="post">
				 <div class="form-group">
   				 <label for="name">User Name</label>
   				 <input type="text" name="User_Name" class="form-control" placeholder="Enter Here" id="name" aria-describedby="emailHelp">
   				 </div>
   				 
   				 <div class="form-group">
   				 <label for="email">User Email</label>
   				 <input type="email" name="User_Email" class="form-control" placeholder="Enter Here" id="email" aria-describedby="emailHelp">
   				 </div>
   				 
   				 <div class="form-group">
   				 <label for="passward">User Passward</label>
   				 <input type="passward" name="User_Pass" class="form-control" placeholder="Enter Here" id="passward" aria-describedby="emailHelp">
   				 </div>
   				 
   				 <div class="form-group">
   				 <label for="phone">User Phone</label>
   				 <input type="number" name="User_Phone" class="form-control" placeholder="Enter Here" id="phone" aria-describedby="emailHelp">
   				 </div>
   				 
   				 <div class="form-group">
   				 <label for="phone">User Address</label><br>
   				 <textarea style = "height: = 200px;" name="User_Add" class = "form-control" placeholder="Enter Your Address"></textarea>
   				 </div>
   				 
   				 <div class="container text-center">
   				 <button class="btn btn-outline-success">Register</button>
   				 <button class="btn btn-outline-warning">Reset</button>
   				 </div>
			</form>
		</div>
		</div>
		
		</div>
	</div>
	
	</div>
	
</body>
</html>