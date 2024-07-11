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
import org.hibernate.Transaction;

import com.cart.dao.UserDao;
import com.cart.pojo.User;
import com.cart.utility.HibernateUtility;

/**
 * Servlet implementation class LoginServelet
 */
@WebServlet("/LoginServelet")
public class LoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   response.setContentType("text/html");  

			try{
				  PrintWriter out = response.getWriter(); 
				String UserEmail = request.getParameter("email");
				String UserPassward = request.getParameter("pass");
			
				UserDao userDao=new UserDao(HibernateUtility.getSessionFactory());
				User user = userDao.getUserByEmailAndPassword(UserEmail, UserPassward);
				//System.out.println(user);
				
				HttpSession http=request.getSession();
				if(user == null)
				{
					http.setAttribute("message", "Invalid Detail !!");
					response.sendRedirect("login.jsp");
					return;
				}
				else
				{
					out.println("<h1>Welcome " +user.getUserName()+ " </h1");
					
					http.setAttribute("current-user", user);
					
					if(user.getUserType().equals("admin"))
					{
						response.sendRedirect("admin.jsp");
					}
					else if(user.getUserType().equals("normal"))
					{
						response.sendRedirect("normal.jsp");
					}
					else
					{
						out.println("We have not identified user type");
					}
					
				}
				
			}
			catch(Exception e){
				e.printStackTrace();
			}
	}

}
