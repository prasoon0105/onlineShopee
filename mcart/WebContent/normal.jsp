<%@ page import="com.cart.pojo.User"%>
<%@page import="com.cart.pojo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.cart.dao.ProductDao"%>
<%@ page import="com.cart.utility.HibernateUtility"%>
<%@page import="com.cart.pojo.Category"%>
<%@page import="com.cart.dao.CategoryDao"%>

<%

	User user=(User)session.getAttribute("current-user");
	if(user==null)
	{
		session.setAttribute("message","You are not logged in !! Login first");
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
<title>Normal user panel</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
    <%@include file="components/navbar.jsp" %>
    
    <div class="container mt-4">
        <h2>Featured Products</h2>
      
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
      
        <div id="featuredCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
            <% 
					for(Product p:list)
					{
							%>
                    <div class="carousel-item <%= p.getpId() == 0 ? "active" : "" %>">
                        <img src="<%= p.getpPhoto() %>" class="d-block w-100" alt="<%= p.getpName() %>">
                        <div class="carousel-caption d-none d-md-block">
                            <h5><%= p.getpName() %></h5>
                            <p><%= p.getpDesc() %></p>
                        </div>
                    </div>
                <% } %>
            </div>
            <a class="carousel-control-prev" href="#featuredCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#featuredCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <%@include file="components/footer.jsp" %>
</body>
</html>