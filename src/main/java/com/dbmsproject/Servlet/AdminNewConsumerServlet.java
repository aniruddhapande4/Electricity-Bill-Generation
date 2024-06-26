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

@WebServlet("/AdminNewConsumerServlet")
public class AdminNewConsumerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminNewConsumerServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long adminconsumernumber = Long.parseLong(request.getParameter("adminconsumerno"));
        String fullname = request.getParameter("fullname");
        String typeofconsumer = request.getParameter("typeofconsumer");
        String emailid = request.getParameter("email");
        long contactno = Long.parseLong(request.getParameter("contact"));
        String address = request.getParameter("address");

        response.setContentType("application/json");
        boolean hasNumber = fullname.chars().anyMatch(Character::isDigit);

        if (hasNumber) {
            response.getWriter().write("{\"success\": false, \"message\": \"Invalid name\"}");
        } else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectricityBillGeneration", "root", "Gadchiroli1!");
                
                String sql1 = "SELECT * FROM meter WHERE consumer_no = ?";
                PreparedStatement statement1 = con.prepareStatement(sql1);
                statement1.setLong(1, adminconsumernumber);
                ResultSet rs1 = statement1.executeQuery();

                if (rs1.next()) {
                    response.getWriter().write("{\"success\": false, \"message\": \"Consumer number already exists.\"}");
                } else {
                    String sql3 = "INSERT INTO consumer VALUES (?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement3 = con.prepareStatement(sql3);
                    statement3.setLong(1, adminconsumernumber);
                    statement3.setString(2, fullname);
                    statement3.setNull(3, java.sql.Types.VARCHAR);
                    statement3.setString(4, typeofconsumer);
                    statement3.setString(5, emailid);
                    statement3.setLong(6, contactno);
                    statement3.setString(7, address);
                    statement3.executeUpdate();
                    
                    String sql2 = "INSERT INTO meter VALUES (?, ?, ?, ?)";
                    LocalDate currentDate = LocalDate.now();
                    Date date = Date.valueOf(currentDate);
                    PreparedStatement statement2 = con.prepareStatement(sql2);
                    statement2.setLong(1, adminconsumernumber);
                    statement2.setInt(2, 0);
                    statement2.setInt(3, 0);
                    statement2.setDate(4, date);
                    statement2.executeUpdate();
                    
                    response.getWriter().write("{\"success\": true}");
                }
                con.close();
            } catch (Exception e) {
                response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
            }
        }
    }
}
