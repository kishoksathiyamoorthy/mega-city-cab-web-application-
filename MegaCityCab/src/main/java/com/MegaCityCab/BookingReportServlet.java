package com.megacitycab;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDate;

@WebServlet("/BookingReportServlet")
public class BookingReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=BookingReport.csv");

        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

        if (fromDate == null || toDate == null) {
            fromDate = LocalDate.now().minusDays(7).toString(); // Default: Last 7 days
            toDate = LocalDate.now().toString();
        }

        try (PrintWriter out = response.getWriter()) {
            // Adding column headers with proper formatting
            out.println("Booking ID,Customer ID,Pickup Location,Drop Location,Car Type,Status,Date");

            try (Connection conn = DatabaseConnection_1.getConnection()) {
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT bookingID, userID, pickupLocation, dropLocation, carType, status, date FROM bookings WHERE DATE(date) BETWEEN ? AND ?");
                stmt.setString(1, fromDate);
                stmt.setString(2, toDate);
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {
                    out.println(rs.getInt("bookingID") + ","
                            + rs.getInt("userID") + ","
                            + escapeCSV(rs.getString("pickupLocation")) + ","
                            + escapeCSV(rs.getString("dropLocation")) + ","
                            + rs.getString("carType") + ","
                            + rs.getString("status") + ","
                            + rs.getString("date"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Helper method to format CSV values and handle commas
    private static String escapeCSV(String value) {
        if (value == null) return "";
        if (value.contains(",")) {
            return "\"" + value + "\""; // Enclose in quotes if it contains commas
        }
        return value;
    }
}
