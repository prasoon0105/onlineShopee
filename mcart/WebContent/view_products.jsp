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






<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Panel-Products page</title>

<%@include file="components/common_css_js.jsp" %>

<style type="text/css">
	
body{
	background: #e2e2e2;
}

</style>

</head>
<body>

	<%@include file="components/navbar.jsp" %>


	<%@include file="components/common_model.jsp" %>
	<%@include file="components/footer.jsp" %>
</body>
</html>