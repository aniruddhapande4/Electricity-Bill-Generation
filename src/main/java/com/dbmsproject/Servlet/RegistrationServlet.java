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
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
		        try {
		            Class.forName("com.mysql.cj.jdbc.Driver"); 
		            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectricityBillGeneration","root","Gadchiroli1!");
		    
		            String sql1 = "SELECT * FROM consumer WHERE consumer_no = ?";
		            PreparedStatement statement1 = con.prepareStatement(sql1);
		            statement1.setLong(1, consumer);
		            
		            ResultSet rs1 = statement1.executeQuery();
		            if(rs1.next()) {
		            	String password = rs1.getString("password"); 
		                if(password == null){
		                	HttpSession session=request.getSession();
		                	session.setAttribute("consumer_no", consumer);
			            	response.sendRedirect("GetPassword.jsp");
			            }
			            else {
			            	response.sendRedirect("Registration.jsp?error2=1");
			            }
			            
		            }
		            else {
		            	response.sendRedirect("Registration.jsp?error1=1");
		            }
		      
		        }
		        catch(Exception e){ 
					System.out.println(e);
					}
	}

}
