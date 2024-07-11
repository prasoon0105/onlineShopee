package com.cart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.cart.pojo.User;
import com.cart.utility.HibernateUtility;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		    response.setContentType("text/html");  

		try{
			  PrintWriter out = response.getWriter(); 
			String UserName = request.getParameter("User_Name");
			String UserEmail = request.getParameter("User_Email");
			String UserPassward = request.getParameter("User_Pass");
			String UserPhone = request.getParameter("User_Phone");
			String UserAddress = request.getParameter("User_Add");
		
			if(UserName.isEmpty())
			{
				out.println("Name is blank");
				return;
			}
			
			User user = new User(UserName, UserEmail, UserPassward, UserPhone, "default.jpg" , UserAddress, "normal");
			Session hibSession = HibernateUtility.getSessionFactory().openSession();
			Transaction tx = hibSession.beginTransaction();
			
			int userId=(int) hibSession.save(user);
			
			tx.commit();
			hibSession.close();
			
			HttpSession https=request.getSession();
			https.setAttribute("message","Registration Successful !!"+userId);
			
			response.sendRedirect("register.jsp");
			return;
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
