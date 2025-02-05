<%@page import="java.util.Map"%>
<%@page import="com.cart.utility.Helper"%>

<%@page import="com.cart.dao.CategoryDao"%>
<%@ page import="com.cart.pojo.User"%>
<%@ page import="com.cart.pojo.Category"%>
<%@ page import="com.cart.utility.HibernateUtility"%>
<%@ page import="java.util.List"%>
<%

	User user=(User)session.getAttribute("current-user");
	if(user==null)
	{
		session.setAttribute("message","You are not logged in !! Login first");
		response.sendRedirect("login.jsp");
		return;
	}
	else
	{
		if(user.getUserType().equals("normal"))
		{
			session.setAttribute("message", "You are not admin !! Don't access this page");
			response.sendRedirect("login.jsp");
			return;
		}
	}

%>


	        	<%
	        	CategoryDao cdao=new CategoryDao(HibernateUtility.getSessionFactory());
	        	List<Category> list=cdao.getCategory();
	        	
	        	Map<String,Long> m= Helper.getCounts(HibernateUtility.getSessionFactory());
	        	%>
	        	





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Panel</title>

<%@include file="components/common_css_js.jsp" %>

<style type="text/css">
	
body{
	background: #e2e2e2;
}

</style>

</head>
<body>
	
	<%@include file="components/navbar.jsp" %>
	
	<div class="container admin">
	
	<div class="container-fluid mt-3">
		<%@include file="components/message.jsp" %>
	</div>
		<div class="row mt-3">
		
			<div class="col-md-4">
			
				<div class="card" data-toggle="tooltip" data-placement="left" title="Number of user in this website..">
				
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width: 125px" class="image-fluid rounded-circle" alt="user_icon" src="img/team.png">
						</div>
						<h1><%= m.get("userCount") %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
			
					</div>
				
				</div>
			
			</div>
			
			<div class="col-md-4">
			
				<div class="card" data-toggle="tooltip" data-placement="bottom" title="Total categories">
				
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width: 125px" class="image-fluid rounded-circle" alt="list_icon" src="img/to-do-list.png">
						</div>
						<h1><%= list.size() %></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
			
					</div>
				
				</div>
			
			</div>
			
			<div class="col-md-4">
			
				<div class="card" data-toggle="tooltip" data-placement="top" title="Total number of products">
				
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width: 125px" class="image-fluid rounded-circle" alt="product_icon" src="img/delivery-box.png">
						</div>
						<h1><%= m.get("productCount") %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
			
					</div>
				
				</div>
			
			</div>
		
		</div>
		
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-category-model">
				
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width: 125px" class="image-fluid rounded-circle" alt="add_category_icon" src="img/maths.png">
						</div>
						<p  class="mt-2">Click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
			
					</div>
				
				</div>
			</div>
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add_product-model">
				
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width: 125px" class="image-fluid rounded-circle" alt="add_product_icon" src="img/plus.png">
						</div>
						<p  class="mt-2">Click here to add new product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
			
					</div>
				
				</div>
			</div>
			
		</div>
		
		<!-- view product row -->
		<div class="row mt-3">
			<div class="col-md-12">
				<div onclick="window.location='view_products.jsp'" class="card" data-toggle="tooltip" data-placement="top" title="Click here to view all the products..">
				
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width: 125px" class="image-fluid rounded-circle" alt="add_category_icon" src="img/research.png">
						</div>
						<p  class="mt-2">Click here to view all the products</p>
						<h1 class="text-uppercase text-muted">View ProductsS</h1>
			
					</div>
				
				</div>
			</div>
			
		</div>
	</div>
	<!-- start model -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog model-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header custom-bg text-white">
	        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="ProductOperationServlet" method="post">
	        
	        	<input type="hidden" name="operation" value="addCategory" />
	        	
	        	<div class="form-group">
	        		 <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required />
	        	</div>
	        	<div class="form-group">
	        		 <textarea rows="" cols="" style="height: 200px" class="form-control" name="catDiscription" placeholder="Enter Category Description" required></textarea>
	        	</div>
	        	<div class="container text-center">
	        		<button class="btn btn-outline-success">Add Category</button>
	        		  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        	</div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- end model -->
	<!-- end model -->
	<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="add_product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog model-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
      	
      			<input type="hidden" name="operation" value="addProduct" />
      			
	        	<div class="form-group">
	        		 <input type="text" class="form-control" name="pNmae" placeholder="Enter Product Name" required />
	        	</div>
	        	<div class="form-group">
	        		 <textarea rows="" cols="" style="height: 200px" class="form-control" name="pDiscription" placeholder="Enter Product Description" required></textarea>
	        	</div>
	        	<div class="form-group">
	        		 <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required />
	        	</div>
	        	<div class="form-group">
	        		 <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required />
	        	</div>
	        	<div class="form-group">
	        		 <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required />
	        	</div>
	        	
	        	
	        	<div class="form-group">
	        		<select name="cartId" class="form-control">
	        		
	        		<%
	        		for(Category c:list){
	        		%>
	        		<option value="<%= c.getCategoryId() %>" > <%= c.getCategoryTitle() %> </option>
	        		
	        		<% } %>
	        		</select>
	        	</div>
	        	<div class="form-group">
	        		 <label for="pPic">Select picture of product</label>
	        		 <input type="file" id="pPic" class="form-control" name="pPhoto" placeholder="Enter Product Photo" required />
	        	</div>
	        	<div class="container text-center">
	        		<button class="btn btn-outline-success">Add Product</button>
	        	    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        	</div>
	        </form>
      </div>
    </div>
  </div>
</div>
	<!-- end model -->
	<%@include file="components/common_model.jsp" %>
	<script type="text/javascript">
 		  $(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
	</script>
	<%@include file="components/footer.jsp" %>
</body>
</html>