<%@page import="com.cart.utility.Helper"%>
<%@page import="com.cart.pojo.Category"%>
<%@page import="com.cart.dao.CategoryDao"%>
<%@page import="com.cart.pojo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.cart.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.cart.utility.HibernateUtility"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyCart-[Home]</title>

<%@include file="components/common_css_js.jsp" %>

</head>
<body>
		<%@include file="components/navbar.jsp" %>
		
		<div class=container-fluid>
		<div class="row mt-3 mx-2">
		<%
		String cat=request.getParameter("category");
		
		ProductDao productDao=new ProductDao(HibernateUtility.getSessionFactory());
		List<Product> list=null;
		if(cat==null || cat.trim().equals("all"))
		{
			list = productDao.getAllProducts();
		}
		else
		{
			int cid=Integer.parseInt(cat.trim());
			list=productDao.getAllProductsById(cid); 
		}
		
		
		CategoryDao categoryDao=new CategoryDao(HibernateUtility.getSessionFactory());
		List<Category> clist=categoryDao.getCategory();
		%>
			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
					    All Products
					</a>
					
					<%
					for(Category c: clist)
					{
					%>
					<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()  %></a>
					<% 
					}
				
				    %>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row mt-4">
					<div class="col-md-12">
						<div class="card-columns">
							<% 
					for(Product p:list)
					{
							%>
							
							<div class="card product-card">
								<div class="container text-center">
									 <img class="card-img-top m-2" style="max-height: 200px; max-width: 100%; width: auto;" src="img/products/<%= p.getpPhoto() %>" alt="Card image cap">
								</div>
								<div class="card-body">
									
									<h5 class="card-title"><%= p.getpName() %></h5>
									<p class="card-text">
										<%= Helper.get10Words(p.getpDesc()) %>
									</p>
									
									<div class="card-footer text-center">
										<button class="btn custom-bg text-white" onclick="addToCart(<%= p.getpId() %>,'<%= p.getpName() %>',<%= p.getPriceAfterApplyingDiscount() %>)">Add to Cart</button>
										<button class="btn btn-outline-success ">  <%= p.getPriceAfterApplyingDiscount() %>/- <span class="text-secondary discount-label"> &#8377; <%=p.getpPrice() %> <%=p.getpDiscount() %>% off</span></button>
									
									</div>
							
								</div>
							</div>
							
							<%
							}
							if(list.size() == 0)
							{
								out.println("<h3>No item in this category</h3>");
							}
							%>
						</div>
					</div>
				</div>
			</div>
		
		</div>
		</div>
		
		<%@include file="components/common_model.jsp" %>
		<%@include file="components/footer.jsp" %>
</body>
</html>