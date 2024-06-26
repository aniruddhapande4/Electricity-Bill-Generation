package com.dbmsproject.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.YearMonth;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AnalysisServlet
 */
@WebServlet("/AnalysisServlet")
public class AnalysisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnalysisServlet() {
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
        String typeofconsumer=request.getParameter("typeofconsumer");
        String fromdate =request.getParameter("from_date");
		String todate =request.getParameter("to_date");

        YearMonth fromYearMonth = YearMonth.parse(fromdate);
        YearMonth toYearMonth = YearMonth.parse(todate);

        LocalDate fromDate = fromYearMonth.atDay(1);
        LocalDate toDate = toYearMonth.atEndOfMonth();

        response.setContentType("application/json");
        
        Date sqlFromDate = Date.valueOf(fromDate);
        Date sqlToDate = Date.valueOf(toDate);
        Connection con=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectricityBillGeneration","root","Gadchiroli1!");
                 
            String sql1="SELECT * FROM consumer NATURAL JOIN meter WHERE previous_reading=0 AND current_reading=0 AND type=?";
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            
            stmt1.setString(1, typeofconsumer);
            
            ResultSet rs1=stmt1.executeQuery();
            int count=0;
            while (rs1.next()) {
            	Date sqlDate = rs1.getDate("reading_date");
                if ((sqlDate.after(sqlFromDate)) && (sqlDate.before(sqlToDate))) {
                	count++;
            	}
            }
            request.setAttribute("count", count);
//            response.getWriter().write("{\"success\": true}");
            response.getWriter().write("{\"success\": true, \"message\": \"The Count of New Consumer : "+count+"\"}");

        } 
        catch(Exception e){ 
        	response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
			}
	}

}
