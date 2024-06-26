package com.dbmsproject.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminInsertServlet
 */
@WebServlet("/AdminInsertServlet")
public class AdminInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertServlet() {
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
		    long adminconsumernumber = Long.parseLong(request.getParameter("adminconsumerno"));
	        String readingDate = request.getParameter("readingdate");
	        readingDate=readingDate+"-20";
	        Date user_Date=Date.valueOf(readingDate);
	        
	        LocalDate currentDate = LocalDate.now();
            Date currentdate = Date.valueOf(currentDate);
	        
	        int currentReading = Integer.parseInt(request.getParameter("currentreading"));
	        response.setContentType("application/json");

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver"); 
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectricityBillGeneration","root","Gadchiroli1!");
	            String sql1 = "SELECT * FROM meter WHERE consumer_no = ? ORDER BY reading_date DESC LIMIT 1";

	            PreparedStatement statement1 = con.prepareStatement(sql1);
	            statement1.setLong(1, adminconsumernumber);
	            
	            ResultSet rs1=statement1.executeQuery();
	            if(rs1.next()) {
	            	int previous_reading = rs1.getInt("current_reading"); 
	            	
	            	Date latestDate = rs1.getDate("reading_date");
	            	
	            	if ((user_Date.before(currentdate)) && (latestDate.before(user_Date))) {
	            		if(currentReading<previous_reading) {
//		            		response.sendRedirect("AdminInsert.jsp?error=1");
	            			response.getWriter().write("{\"success\": false, \"message\": \"Current Reading cannot be Smaller Than Previous Reading\"}");
		            	}
		            	else {
		            	String sql2 = "INSERT INTO meter VALUES (?, ?, ?, ?)";
	
			            PreparedStatement statement2 = con.prepareStatement(sql2);
			            statement2.setLong(1, adminconsumernumber);
			            statement2.setInt(2, previous_reading);
			            statement2.setInt(3, currentReading);
			            statement2.setDate(4, user_Date);
			            statement2.executeUpdate();
			            response.getWriter().write("{\"success\": true}");
		            	}
			            
		            }
	            	else {
//	            		response.sendRedirect("AdminInsert.jsp?error1=1");
	            		response.getWriter().write("{\"success\": false, \"message\": \"Error : Please Choose the Correct Date\"}");
	            	}
	            }
	            else {
//	                request.setAttribute("status", "Failed");
	            	 response.getWriter().write("{\"success\": false, \"message\": \" error \"}");
	            }
	            con.close();
	        } 
	        catch(Exception e){ 
	        	 response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
				}

	}

}
