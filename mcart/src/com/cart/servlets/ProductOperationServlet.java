package com.cart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.cart.dao.CategoryDao;
import com.cart.dao.ProductDao;
import com.cart.pojo.Category;
import com.cart.pojo.Product;
import com.cart.utility.HibernateUtility;


/**
 * Servlet implementation class ProductOperationServlet
 */
@WebServlet("/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOperationServlet() {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		   response.setContentType("text/html");  

			try{
				  PrintWriter out = response.getWriter(); 
				  
				String op = request.getParameter("operation");
				if(op.trim().equals("addCategory"))
				{
					String title = request.getParameter("catTitle");
					String description = request.getParameter("catDiscription");
					
					Category category=new Category();
					category.setCategoryTitle(title);
					category.setCategoryDesc(description);
					
					CategoryDao categoryDao=new CategoryDao(HibernateUtility.getSessionFactory());
					int catId=categoryDao.saveCategory(category);
					
					HttpSession httpSession=request.getSession();
					{
						httpSession.setAttribute("message", "Category Added Successfully : " +catId);
						response.sendRedirect("admin.jsp");
						return;
					}
					
					
				}
				else if(op.trim().equals("addProduct"))
				{
					String pName = request.getParameter("pNmae");
					String pDesc = request.getParameter("pDiscription");
					int pPrice = Integer.parseInt(request.getParameter("pPrice"));
					int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
					int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
					int catId = Integer.parseInt(request.getParameter("cartId"));
					Part part=request.getPart("pPhoto");
					
					Product p=new Product();
					p.setpName(pName);
					p.setpDesc(pDesc);
					p.setpPrice(pPrice);
					p.setpDiscount(pDiscount);
					p.setpQuantity(pQuantity);
					p.setpPhoto(part.getSubmittedFileName());
					
					CategoryDao categoryDao1=new CategoryDao(HibernateUtility.getSessionFactory());
					Category category=categoryDao1.getCategoryById(catId);
					p.setCategory(category);
					
					ProductDao productDao=new ProductDao(HibernateUtility.getSessionFactory());
					productDao.saveProduct(p);
					
					String path=request.getRealPath("img") + File.separator + "products" +File.separator+part.getSubmittedFileName();
					System.out.println(path);
					
					try {
					
					FileOutputStream fos=new FileOutputStream(path);
					InputStream is =part.getInputStream();
					byte[] Data=new byte[is.available()];
					
					is.read(Data);
					
					fos.write(Data);
					
					fos.close();
					
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					out.println("Product save success...");
					HttpSession httpSession=request.getSession();
					{
						httpSession.setAttribute("message", "Product Added Successfully...");
						response.sendRedirect("admin.jsp");
						return;
					}
				}
				
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	}

}
