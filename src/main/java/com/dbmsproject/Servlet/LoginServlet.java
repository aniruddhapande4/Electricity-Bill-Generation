package com.dbmsproject.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		    long consumer = Long.parseLong(request.getParameter("consumer_no"));
	        String password = request.getParameter("password");
	        response.setContentType("application/json");
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver"); 
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectricityBillGeneration","root","Gadchiroli1!");
	            String sql = "SELECT * FROM consumer WHERE consumer_no=? AND password=?";
	            PreparedStatement statement = con.prepareStatement(sql);
	            statement.setLong(1, consumer);
	            statement.setString(2, password);
	            
	            ResultSet rs=statement.executeQuery();
	            if(rs.next()) {
	            	HttpSession session=request.getSession();
	            	session.setAttribute("consumer_no", rs.getLong("consumer_no"));
	                session.setAttribute("full_name", rs.getString("full_name"));
	                session.setAttribute("typeofconsumer", rs.getString("type"));
	                session.setAttribute("emailid", rs.getString("email_id"));
	                session.setAttribute("contact", rs.getLong("contact"));
	                session.setAttribute("address", rs.getString("address"));
	                response.getWriter().write("{\"success\": true}");
	            } 
	            else {
//	                request.setAttribute("status", "Failed");
//	                response.sendRedirect("Login.jsp?error=1");
	            	response.getWriter().write("{\"success\": false, \"message\": \"Error\"}");
	            }
	            con.close();
	        } 
	        catch(Exception e){ 
	        	 response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
				}
	}

}
