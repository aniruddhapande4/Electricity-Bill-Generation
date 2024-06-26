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
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
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
		int adminid = Integer.parseInt(request.getParameter("adminid"));
        String password = request.getParameter("password");
        response.setContentType("application/json");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ElectricityBillGeneration","root","Gadchiroli1!");
            String sql = "SELECT * FROM admin WHERE admin_id=? AND password=?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, adminid);
            statement.setString(2, password);
            
            ResultSet rs=statement.executeQuery();
            if(rs.next()) {
            	HttpSession session=request.getSession();
            	session.setAttribute("admin_id", rs.getInt("admin_id"));
            	response.getWriter().write("{\"success\": true}");
//            	response.sendRedirect("index.jsp");
            } 
            else {
//                response.sendRedirect("AdminLogin.jsp?error=1");
            	response.getWriter().write("{\"success\": false, \"message\": \"Invalid Username or Password, Please Try Again\"}");
            }
            con.close();
        } 
        catch(Exception e){ 
//        	 System.out.println(e);
        	response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
			}
	}

}
