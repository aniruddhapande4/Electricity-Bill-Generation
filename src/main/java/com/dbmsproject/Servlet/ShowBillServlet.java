package com.dbmsproject.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ShowBillServlet
 */
@WebServlet("/ShowBillServlet")
public class ShowBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBillServlet() {
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
		HttpSession session2 = request.getSession(false);
		// Check if the session is not null and the username attribute is set
        long consumerno = (long) session2.getAttribute("consumer_no");
        String type=(String) session2.getAttribute("typeofconsumer");
        
		String yearmonth =request.getParameter("reading_date");
        Connection con=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectricityBillGeneration","root","Gadchiroli1!");
            
            
            String date = yearmonth+"-"+"20";
            request.setAttribute("todate", date);

            
            // Parse the date string to LocalDate
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate currentDate = LocalDate.parse(date, formatter);
        	// Calculate the same date in the previous month
            LocalDate previousMonthDate = currentDate.minusMonths(1);
            // Format the previous month date back to string
            String previousMonthDateString = previousMonthDate.format(formatter);
            request.setAttribute("fromdate", previousMonthDateString);
            
            
            
            String BillDate=yearmonth+"-28";
            request.setAttribute("BillDate", BillDate);
            
            
            
            LocalDate date1 = LocalDate.parse(BillDate, formatter);
            // Add 15 days to the date
            LocalDate newDate = date1.plusDays(15);
            // Format the new date back to string
            String BillDueDate = newDate.format(formatter);
            request.setAttribute("BillDueDate", BillDueDate);
            
            
            
            
            String FullName=(String) session2.getAttribute("full_name");
            request.setAttribute("FullName", FullName);
            
            
            
            String Address=(String) session2.getAttribute("address");
            request.setAttribute("Address", Address);
            
            
            String sql1="SELECT previous_reading,current_reading FROM meter WHERE reading_date=? AND consumer_no=?";
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            
            stmt1.setString(1, date);
            stmt1.setLong(2, consumerno);
            
            ResultSet rs1=stmt1.executeQuery();
            if (rs1.next()) {
                // Retrieve user information and readings
                int previousReading = rs1.getInt("previous_reading");
                int currentReading = rs1.getInt("current_reading");
             // Calculate units consumed
                int unitsConsumed = currentReading - previousReading;

                // You might have your own logic to calculate unit charge and total bill amount
                
                String sql2="SELECT charge_per_unit FROM tariff WHERE min_units<=? AND max_units>=? AND type=?";
                PreparedStatement stmt2 = con.prepareStatement(sql2);
                
                stmt2.setInt(1, unitsConsumed);
                stmt2.setInt(2, unitsConsumed);
                stmt2.setString(3, type);
                
                ResultSet rs2=stmt2.executeQuery();
                if(rs2.next()) {
	                int unitCharge = rs2.getInt("charge_per_unit"); // Sample unit charge
	                int totalBillAmount = unitsConsumed * unitCharge;
	                int totalBillAmountAfterDueDate=totalBillAmount+20;
	
	                // Set attributes to forward to the JSP page
	                request.setAttribute("consumerNumber", consumerno);
	                request.setAttribute("previousReading", previousReading);
	                request.setAttribute("currentReading", currentReading);
	                request.setAttribute("unitsConsumed", unitsConsumed);
	                request.setAttribute("unitCharge", unitCharge);
	                request.setAttribute("totalBillAmount", totalBillAmount);
	                request.setAttribute("totalBillAmountAfterDueDate",totalBillAmountAfterDueDate);
	
	                // Forward to the JSP page to display the electricity bill
	                request.getRequestDispatcher("ElectricityFinalBill.jsp").forward(request, response);
                }
                else {
//                	response.setContentType("text/html");
//                    PrintWriter out = response.getWriter();
//                    out.println("<h1>No data found for the selected month and year.</h1>");
                	response.sendRedirect("DateOption.jsp?GenerateError=1");
                }
            } else {
                // No data found for the selected month and year
//                response.setContentType("text/html");
//                PrintWriter out = response.getWriter();
//                out.println("<h1>No data found for the selected month and year.</h1>");
            	response.sendRedirect("DateOption.jsp?GenerateError1=1");
            }
        } 
        catch(Exception e){ 
			System.out.println(e);
			}

	}

}
