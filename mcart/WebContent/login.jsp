<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class ="card-header custom-bg text-white">
					<h3>Login here</h3>
					</div>
					
					<div class="card-body">
					
					<%@include file="components/message.jsp" %>
					
						<form action="LoginServelet" method="post">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" placeholder="Enter email">
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input type="password" class="form-control" id="exampleInputPassword1" name="pass" placeholder="Password">
						  </div>
						  <a href="register.jsp" class="text-center d-block mb-2">If not register Click here</a>
						  <div class="container text-center">
						  	<button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
						  	<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
						</form>
						  </div>
						  
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="components/footer.jsp" %>
</body>
</html>