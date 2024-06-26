package com.dbmsproject.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GetPasswordServlet
 */
@WebServlet("/GetPasswordServlet")
public class GetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		HttpSession session=request.getSession(false);
		if(session!=null && session.getAttribute("consumer_no")!=null) {
			long consumerno=(long) session.getAttribute("consumer_no");
			String password = request.getParameter("password");
			String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\W).+$";
            if (!password.matches(passwordRegex)) {
//            	response.getWriter().write("{\"success\": false, \"message\": \"Password must contain at least one capital letter, one small letter, and one special character.\"}");
            	response.sendRedirect("GetPassword.jsp?error1=1");
            } else {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver"); 
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectricityBillGeneration","root","Gadchiroli1!");
	    
	            String sql1 = "UPDATE consumer SET password = ? WHERE consumer_no=?";
	            PreparedStatement statement1 = con.prepareStatement(sql1);
	            statement1.setString(1, password);
	            statement1.setLong(2, consumerno);
		        
	            statement1.executeUpdate();
	            
	            session.invalidate();
//	            response.getWriter().write("{\"success\": true}");
	            response.sendRedirect("Login.jsp");
	        }
	        catch(Exception e){ 
//	        	response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
	        	response.sendRedirect("GetPassword.jsp?error2=1");
				}
            }
		}
		else {
//			response.getWriter().write("{\"success\": false, \"message\": \"Error\"}");
			response.sendRedirect("GetPassword.jsp?error2=1");
		}
		
	}

}
