package com.MegaCityCab;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String pickup = request.getParameter("pickupLocation");
        String drop = request.getParameter("dropLocation");
        String carType = request.getParameter("carType");
        String bookingDate = request.getParameter("date");

        try {
            Connection conn = DatabaseConnection_1.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO bookings (userID, pickupLocation, dropLocation, carType, status, date) VALUES (?, ?, ?, ?, ?, ?)");
            stmt.setInt(1, Integer.parseInt(userID));
            stmt.setString(2, pickup);
            stmt.setString(3, drop);
            stmt.setString(4, carType);
            stmt.setString(5, "Pending");
            stmt.setString(6, bookingDate);
            stmt.executeUpdate();
            conn.close();
            response.sendRedirect("dashboard.jsp?success=Booking Successful");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp?error=Booking Failed");
        }
    }
}
