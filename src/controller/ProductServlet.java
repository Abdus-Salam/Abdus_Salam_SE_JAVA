package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import dao.ProductDao;
import model.Product;
import util.HibernateUtil;


/**
 * Servlet implementation class Product
 * @author Abdus Salam
 * @since 21/12/2019
 */

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private ProductDao productDao = null;
	
	public void init() {
		productDao = new ProductDao();
	}
	
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// delete record by id
    	if(request.getParameter("delete") != null) {
    		productDao.deleteProduct(Integer.parseInt(request.getParameter("delete")));
    		request.setAttribute("success", "<h3> Product is delete successfully. </h3>");
    	}
    	
    	// update
//    	if(request.getParameter("update") != null) {
//    		productDao.updateProduct(Integer.parseInt(request.getParameter("delete")));
//    		request.setAttribute("success", "<h3> Product is update successfully. </h3>");
//    	}
    	
    	
    	List<Product> listOfProducts = productDao.getAllProduct();
    	request.setAttribute("listOfProducts", listOfProducts);
		request.getRequestDispatcher("listOfProduct.jsp").forward(request, response); 
	}
    
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String name;
		int price, profit, type;
		
		name = request.getParameter("name").toString();
		price = Integer.parseInt(request.getParameter("price"));
		profit = Integer.parseInt(request.getParameter("profit"));
		type = Integer.parseInt(request.getParameter("type"));
		
		String validationResult = validation(name, price, profit, type);
		if(validationResult != "") {
		   validationResult = "<h3>Product isn't inserted successfully. Please check the following error.</h3> <br> " + validationResult; 
		   
		   request.setAttribute("error", validationResult);
		  // response.sendRedirect(request.getContextPath() + "/addProduct.jsp");
		   request.getRequestDispatcher("addProduct.jsp").forward(request, response); 
		}
		
		model.Product product = new model.Product(name, price, profit, type);
	
		ProductDao p = new ProductDao();
		p.saveProduct(product);
		
		request.setAttribute("success", "<h3> Product is inserted successfully. </h3>");
		request.getRequestDispatcher("addProduct.jsp").forward(request, response); 
	}
	
	
	/**
	 * @param name
	 * @param price
	 * @param profit
	 * @param type
	 * @return string message
	 */
	
	private String validation(String name, int price, int profit, int type) {
		String result = "";
		int  flag = 1;
		
		if(name == "") {
			result += flag++ + ".Product name field is required * <br>";
		}
		
		if(price == 0) {
			result += flag++ + ".Product price field is required * <br>";
		}
		
		if(profit == 0) {
			result += flag++ + ".Product profit field is required * <br>";
		}
		
		if(type == 0) {
			result += flag++ + ".Product type field is required * <br>";
		}
		
		return result;
	}
}