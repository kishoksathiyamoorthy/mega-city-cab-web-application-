package com.megacitycab;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AddDriverServlet")
public class AddDriverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String driverName = request.getParameter("driverName");
        String licenseNumber = request.getParameter("licenseNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "password");
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO Driver (name, licenseNumber, phoneNumber) VALUES (?, ?, ?)");
            stmt.setString(1, driverName);
            stmt.setString(2, licenseNumber);
            stmt.setString(3, phoneNumber);
            stmt.executeUpdate();
            conn.close();
            response.sendRedirect("admin_dashboard.jsp?success=Driver Added Successfully");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("admin_dashboard.jsp?error=Failed to Add Driver");
        }
    }
}
